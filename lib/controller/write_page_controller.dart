class PostController extends GetxController {
  var posts = <Post>[].obs;

  void addPost(Post post) {
    posts.add(post);
  }
}
