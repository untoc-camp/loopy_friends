import 'package:get/get.dart';

class MyBottomNavgationBarController extends GetxController {
  // Get.fine 대신 클래스명 사용 가능
  static MyBottomNavgationBarController get to => Get.find();

  // 현재 선택된 탭 아이템 번호 저장
  final RxInt selectedIndex = 0.obs;

  // 탭 이벤트가 발생할 시 selectedIndex값을 변경해줄 함수
  void changeIndex(int index) {
    selectedIndex(index);
    switch (index) {
      case 0:
        Get.toNamed('/main');
        break;
      case 1:
        Get.toNamed('/notice');
        break;
      case 2:
        Get.toNamed('/community');
        break;
      case 3:
        Get.toNamed('/setting');
        break;
    }
  }
}
