import 'package:get/get.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';
import 'package:loopy_friends/controller/notice_list_controller.dart';
import 'package:loopy_friends/controller/write_page_controller.dart';

class MyBottomNavgationBarController extends GetxController {
  final NoticeController noticeController = Get.put(NoticeController());
  final NoticeTop5Controller noticeTop5Controller = Get.put(NoticeTop5Controller());
  final PostController postController = Get.put(PostController());

  static MyBottomNavgationBarController get to => Get.find();

  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
    switch (index) {
      case 0:
        Get.toNamed('/main');
        refreshMain();
        break;
      case 1:
        Get.toNamed('/notice');
        refreshNotice();
        break;
      case 2:
        Get.toNamed('/community');
        refreshPost();
        break;
      case 3:
        Get.toNamed('/setting');
        break;
    }
  }

  void refreshMain() {
    noticeTop5Controller.fetchNoticeTop5();
  }

  void refreshNotice() {
    noticeController.refreshData('totalCouncil');
    noticeController.refreshData('departmentCouncil');
    noticeController.refreshData('departmentNotice');
    noticeController.refreshData('applyRecruit');
  }

  void refreshPost() {
    postController.fetchPosts();
  }
}
