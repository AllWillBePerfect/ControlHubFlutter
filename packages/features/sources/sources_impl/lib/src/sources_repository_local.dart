import 'dart:convert';

import 'package:core/storage/secure_storage_service.dart';
import 'package:core/storage/shared_preferences_service.dart';
import 'package:core/utils/failure.dart';
import 'package:core/utils/result.dart';
import 'package:sources_api/sources_api.dart';

class SourcesRepositoryLocal implements SourcesRepository {
  SourcesRepositoryLocal({
    required this._preferences,
    required this._secureStorage,
  });

  final SharedPreferencesService _preferences;
  final SecureStorageService _secureStorage;

  static const _sourcesKey = 'sources';
  static String _tokenKey(String id) => 'token:$id';

  @override
  Future<Result<List<Source>>> getAll() async {
    final result = await _preferences.getString(_sourcesKey);
    return switch (result) {
      Ok(:final value) => _decode(value),
      Err(:final failure) => Result.error(failure),
    };
  }

  @override
  Future<Result<void>> save(Source source, {required String token}) async {
    final current = await getAll();
    if (current case Err(:final failure)) return Result.error(failure);

    final updated = [
      for (final s in current.valueOrNull!)
        if (s.id != source.id) s,
      source,
    ];
    final saved = await _write(updated);
    if (saved case Err(:final failure)) return Result.error(failure);

    return _secureStorage.write(_tokenKey(source.id), token);
  }

  @override
  Future<Result<void>> remove(String id) async {
    final current = await getAll();
    if (current case Err(:final failure)) return Result.error(failure);

    final saved = await _write([
      for (final s in current.valueOrNull!)
        if (s.id != id) s,
    ]);
    if (saved case Err(:final failure)) return Result.error(failure);

    return _secureStorage.delete(_tokenKey(id));
  }

  @override
  Future<Result<String>> getToken(String id) async {
    final result = await _secureStorage.read(_tokenKey(id));
    return switch (result) {
      Ok(value: final token?) when token.isNotEmpty => Result.ok(token),
      Ok() => const Result.error(UnauthorizedFailure()),
      Err(:final failure) => Result.error(failure),
    };
  }

  Result<List<Source>> _decode(String? raw) {
    if (raw == null) return const Result.ok([]);
    try {
      final list = (jsonDecode(raw) as List).cast<Map<String, Object?>>();
      return Result.ok([for (final json in list) Source.fromJson(json)]);
    } catch (e) {
      return Result.error(UnknownFailure(e));
    }
  }

  Future<Result<void>> _write(List<Source> sources) => _preferences.setString(
        _sourcesKey,
        jsonEncode([for (final s in sources) s.toJson()]),
      );
}
