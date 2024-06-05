import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/constants/colors.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';

class MainPageVIew extends StatelessWidget {
  MainPageVIew({super.key});

  final _controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset("assets/selon_Logo_with_text.png", height: 45,),
              Spacer(),

              Stack(
                children: [
                  Icon(Icons.notifications_none_outlined, size: 35,),
                  Positioned(
                    right: 6,
                    top: 4,
                    child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(child: Text("1", style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),)),

                  ))
                ],
              ),
              SizedBox(width: 10,),
              Icon(Icons.account_circle, size: 35),
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("공지", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(height: 100, width: MediaQuery.of(context).size.width - 16,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text("1번 공지사항", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),),
                    SizedBox(width: 10,),
                    Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text("2번 공지사항", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),),
                    SizedBox(width: 10,),
                    Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text("3번 공지사항", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),),
                    SizedBox(width: 10,),
                    Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text("4번 공지사항", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),),
                    SizedBox(width: 10,),
                    Container(
                    height: 100,
                    width: 200,
                    color: Colors.red,
                    child: Center(child: Text("5번 공지사항", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),),
                  ],
                ),
              )
            ),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              SizedBox(width: 30,),
              Column(
                children: [
                  Image.asset("assets/PNU_logo.png", height: 45,),
                  SizedBox(height: 8,),
                  Text("부산대\n홈", style: TextStyle(color: TextColor), textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(width: 35,),
              Column(
                children: [
                  Image.asset("assets/Onestop_logo.png", height: 45,),
                  SizedBox(height: 8,),
                  Text("부산대\n학지시", style: TextStyle(color: TextColor), textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(width: 35,),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                   onTap: () {
                  // 여기에 버튼 클릭 시 실행할 코드를 작성합니다.
                  print('Button clicked');
                },
                  child: Column(
                    children: [
                      Image.asset("assets/CSE_logo.png", height: 45,),
                      SizedBox(height: 8,),
                      Text("부산대\n정컴", style: TextStyle(color: TextColor,), textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 35,),
              Column(
                children: [
                  Image.asset("assets/Schedule_logo.png", height: 45,),
                  SizedBox(height: 8,),
                  Text("학사\n일정", style: TextStyle(color: TextColor), textAlign: TextAlign.center,),
                ],
              ),
            ],
          )
        ], // children
      ),
    );
  }
}
