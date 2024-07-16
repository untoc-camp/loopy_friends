import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loopy_friends/model/user_info.dart';
import '../constants/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SettingPageController extends GetxController {
  var realname = ''.obs;
  var nickname = ''.obs;

  @override
  void onInit() {
    super.onInit();
    showInfo();
  }

  Future<void> deleteTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  Future<void> logout() async {
    await deleteTokens();
    Get.offAllNamed('/login');
  }

  Future<void> showInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    String apiUrl = '${Urls.apiUrl}users/info';
    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',}
      );

      if (response.statusCode == 200) {
        String bodyUtf8 = utf8.decode(response.bodyBytes);
        var data = User_info.fromJson(json.decode(bodyUtf8));
        realname.value = data.realname;
        nickname.value = data.nickname;
      } else {
    
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to connect to the server',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
