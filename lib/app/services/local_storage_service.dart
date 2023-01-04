import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class LocalStorageService {
  static final _localStorage = Get.find<FlutterSecureStorage>();

  static Future<void> set({
    required String key,
    required String value,
  }) async {
    await _localStorage.write(key: key, value: value);
  }

  static Future<String> get({
    required String key,
  }) async {
    return await _localStorage.read(key: key) ?? "";
  }
}
