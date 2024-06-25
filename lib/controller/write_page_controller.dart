import 'package:get/get.dart';
import 'package:loopy_friends/model/write_page_model.dart';

class PostController extends GetxController {
  var posts = <Post>[].obs;

  void addPost(String title, String content) {
    posts.add(Post(title: title, content: content, timestamp: DateTime.now()));
  }
}
