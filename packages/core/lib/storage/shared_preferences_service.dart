import 'package:shared_preferences/shared_preferences.dart';

import 'package:core/utils/result.dart';

class SharedPreferencesService {
  Future<Result<String?>> getString(String key) => runCatching(() async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.getString(key);
      });

  Future<Result<void>> setString(String key, String value) => runCatching(() async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(key, value);
      });
}
