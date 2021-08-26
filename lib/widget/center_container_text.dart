import 'package:flutter/material.dart';

class CenterContainerText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Center(
         child: Container(
           child: Text(
             "你好Flutter你好Flutter你好Flutter你好Flutter你好Flutter你好Flutter",
             textAlign: TextAlign.center,
             style: TextStyle(
                 fontSize: 14.0,
                 color: Colors.black,
                 fontWeight: FontWeight.w800,
                 fontStyle: FontStyle.italic,
                 decoration: TextDecoration.lineThrough,
                 decorationColor: Colors.white,
                 decorationStyle: TextDecorationStyle.dashed,
                 letterSpacing: 5.0, //文字间距
                 height: 1.5 //行高
             ),
             overflow: TextOverflow.ellipsis,
             maxLines: 2,
             textScaleFactor: 1.2,
           ),
           height: 300,
           width: 300,
           decoration: BoxDecoration(
               color: Colors.yellow,
               border: Border.all(color: Colors.blue, width: 2.0),
               borderRadius: BorderRadius.circular(10)),
           padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
           //margin: EdgeInsets.all(120),
           //transform: Matrix4.rotationZ(0.2),
           alignment:Alignment.topCenter,
         )
     );
  }

}