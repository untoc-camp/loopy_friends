import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loopy_friends/model/community_post_model.dart';
import '../../constants/url.dart';

class MyWrittenPostController extends GetxController {
  var posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMyPosts();
  }

  Future<void> loadMyPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken == null) {
      Get.offAllNamed('/login');
      return;
    }

    final url = '${Urls.apiUrl}posts/mywrite';
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final responseData =
            jsonDecode(utf8.decode(response.bodyBytes)) as List;
        posts.value =
            responseData.map((post) => Post.fromJson(post)).toList();
      } else {
        print('Failed to fetch posts: ${response.statusCode}');
        Get.snackbar('오류', '게시글 목록을 불러오는 데 실패했습니다.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('오류', '네트워크 오류가 발생했습니다.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> deletePost(int postId, int index) async {
    final url = '${Urls.apiUrl}posts/$postId';
    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        posts.removeAt(index);
        Get.snackbar('성공', '게시글 삭제에 성공했습니다.',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        print('Failed to delete post: ${response.statusCode}');
        Get.snackbar('오류', '게시글 삭제에 실패했습니다.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('오류', '네트워크 오류가 발생했습니다.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
