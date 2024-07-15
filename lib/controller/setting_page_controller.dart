import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPageController extends GetxController {
  Future<void> deleteTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  Future<void> logout() async {
    await deleteTokens();
    Get.offAllNamed('/login');
  }
}
