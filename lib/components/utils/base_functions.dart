part of 'utils.dart';

final String defaultSystemLocale = Platform.localeName.split('_').first;

String get defaultLocale => switch (defaultSystemLocale) {
      'ru' => 'ru',
      'en' => 'en',
      'uz' => 'uz',
      _ => 'ru',
    };

String get defaultTheme =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness.name;

String phoneFormat(String phone) {
  if (phone.length >= 13) {
    String t = phone;
    t = t.replaceAll('+998', '');
    t = '${t.substring(0, 2)} ${t.substring(2, 5)} ${t.substring(5, 7)} ${t.substring(7, 9)}';
    return '+998 $t';
  } else {
    return phone;
  }
}

Future<DeviceInformation> deviceInfo() async {
  if (Platform.isAndroid) {
    final device = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await device.androidInfo;
    return DeviceInformation(
      deviceName: androidInfo.model,
      deviceId: androidInfo.id,
    );
  } else {
    final device = DeviceInfoPlugin();
    final IosDeviceInfo iosInfo = await device.iosInfo;
    return DeviceInformation(
      deviceName: iosInfo.name,
      deviceId: '${iosInfo.identifierForVendor}',
    );
  }
}

class DeviceInformation {
  DeviceInformation({
    required this.deviceName,
    required this.deviceId,
  });

  final String deviceName;
  final String deviceId;
}
