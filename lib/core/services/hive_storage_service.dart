import 'package:flutx_core/core/debug_print.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorageService {
  // Private constructor
  HiveStorageService._internal();

  // Singleton instance
  static final HiveStorageService _instance = HiveStorageService._internal();

  // Public factory constructor
  factory HiveStorageService() => _instance;

  // Default box name (you can change or make it configurable)
  static const String _defaultBox = 'app_box';

  late Box _box;

  /// Initialize Hive and open the default box
  /// Call this in main() before runApp()
  static Future<void> init() async {
    await Hive.initFlutter();

    // Optional: Register adapters here if using custom objects
    // Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(SettingsAdapter());

    final instance = HiveStorageService();
    instance._box = await Hive.openBox(_defaultBox);
    DPrint.log("HiveStorageService initialized successfully");
  }

  // Helper to get the box
  Box get box => _box;

  /// Store any value by key (String, int, bool, double, List, Map, etc.)
  Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
    DPrint.log("Hive: Stored [$key] = $value");
  }

  /// Retrieve value by key with optional default
  T get<T>(String key, {T? defaultValue}) {
    final value = _box.get(key, defaultValue: defaultValue);
    DPrint.log("Hive: Retrieved [$key] = $value");
    return value;
  }

  /// Check if key exists
  bool containsKey(String key) => _box.containsKey(key);

  /// Delete single key
  Future<void> delete(String key) async {
    await _box.delete(key);
    DPrint.log("Hive: Deleted key [$key]");
  }

  /// Delete multiple keys
  Future<void> deleteMany(List<String> keys) async {
    await _box.deleteAll(keys);
    DPrint.log("Hive: Deleted keys: $keys");
  }

  /// Clear entire box
  Future<void> clear() async {
    await _box.clear();
    DPrint.log("Hive: Cleared all data");
  }

  /// Close all boxes (call on app close if needed)
  static Future<void> close() async {
    await Hive.close();
    DPrint.log("Hive: All boxes closed");
  }
}
