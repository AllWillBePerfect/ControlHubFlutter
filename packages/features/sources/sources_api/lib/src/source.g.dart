// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Source _$SourceFromJson(Map<String, dynamic> json) => _Source(
  id: json['id'] as String,
  name: json['name'] as String,
  host: json['host'] as String,
  port: (json['port'] as num).toInt(),
);

Map<String, dynamic> _$SourceToJson(_Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'host': instance.host,
  'port': instance.port,
};
