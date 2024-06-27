import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/write_page_controller.dart';

class WritePageView extends StatefulWidget {
  const WritePageView({super.key});

  @override
  _WritePageViewState createState() => _WritePageViewState();
}

class _WritePageViewState extends State<WritePageView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text(
              '글 쓰기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 212, 221, 232),
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    postController.addPost(
                      _titleController.text,
                      _contentController.text,
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    '완료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ]),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: '제목',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 203, 208, 216),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 203, 208, 216),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  hintText: '내용을 입력하세요.',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 203, 208, 216),
                    fontSize: 12,
                  ),
                ),
                maxLines: 10,
              ),
            ])));
  }
}
