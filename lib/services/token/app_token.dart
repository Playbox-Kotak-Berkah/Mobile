import 'package:get_storage/get_storage.dart';

class UserToken {
  static String getToken() {
    final storage = GetStorage();

    return storage.read('user_token') ?? '';
  }

  static Future<void> setToken(token) async {
    final storage = GetStorage();
    await storage.write('user_token', token);
    await storage.write('app_token', token);
  }

  static void clearToken() async {
    var storage = GetStorage();
    storage.remove("user_token");
  }

  static bool checkToken() {
    final storage = GetStorage();
    if (storage.read('user_token') == null ||
        storage.read('user_token') == "") {
      return false;
    }
    return true;
  }
}
