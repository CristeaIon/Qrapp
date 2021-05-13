import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_discount/domain/settings/settings.dart';
import 'package:my_discount/infrastructure/settings/settings_Impl.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppSettings _settings;
  SettingsBloc(this._settings)
      : super(SettingsInitial(_settings.getSettings()));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is NotificationStateChanged) {
      final settings =
          _settings.getSettings().copyWith(notificationEnabled: event.isActive);
      yield SettingsInitial(settings);
      _settings.setSettings(settings);
    }
    if (event is NewsStateChanged) {
      final settings =
          _settings.getSettings().copyWith(newsEnabled: event.isActive);
      yield SettingsInitial(settings);
      _settings.setSettings(settings);
    }
  }
}
