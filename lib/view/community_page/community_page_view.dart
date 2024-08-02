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
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 10,
              // ),
              const Text(
                '✨정컴이들의 게시판✨',
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Obx(() {
            var reversedPosts = postController.posts.reversed.toList();
            return ListView.builder(
              itemCount: reversedPosts.length,
              itemBuilder: (context, index) {
                final post = reversedPosts[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(2, 5),
                      ),
                    ],
                  ),
                  child: Column(
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
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
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
                        Text(
                          '익명',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                        ),
                      ]),
                    ],
                  ),
                );
              },
            );
          }),
        ),
        floatingActionButton: Container(
          height: 45,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color.fromARGB(255, 241, 241, 241),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed('/write');
            },
            icon: Icon(Icons.create, color: Colors.black, size: 20),
            label: Text('글쓰기', style: TextStyle(color: Colors.black, fontSize: 15)),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
