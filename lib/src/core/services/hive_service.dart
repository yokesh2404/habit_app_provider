import 'package:hive/hive.dart';

import '../core.dart';

class HiveService {
  static final _hiveBox = Hive.box(AppConfigs.hiveBoxName);

  static Future<void> storeData({required String key, dynamic value}) async {
    await _hiveBox.put(key, value);
  }

  static T? get<T>({required String key, dynamic defaultValue}) {
    return _hiveBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> delete(String key) async {
    await _hiveBox.delete(key);
  }

  static bool contains(String key) {
    return _hiveBox.containsKey(key);
  }

  static Future<void> clearAll() async {
    await _hiveBox.clear();
  }

  static Future<void> updateJson({
    required String key,
    required Map<String, dynamic> newData,
  }) async {
    final existingData = get<Map<String, dynamic>>(key: key);

    final Map<String, dynamic> mapToUpdate =
        (existingData is Map<String, dynamic>)
        ? Map<String, dynamic>.from(existingData)
        : {};

    mapToUpdate.addAll(newData);

    await storeData(key: key, value: mapToUpdate);
  }

  static bool get isLoggedIn => get(key: AppConfigs.isLoggedIn) ?? false;
}
