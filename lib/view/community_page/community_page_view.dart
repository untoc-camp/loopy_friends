import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/write_page_controller.dart';

class CommunityPageView extends StatelessWidget {
  const CommunityPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController postController = Get.put(PostController());

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            '✨정컴이들의 게시판✨',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
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
                        '${post.timestamp.hour}:${post.timestamp.minute}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                      ),
                      Text(
                        ' | ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                      ),
                      Text(
                        '익명',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                      ),
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed('/write');
          },
          icon: Icon(Icons.create),
          label: Text('글쓰기'),
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
