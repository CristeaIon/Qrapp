import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoService {
  DeviceInfoPlugin _plugin = DeviceInfoPlugin();

  Future getDeviceInfo() async {
    if (Platform.isAndroid) {
      final _deviceInfo = await _plugin.androidInfo;
      final deviceInfo = {
        'systemVersion': _deviceInfo.version.release,
        'version.incremental': _deviceInfo.version.incremental,
        'name': _deviceInfo.manufacturer,
        'model': _deviceInfo.model,
      };
      return deviceInfo;
    }
    if (Platform.isIOS) {
      final _deviceInfo = await _plugin.iosInfo;

      final deviceInfo = {
        'name': _deviceInfo.name,
        'systemName': _deviceInfo.systemName,
        'systemVersion': _deviceInfo.systemVersion,
        'model': _deviceInfo.model,
      };
      return deviceInfo;
    }
  }
}