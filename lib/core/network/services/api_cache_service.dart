import 'dart:convert';
import 'package:flutx_core/core/debug_print.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Service for handling API response caching with Hive
class ApiCacheService {
  static const String _cacheBoxName = 'api_cache_box';
  static const String _cacheDurationKey = 'cache_duration_';
  static const Duration _defaultCacheDuration = Duration(hours: 24);

  // Singleton instance
  static final ApiCacheService _instance = ApiCacheService._internal();
  factory ApiCacheService() => _instance;

  ApiCacheService._internal();

  late Box _cacheBox;
  bool _isInitialized = false;

  /// Initialize cache box - call this in main() after HiveStorageService.init()
  Future<void> initialize() async {
    try {
      if (_isInitialized) return;

      if (!Hive.isBoxOpen(_cacheBoxName)) {
        _cacheBox = await Hive.openBox(_cacheBoxName);
      } else {
        _cacheBox = Hive.box(_cacheBoxName);
      }

      _isInitialized = true;
      DPrint.info('ApiCacheService initialized successfully');
    } catch (e) {
      DPrint.error('Failed to initialize ApiCacheService: $e');
      rethrow;
    }
  }

  /// Generate a cache key from endpoint and parameters
  String _generateCacheKey(String endpoint, {dynamic requestData}) {
    final encodedData = requestData != null ? jsonEncode(requestData) : '';
    return 'api_$endpoint$encodedData';
  }

  /// Cache API response with optional expiration duration
  Future<void> cacheData(
    String endpoint, {
    required dynamic data,
    dynamic requestData,
    Duration? cacheDuration,
  }) async {
    try {
      if (!_isInitialized) {
        DPrint.warn('ApiCacheService not initialized');
        return;
      }

      final cacheKey = _generateCacheKey(endpoint, requestData: requestData);
      final durationKey = '$_cacheDurationKey$cacheKey';
      final duration = cacheDuration ?? _defaultCacheDuration;

      // Store the data
      await _cacheBox.put(cacheKey, jsonEncode(data));

      // Store expiration timestamp
      final expirationTime =
          DateTime.now().add(duration).millisecondsSinceEpoch;
      await _cacheBox.put(durationKey, expirationTime);

      DPrint.info(
        'Cached data for endpoint: $endpoint (expires in ${duration.inHours}h)',
      );
    } catch (e) {
      DPrint.error('Error caching data: $e');
    }
  }

  /// Retrieve cached data if valid (not expired)
  Future<dynamic> getCachedData(
    String endpoint, {
    dynamic requestData,
  }) async {
    try {
      if (!_isInitialized) {
        return null;
      }

      final cacheKey = _generateCacheKey(endpoint, requestData: requestData);
      final durationKey = '$_cacheDurationKey$cacheKey';

      // Check if cache exists
      if (!_cacheBox.containsKey(cacheKey)) {
        return null;
      }

      // Check if cache is expired
      final expirationTime =
          _cacheBox.get(durationKey) as int?;
      if (expirationTime != null) {
        final isExpired = DateTime.now().millisecondsSinceEpoch > expirationTime;
        if (isExpired) {
          // Delete expired cache
          await clearCache(endpoint, requestData: requestData);
          DPrint.warn(
            'Cache expired for endpoint: $endpoint',
          );
          return null;
        }
      }

      // Return cached data
      final cachedJson = _cacheBox.get(cacheKey) as String?;
      if (cachedJson != null) {
        DPrint.info('Retrieved cached data for endpoint: $endpoint');
        return jsonDecode(cachedJson);
      }

      return null;
    } catch (e) {
      DPrint.error('Error retrieving cached data: $e');
      return null;
    }
  }

  /// Check if cached data exists and is valid
  Future<bool> isCacheValid(
    String endpoint, {
    dynamic requestData,
  }) async {
    try {
      if (!_isInitialized) {
        return false;
      }

      final cacheKey = _generateCacheKey(endpoint, requestData: requestData);
      final durationKey = '$_cacheDurationKey$cacheKey';

      if (!_cacheBox.containsKey(cacheKey)) {
        return false;
      }

      final expirationTime =
          _cacheBox.get(durationKey) as int?;
      if (expirationTime != null) {
        return DateTime.now().millisecondsSinceEpoch <= expirationTime;
      }

      return true;
    } catch (e) {
      DPrint.error('Error checking cache validity: $e');
      return false;
    }
  }

  /// Clear cache for specific endpoint
  Future<void> clearCache(
    String endpoint, {
    dynamic requestData,
  }) async {
    try {
      final cacheKey = _generateCacheKey(endpoint, requestData: requestData);
      final durationKey = '$_cacheDurationKey$cacheKey';

      await _cacheBox.delete(cacheKey);
      await _cacheBox.delete(durationKey);

      DPrint.info('Cleared cache for endpoint: $endpoint');
    } catch (e) {
      DPrint.error('Error clearing cache: $e');
    }
  }

  /// Clear all cached data
  Future<void> clearAllCache() async {
    try {
      await _cacheBox.clear();
      DPrint.info('Cleared all cached data');
    } catch (e) {
      DPrint.error('Error clearing all cache: $e');
    }
  }

  /// Get cache size information
  int getCacheSize() => _cacheBox.length;
}
