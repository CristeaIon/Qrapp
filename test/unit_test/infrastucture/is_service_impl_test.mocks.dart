// Mocks generated by Mockito 5.0.7 from annotations
// in my_discount/test/unit_test/infrastucture/is_service_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;

import 'package:is_service/service_client_response.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:my_discount/infrastructure/core/formater.dart' as _i13;
import 'package:my_discount/infrastructure/core/internet_connection_service.dart' as _i7;
import 'package:my_discount/domain/data_source/remote_datasource.dart' as _i14;
import 'package:my_discount/domain/entities/company_model.dart' as _i12;
import 'package:my_discount/domain/entities/news_model.dart' as _i11;
import 'package:my_discount/domain/entities/profile_model.dart' as _i3;
import 'package:my_discount/domain/entities/user_model.dart' as _i4;
import 'package:my_discount/domain/repositories/local_repository.dart' as _i10;
import 'package:my_discount/domain/settings/settings.dart' as _i2;

import 'package:my_discount/infrastructure/settings/settings_Impl.dart' as _i6;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeSettings extends _i1.Fake implements _i2.Settings {
  @override
  bool get newsEnabled => true;
}

class _FakeProfile extends _i1.Fake implements _i3.Profile {}

class _FakeUser extends _i1.Fake implements _i4.User {}

class _FakeIsResponse extends _i1.Fake implements _i5.IsResponse {}

/// A class which mocks [IsResponse].
///
/// See the documentation for Mockito's code generation for more information.
class MockIsResponse extends _i1.Mock implements _i5.IsResponse {
  MockIsResponse() {
    _i1.throwOnMissingStub(this);
  }
}

/// A class which mocks [AppSettings].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppSettings extends _i1.Mock implements _i6.AppSettings {
  MockAppSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Settings getSettings() =>
      (super.noSuchMethod(Invocation.method(#getSettings, []),
          returnValue: _FakeSettings()) as _i2.Settings);
  @override
  void setSettings(_i2.Settings? settings) =>
      super.noSuchMethod(Invocation.method(#setSettings, [settings]),
          returnValueForMissingStub: null);
}

/// A class which mocks [NetworkConnection].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkConnection extends _i1.Mock implements _i7.NetworkConnection {
  MockNetworkConnection() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
}

/// A class which mocks [RemoteConfigService].
///
/// See the documentation for Mockito's code generation for more information.


