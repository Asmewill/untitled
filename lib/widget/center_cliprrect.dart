import 'package:flutter/material.dart';
//圆角图片
class CenterClipRRect extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Center(
         child: ClipRRect(
           child: Image.asset("images/img5.png",),
           borderRadius: BorderRadius.circular(20),
         ),
      );
  }
  
}