import 'package:flutter/material.dart';

class StackAlignment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Center(
       child: Stack(
         alignment: Alignment.bottomCenter,
         children: [
           Container(
             width:300,
             height: 300,
             color: Colors.red,
           ),
           Text("我是一个文本",style: TextStyle(
               fontSize: 14,
               color: Colors.white
           ),)
         ],
       )
     );
  }

}