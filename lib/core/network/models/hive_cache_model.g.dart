// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveCacheModel _$HiveCacheModelFromJson(Map<String, dynamic> json) =>
    HiveCacheModel(
      responseBody: json['responseBody'] as String,
      dataType: json['dataType'] as String,
      statusCode: (json['statusCode'] as num).toInt(),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
      lastAccessedAt: DateTime.parse(json['lastAccessedAt'] as String),
      size: (json['size'] as num).toInt(),
      etag: json['etag'] as String?,
      lastModified: json['lastModified'] as String?,
    );

Map<String, dynamic> _$HiveCacheModelToJson(HiveCacheModel instance) =>
    <String, dynamic>{
      'responseBody': instance.responseBody,
      'dataType': instance.dataType,
      'statusCode': instance.statusCode,
      'cachedAt': instance.cachedAt.toIso8601String(),
      'lastAccessedAt': instance.lastAccessedAt.toIso8601String(),
      'size': instance.size,
      'etag': instance.etag,
      'lastModified': instance.lastModified,
    };
