import 'package:flutter/material.dart';

//AspectRatio 不设置父容器 时，以屏幕的宽度作为参照
class AspectRatioToParent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return AspectRatio(
       aspectRatio: 1.0/1.0,
       child: Container(
         color: Colors.redAccent,
       ),
     );
  }
}