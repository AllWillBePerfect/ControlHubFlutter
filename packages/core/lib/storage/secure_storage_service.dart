import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:core/utils/result.dart';

class SecureStorageService {
  SecureStorageService([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<Result<String?>> read(String key) => runCatching(() => _storage.read(key: key));

  Future<Result<void>> write(String key, String value) =>
      runCatching(() => _storage.write(key: key, value: value));

  Future<Result<void>> delete(String key) => runCatching(() => _storage.delete(key: key));
}
