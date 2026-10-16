import 'package:core/utils/result.dart';

import 'source.dart';

abstract class SourcesRepository {
  Future<Result<List<Source>>> getAll();

  Future<Result<void>> save(Source source, {required String token});

  Future<Result<void>> remove(String id);

  Future<Result<String>> getToken(String id);
}
