import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'secure_storage_service.dart';
import 'shared_preferences_service.dart';

final sharedPreferencesServiceProvider =
    Provider((ref) => SharedPreferencesService());

final secureStorageServiceProvider =
    Provider((ref) => SecureStorageService());
