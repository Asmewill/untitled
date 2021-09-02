import 'package:flutter/material.dart';

class DevideLine extends StatelessWidget {
   final color;
   final double  height;
   DevideLine({this.height=0.5,this.color=Colors.grey,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:height ,child: Container(height:height,decoration: BoxDecoration(color: color)));
  }
}
