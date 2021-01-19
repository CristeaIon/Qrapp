import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/constants/credentials.dart';
import '../core/formater.dart';
import '../models/news_model.dart';
import '../services/shared_preferences_service.dart';
import '../services/remote_config_service.dart';

class NewsService {
  SharedPref _prefs = SharedPref();
  Formater formater = Formater();
  Credentials credentials = Credentials();
  Box<News> newsBox = Hive.box<News>('news');

  Future<List<News>> getNews() async {
    if (await _prefs.readNewsState()) {
      final serviceName = await getServiceNameFromRemoteConfig();
      final id = await readEldestNewsId();
      final url = '$serviceName/json/GetAppNews?ID=$id';
      final response = await http.get(url, headers: credentials.header);
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      print(decodedResponse);

      final list = decodedResponse['NewsList'] as List;
      final parseDate =
          formater.parseDateTimeAndSetExpireDate(list, 'CreateDate');
      final dat = formater.checkImageFormatAndSkip(parseDate, 'CompanyLogo');

      final dataList = formater.checkImageFormatAndSkip(dat, 'Photo');
      dataList
          .map((e) => News.fromJson(e))
          .toList()
          .forEach((element) => saveNewsOnDB(element));
      return _getReversedNewsList();
    } else {
      final keys = newsBox.keys;
      if (newsBox.isNotEmpty) newsBox.deleteAll(keys);
      print('delete all news');
    }
    return [];
  }
/* https://api.edi.md/ISMobileDiscountService/json/GetAppNews?ID={ID}*/
  Future<String> readEldestNewsId() async {
    final listOfKeys = newsBox.keys;
    int id = 0;
    if (listOfKeys.isNotEmpty)
      for (int key in listOfKeys)
        if (key > id) {
          id = key;
        }
    return id.toString();
  }

  Future<void> saveNewsOnDB(News news) async {
    newsBox.put(news.id, news);

    print('companyBoxValue:$newsBox.values');
  }

  Future<List<News>> _getReversedNewsList() async {
    List<News> newsList = [];
    final keys = newsBox.keys;
    for (int key in keys) {
      final news = newsBox.get(key);
      newsList.add(news);
    }
    print(newsList.reversed.toList()[0].companyName);
    return newsList.reversed?.toList();
  }
}
