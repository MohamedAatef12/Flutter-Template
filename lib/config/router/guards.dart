class AuthService {
  static bool isLoggedIn = false; // Mock variable

  static Future<bool> checkAuth() async {
    // Simulate a delay for checking token
    await Future.delayed(const Duration(milliseconds: 300));
    return isLoggedIn;
  }
}
