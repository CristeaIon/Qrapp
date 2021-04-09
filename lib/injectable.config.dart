// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:device_info/device_info.dart' as _i9;
import 'package:firebase_messaging/firebase_messaging.dart' as _i11;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i14;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i15;
import 'package:is_service/service_client.dart' as _i21;

import 'aplication/auth/auth_bloc.dart' as _i23;
import 'aplication/auth/sign_in/sign_form_bloc.dart' as _i34;
import 'aplication/card_bloc/add_card_page_bloc.dart' as _i31;
import 'aplication/phone_validation_bloc/phone_validation_bloc.dart' as _i29;
import 'aplication/profile_bloc/profile_form_bloc.dart' as _i30;
import 'core/constants/credentials.dart' as _i8;
import 'core/formater.dart' as _i13;
import 'core/internet_connection_service.dart' as _i19;
import 'domain/data_source/remote_datasource.dart' as _i25;
import 'domain/entities/company_model.dart' as _i7;
import 'domain/entities/news_model.dart' as _i6;
import 'domain/entities/profile_model.dart' as _i5;
import 'domain/entities/user_model.dart' as _i4;
import 'domain/repositories/auth_repository.dart' as _i32;
import 'domain/repositories/is_service_repository.dart' as _i27;
import 'domain/repositories/local_repository.dart' as _i17;
import 'infrastructure/auth_repository_impl.dart' as _i33;
import 'infrastructure/core/services_injectable.dart' as _i35;
import 'infrastructure/is_service_impl.dart' as _i28;
import 'infrastructure/local_repository_impl.dart' as _i18;
import 'infrastructure/remote_datasource_impl.dart/remote_datasource_impl.dart'
    as _i26;
import 'services/device_info_service.dart' as _i10;
import 'services/fcm_service.dart' as _i24;
import 'services/local_notification_service.dart' as _i16;
import 'services/remote_config_service.dart' as _i20;
import 'services/shared_preferences_service.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
// ignore: comment_references
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceInjectableModule = _$ServiceInjectableModule();
  gh
    ..lazySingleton<_i3.Box<_i4.User>>(() => serviceInjectableModule.userBox)
    ..lazySingleton<_i3.Box<_i5.Profile>>(
        () => serviceInjectableModule.profileBox)
    ..lazySingleton<_i3.Box<_i6.News>>(() => serviceInjectableModule.newsBox)
    ..lazySingleton<_i3.Box<_i7.Company>>(
        () => serviceInjectableModule.companyBox)
    ..lazySingleton<_i8.Credentials>(() => serviceInjectableModule.credentials)
    ..lazySingleton<_i9.DeviceInfoPlugin>(
        () => serviceInjectableModule.deviceinfo)
    ..factory<_i10.DeviceInfoService>(
        () => _i10.DeviceInfoService(get<_i9.DeviceInfoPlugin>()))
    ..lazySingleton<_i11.FirebaseMessaging>(() => serviceInjectableModule.fcm)
    ..lazySingleton<_i12.FlutterLocalNotificationsPlugin>(
        () => serviceInjectableModule.flutterLocalNotification)
    ..lazySingleton<_i13.Formater>(() => serviceInjectableModule.formater)
    ..lazySingleton<_i14.GoogleSignIn>(
        () => serviceInjectableModule.googleSignIn)
    ..lazySingleton<_i15.InternetConnectionChecker>(
        () => serviceInjectableModule.connectionChecker)
    ..factory<_i16.LocalNotificationsService>(() =>
        _i16.LocalNotificationsService(
            get<_i12.FlutterLocalNotificationsPlugin>()))
    ..lazySingleton<_i17.LocalRepository>(() => _i18.LocalRepositoryImpl(
        get<_i3.Box<_i4.User>>(),
        get<_i3.Box<_i5.Profile>>(),
        get<_i3.Box<_i6.News>>(),
        get<_i3.Box<_i7.Company>>()))
    ..lazySingleton<_i19.NetworkConnection>(() => _i19.NetworkConnectionImpl(
        connectionChecker: get<_i15.InternetConnectionChecker>()))
    ..lazySingleton<_i20.RemoteConfigService>(() => serviceInjectableModule.remoteConfig)
    ..lazySingleton<_i21.ServiceClient>(() => serviceInjectableModule.client)
    ..lazySingleton<_i22.SharedPref>(() => serviceInjectableModule.network)
    ..factory<_i23.AuthBloc>(() => _i23.AuthBloc(get<_i17.LocalRepository>()))
    ..factory<_i24.FirebaseCloudMessageService>(() => _i24.FirebaseCloudMessageService(
          get<_i11.FirebaseMessaging>(),
          get<_i16.LocalNotificationsService>(),
          get<_i22.SharedPref>(),
        ))
    ..lazySingleton<_i25.RemoteDataSource>(() => _i26.RemoteDataSourceImpl(
          get<_i21.ServiceClient>(),
          get<_i20.RemoteConfigService>(),
          get<_i19.NetworkConnection>(),
        ))
    ..lazySingleton<_i27.IsService>(() => _i28.IsServiceImpl(
          get<_i17.LocalRepository>(),
          get<_i13.Formater>(),
          get<_i25.RemoteDataSource>(),
        ))
    ..factory<_i29.PhoneValidationBloc>(() => _i29.PhoneValidationBloc(
          get<_i27.IsService>(),
          get<_i17.LocalRepository>(),
        ))
    ..factory<_i30.ProfileFormBloc>(() => _i30.ProfileFormBloc(
          get<_i17.LocalRepository>(),
          get<_i27.IsService>(),
        ))
    ..factory<_i31.AddCardPageBloc>(() => _i31.AddCardPageBloc(
          get<_i27.IsService>(),
          get<_i17.LocalRepository>(),
        ))
    ..lazySingleton<_i32.AuthRepository>(() => _i33.AuthRepositoryImpl(
          get<_i14.GoogleSignIn>(),
          get<_i27.IsService>(),
          get<_i17.LocalRepository>(),
        ))
    ..factory<_i34.SignFormBloc>(() => _i34.SignFormBloc(
          get<_i32.AuthRepository>(),
          get<_i19.NetworkConnection>(),
        ));
  return get;
}

class _$ServiceInjectableModule extends _i35.ServiceInjectableModule {}