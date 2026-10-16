import 'package:core/storage/storage_providers.dart';
import 'package:sources_api/sources_api.dart';
import 'package:sources_impl/sources_impl.dart';

final overrides = [
  sourcesRepositoryProvider.overrideWith(
    (ref) => SourcesRepositoryLocal(
      preferences: ref.watch(sharedPreferencesServiceProvider),
      secureStorage: ref.watch(secureStorageServiceProvider),
    ),
  ),
];

final overridesDevelopment = [...overrides];
