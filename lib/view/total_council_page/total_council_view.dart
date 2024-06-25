import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/view/detail_page/detail_page_view.dart';

class TotalCouncilPageView extends StatelessWidget {
  const TotalCouncilPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
              child: Container(
                  height: 100,
                  width: 340,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 212, 221, 232),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '제목',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '작성일자',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
