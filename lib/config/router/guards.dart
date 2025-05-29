import 'package:template/data/caching/secure_storage_helper.dart';
import 'package:template/data/caching/shared_prefs_helper.dart';

class AuthService {
  static Future<bool> checkAuth() async {
    await SharedPrefsHelper.init();

    final isSignedUp = SharedPrefsHelper.getBool('isSignedUp') ?? false;
    final isLoggedIn = SharedPrefsHelper.getBool('isLoggedIn') ?? false;

    return isSignedUp && isLoggedIn;
  }

  static Future<bool> hasSignedUp() async {
    await SharedPrefsHelper.init();
    return SharedPrefsHelper.getBool('isSignedUp') ?? false;
  }

  static Future<bool> login(String email, String password) async {
    final storedEmail = await SecureStorageHelper.read('email');
    final storedPassword = await SecureStorageHelper.read('password');

    final match = email == storedEmail && password == storedPassword;
    if (match) {
      await SharedPrefsHelper.setBool('isLoggedIn', true);
    }
    return match;
  }

  static Future<void> logout() async {
    await SharedPrefsHelper.setBool('isLoggedIn', false);
  }
}
