import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget{
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.arrow_back_sharp),
            Text('내 정보')
          ],),
        Container(
          color: Colors.black,
          width : double.infinity,
          height : 400,
          margin : const EdgeInsets.all(8.0),
        )
      ],
    );
  }
}