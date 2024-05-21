import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loopy_friends/controller/test_controller.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final _controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            // 왼쪽 사이드바
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Instagram",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(
                          width: 10,
                        ),
                        Text("홈")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Text("검색")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.add_box),
                        SizedBox(
                          width: 10,
                        ),
                        Text("탐색 탭")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.movie),
                        SizedBox(
                          width: 10,
                        ),
                        Text("릴스")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.movie),
                        SizedBox(
                          width: 10,
                        ),
                        Text("릴스")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.movie),
                        SizedBox(
                          width: 10,
                        ),
                        Text("릴스")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.movie),
                        SizedBox(
                          width: 10,
                        ),
                        Text("릴스")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.movie),
                        SizedBox(
                          width: 10,
                        ),
                        Text("릴스")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.movie),
                        SizedBox(
                          width: 10,
                        ),
                        Text("릴스")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  child: SingleChildScrollView(
                    // 가로 스크롤을 위한 SingleChildScrollView 추가
                    scrollDirection: Axis.horizontal, // 스크롤 방향 가로 설정
                    child: Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true, // ListView 크기 제한
                          itemCount: _controller.story.length,
                          scrollDirection: Axis.horizontal, // 가로 스크롤 설정

                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                              width: 120,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(colors: [Colors.red, Colors.orange], begin: Alignment.topLeft, end: Alignment.bottomRight, stops: [0.0, 1.0], tileMode: TileMode.clamp),
                                    ),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          Modal.show(context, "사진", "사진을 눌렀습니다.");
                                        },
                                        child: Container(
                                          width: 90,
                                          height: 90,
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                          child: Center(child: Text("사진")),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(_controller.story[index]["name"] as String),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => SizedBox(
                    width: 500,
                    height: MediaQuery.of(context).size.height - 206,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "loopy_friends",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1일",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.more_horiz,
                                    size: 30,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Stack(
                                children: [
                                  Image.network(
                                    _controller.nameValue,
                                    scale: 0.5,
                                  ),
                                  if (_controller.idxValue != _controller.list.length - 1)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_right, size: 50),
                                            onTap: () {
                                              _controller.rightClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_controller.idxValue != 0)
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            child: Icon(Icons.arrow_left, size: 50),
                                            onTap: () {
                                              _controller.leftClick();
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              if (_controller.isClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.click();
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.chat_bubble_outline),
                              Spacer(),
                              if (_controller.bookMarkClickValue)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              else
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () {
                                      _controller.bookMark();
                                    },
                                    child: Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "좋아요 100개",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Loopy Friends  ", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("내용이 들어갈 공간... "),
                              if (_controller.moreClickValue == false)
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.more();
                                      },
                                      child: Text("더보기", style: TextStyle(color: Colors.grey))),
                                )
                            ],
                          ),
                          if (_controller.moreClickValue)
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                                Text("내용이 들어갈 공간입니다."),
                              ],
                            ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.people, size: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "loopy_friends",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("김언톡"),
                      ],
                    ),
                    Spacer(),
                    Text("보기", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "회원님을 위한 추천",
                      style: TextStyle(color: Colors.grey),
                    ),
                    MouseRegion(cursor: SystemMouseCursors.click, child: Text("모두 보기"))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.people, size: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "loopy_friends",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "회원님을 위한 추천",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("팔로우", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.people, size: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "loopy_friends",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "회원님을 위한 추천",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("팔로우", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.people, size: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "loopy_friends",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "회원님을 위한 추천",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("팔로우", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.people, size: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "loopy_friends",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "회원님을 위한 추천",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("팔로우", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  children: [
                    Icon(Icons.people, size: 50),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "loopy_friends",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "회원님을 위한 추천",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text("팔로우", style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey,
                      ),
                      child: Text(
                        "소개",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey,
                      ),
                      child: Text(
                        "도움말",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey[400],
                      ),
                      child: Text(
                        "홍보 센터",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey[400],
                      ),
                      child: Text(
                        "API",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey[400],
                      ),
                      child: Text(
                        "채용 정보",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey,
                      ),
                      child: Text(
                        "개인정보처리방침",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey,
                      ),
                      child: Text(
                        "약관",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey[400],
                      ),
                      child: Text(
                        "위치",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey[400],
                      ),
                      child: Text(
                        "언어",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        foregroundColor: Colors.grey[400],
                      ),
                      child: Text(
                        "Meta Verified",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Text(
                      " . ",
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "© 2024 INSTAGRAM FROM META",
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Modal {
  static Future<bool?> show(BuildContext context, String title, String bodyText, [VoidCallback? onConfirm]) async {
    return showDialog<bool>(
      barrierColor: Colors.black.withOpacity(0.25),
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return _buildDialog(context, title, bodyText, onConfirm ?? () {});
      },
    );
  }

  static Widget _buildDialog(BuildContext context, String title, String bodyText, VoidCallback onConfirm) {
    return Dialog(
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 10,
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 100,
      ),
      insetAnimationDuration: const Duration(milliseconds: 1000),
      insetAnimationCurve: Curves.bounceOut,
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                color: Colors.grey[200],
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bodyText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {
                  onConfirm();
                  Navigator.pop(context, true);
                },
                child: const Text("확인"),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
