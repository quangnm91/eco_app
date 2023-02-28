import '../core/utils/secure_storage_helper.dart';
import 'config_key.dart';

class Common {
  static Future<String?> getAPIUrl() async {
    return await SecureStorageHelper.readString(ConfigKey.apiUrl);
  }
}
