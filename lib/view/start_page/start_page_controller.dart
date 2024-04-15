
import 'package:get/get.dart';

class StartPageController extends GetxController {
  void loginNav() {
    Get.toNamed('/login');
  }

  void signUpNav() {
    Get.toNamed('/signup');
  }
}
