import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';
import 'package:loopy_friends/controller/my_written_post_controller.dart';

class MyWritePageView extends StatelessWidget {
  const MyWritePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final MyWrittenPostController postController = Get.put(MyWrittenPostController());
    final bottomNavController = Get.put(MyBottomNavgationBarController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '💫 내가 작성한 글 💫',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 1,
                color: const Color.fromARGB(255, 12, 12, 12),
              ),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          var reversedPosts = postController.posts.reversed.toList();
          return ListView.builder(
            itemCount: reversedPosts.length,
            itemBuilder: (context, index) {
              final post = reversedPosts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    post.content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    Text(
                      '댓글',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                    Text(
                      ' | ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                    Text(
                      '좋아요 : ${post.likes}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                    Text(
                      ' | ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                    Text(
                      '${post.timestamp.hour.toString().padLeft(2, '0')}:${post.timestamp.minute.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                    Text(
                      ' | ',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                    ),
                    TextButton(
                        onPressed: () async {
                          // 해당 인덱스의 포스트를 삭제합니다.
                          await postController.deletePost(post.id, reversedPosts.length - 1 - index);
                        },
                        child: Text(
                          "삭제",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ))
                  ]),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
