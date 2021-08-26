import 'package:flutter/material.dart';

class CenterCircleAvatarCircleImage3 extends StatelessWidget{
  //CircleAvatar  实现圆角头像
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundImage: NetworkImage("https://iconfont.alicdn.com/t/2e70f788-a9f7-4977-ae9e-4a81a10ca8ee.png"),
        radius: 120,
      ),
    );
  }

}