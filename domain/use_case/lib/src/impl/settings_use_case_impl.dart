import '../settings_use_case.dart';
import 'package:app_settings/app_settings.dart';

class OpenAppSettingsImpl extends OpenAppSettings {

  @override
  Future<void> location() {
    return AppSettings.openAppSettings();
  }

}