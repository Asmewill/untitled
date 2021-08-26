

import 'package:flutter/material.dart';
//输入stless  stful 自动生成widget模板代码
//AspectRatio设置父容器Container的宽度 时，以父容器的Container的宽度作为参照
class AspectRatioToContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  Container(
     width: 300,
     child: AspectRatio(
       aspectRatio: 2.0/1.0,
       child: Container(
         color: Colors.redAccent,
       ),
     ),
   );
  }
}