/// A class which mocks [LocalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalRepository extends _i1.Mock implements _i10.LocalRepository {
  MockLocalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void saveNewsLocal(List<dynamic>? newsList) =>
      super.noSuchMethod(Invocation.method(#saveNewsLocal, [newsList]),
          returnValueForMissingStub: null);
  @override
  List<_i11.News> getLocalNews() =>
      (super.noSuchMethod(Invocation.method(#getLocalNews, []),
          returnValue: <_i11.News>[]) as List<_i11.News>);
  @override
  String readEldestNewsId() =>
      (super.noSuchMethod(Invocation.method(#readEldestNewsId, []),
          returnValue: '') as String);
  @override
  void deleteNews() => super.noSuchMethod(Invocation.method(#deleteNews, []),
      returnValueForMissingStub: null);
  @override
  _i8.Future<List<_i12.Company>> getSavedCompany(String? pattern) =>
      (super.noSuchMethod(Invocation.method(#getSavedCompany, [pattern]),
              returnValue: Future<List<_i12.Company>>.value(<_i12.Company>[]))
          as _i8.Future<List<_i12.Company>>);
  @override
  void saveCompanyListLocal(List<_i12.Company>? list) =>
      super.noSuchMethod(Invocation.method(#saveCompanyListLocal, [list]),
          returnValueForMissingStub: null);
  @override
  List<_i12.Company> searchCompany(String? pattern) =>
      (super.noSuchMethod(Invocation.method(#searchCompany, [pattern]),
          returnValue: <_i12.Company>[]) as List<_i12.Company>);
  @override
  _i8.Future<Map<String, dynamic>> returnProfileMapDataAsMap(
          _i3.Profile? profile) =>
      (super.noSuchMethod(
              Invocation.method(#returnProfileMapDataAsMap, [profile]),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i8.Future<Map<String, dynamic>>);
  @override
  void saveClientInfoLocal(_i3.Profile? profile) =>
      super.noSuchMethod(Invocation.method(#saveClientInfoLocal, [profile]),
          returnValueForMissingStub: null);
  @override
  _i3.Profile getLocalClientInfo() =>
      (super.noSuchMethod(Invocation.method(#getLocalClientInfo, []),
          returnValue: _FakeProfile()) as _i3.Profile);
  @override
  void saveUserLocal(_i4.User? user) =>
      super.noSuchMethod(Invocation.method(#saveUserLocal, [user]),
          returnValueForMissingStub: null);
  @override
  void deleteLocalUser() =>
      super.noSuchMethod(Invocation.method(#deleteLocalUser, []),
          returnValueForMissingStub: null);
  @override
  _i4.User getLocalUser() =>
      (super.noSuchMethod(Invocation.method(#getLocalUser, []),
          returnValue: _FakeUser()) as _i4.User);
  @override
  Map<String, dynamic> returnUserMapToSave(Map<String, dynamic>? json) =>
      (super.noSuchMethod(Invocation.method(#returnUserMapToSave, [json]),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  bool smsCodeVerification(String? serverCode, String? userCode) =>
      (super.noSuchMethod(
          Invocation.method(#smsCodeVerification, [serverCode, userCode]),
          returnValue: false) as bool);
}

/// A class which mocks [Formater].
///
/// See the documentation for Mockito's code generation for more information.
class MockFormater extends _i1.Mock implements _i13.Formater {
  MockFormater() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<Map<String, dynamic>> deleteImageFormatAndDecode(
          List<dynamic>? list, String? index) =>
      (super.noSuchMethod(
          Invocation.method(#deleteImageFormatAndDecode, [list, index]),
          returnValue: <Map<String, dynamic>>[]) as List<Map<String, dynamic>>);
  @override
  List<dynamic> parseDateTime(List<dynamic>? list, String? index) =>
      (super.noSuchMethod(Invocation.method(#parseDateTime, [list, index]),
          returnValue: <dynamic>[]) as List<dynamic>);
  @override
  Map<String, dynamic> splitDisplayName(Map<dynamic, dynamic>? map) =>
      (super.noSuchMethod(Invocation.method(#splitDisplayName, [map]),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  _i8.Future<Map<String, dynamic>> downloadProfileImageOrDecodeString(
          Map<String, dynamic>? map) =>
      (super.noSuchMethod(
              Invocation.method(#downloadProfileImageOrDecodeString, [map]),
              returnValue:
                  Future<Map<String, dynamic>>.value(<String, dynamic>{}))
          as _i8.Future<Map<String, dynamic>>);
  @override
  Map<String, dynamic> addToProfileMapSignMethod(
          Map<String, dynamic>? map, int? registerMode) =>
      (super.noSuchMethod(
          Invocation.method(#addToProfileMapSignMethod, [map, registerMode]),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  /* @override
  List<dynamic> checkCompanyLogo(List<dynamic>? list) =>
      (super.noSuchMethod(Invocation.method(#checkCompanyLogo, [list]),
          returnValue: <dynamic>[]) as List<dynamic>); */
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i14.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i5.IsResponse> getRequest(String? urlFragment) =>
      (super.noSuchMethod(Invocation.method(#getRequest, [urlFragment]),
              returnValue: Future<_i5.IsResponse>.value(_FakeIsResponse()))
          as _i8.Future<_i5.IsResponse>);
  @override
  _i8.Future<_i5.IsResponse> postRequest(
          {Map<String, dynamic>? json, String? urlFragment}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #postRequest, [], {#json: json, #urlFragment: urlFragment}),
              returnValue: Future<_i5.IsResponse>.value(_FakeIsResponse()))
          as _i8.Future<_i5.IsResponse>);
}

/// A class which mocks [User].
///
/// See the documentation for Mockito's code generation for more information.
class MockUser extends _i1.Mock implements _i4.User {
  MockUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id =>
      (super.noSuchMethod(Invocation.getter(#id), returnValue: '') as String);
  @override
  String get accessToken =>
      (super.noSuchMethod(Invocation.getter(#accessToken), returnValue: '')
          as String);
  @override
  int get registerMode =>
      (super.noSuchMethod(Invocation.getter(#registerMode), returnValue: 0)
          as int);
  @override
  bool get isEmpty =>
      (super.noSuchMethod(Invocation.getter(#isEmpty), returnValue: false)
          as bool);
  @override
  int get hashCode =>
      (super.noSuchMethod(Invocation.getter(#hashCode), returnValue: 0) as int);
  @override
  Map<String, dynamic> toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []),
          returnValue: <String, dynamic>{}) as Map<String, dynamic>);
  @override
  bool operator ==(Object? other) =>
      (super.noSuchMethod(Invocation.method(#==, [other]), returnValue: false)
          as bool);
}

/// A class which mocks [Settings].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettings extends _i1.Mock implements _i2.Settings {
  MockSettings() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get notificationEnabled =>
      (super.noSuchMethod(Invocation.getter(#notificationEnabled),
          returnValue: false) as bool);
  @override
  set notificationEnabled(bool? _notificationEnabled) => super.noSuchMethod(
      Invocation.setter(#notificationEnabled, _notificationEnabled),
      returnValueForMissingStub: null);
  @override
  bool get newsEnabled =>
      (super.noSuchMethod(Invocation.getter(#newsEnabled), returnValue: false)
          as bool);
  @override
  set newsEnabled(bool? _newsEnabled) =>
      super.noSuchMethod(Invocation.setter(#newsEnabled, _newsEnabled),
          returnValueForMissingStub: null);
  @override
  _i2.Settings copyWith(
          {bool? notificationEnabled, bool? newsEnabled, String? locale}) =>
      (super.noSuchMethod(
          Invocation.method(#copyWith, [], {
            #notificationEnabled: notificationEnabled,
            #newsEnabled: newsEnabled,
            #locale: locale
          }),
          returnValue: _FakeSettings()) as _i2.Settings);
}
