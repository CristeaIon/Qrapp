import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/localization/localizations.dart';
import '../../injectable.dart';
import '../../services/device_info_service.dart';
import '../widgets/custom_app_bar.dart';

class TechnicDetailPage extends StatefulWidget {
  const TechnicDetailPage();

  @override
  _TechnicDetailPageState createState() => _TechnicDetailPageState();
}

class _TechnicDetailPageState extends State<TechnicDetailPage> {
  @override
  void initState() {
    super.initState();
    getIt<DeviceInfoService>().getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    final String pageName = ModalRoute.of(context).settings.arguments;
    return CustomAppBar(
      title: pageName,
      child: Container(
        color: Colors.white,
        child: FutureBuilder(
            future: getIt<DeviceInfoService>().getDeviceInfo(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          if (Platform.isAndroid)
                            ListTile(
                              title: Text(AppLocalizations.of(context).translate('manufacture')),
                              trailing: Text('${snapshot.data['name']}'),
                            ),
                          ListTile(
                            title: Text(AppLocalizations.of(context).translate('model')),
                            trailing: Text('${snapshot.data['model']}'),
                          ),
                          ListTile(
                            title: Text(AppLocalizations.of(context).translate('version')),
                            trailing: Text('${snapshot.data['systemVersion']}'),
                          ),
                        ],
                      ),
                    )
                  : Container();
            }),
      ),
    );
  }
}