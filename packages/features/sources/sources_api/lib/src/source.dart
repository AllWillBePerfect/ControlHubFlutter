import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';
part 'source.g.dart';

@freezed
abstract class Source with _$Source {
  const factory Source({
    required String id,
    required String name,
    required String host,
    required int port,
  }) = _Source;

  factory Source.fromJson(Map<String, Object?> json) => _$SourceFromJson(json);

  static String idFor(String host, int port) => '$host:$port';
}
