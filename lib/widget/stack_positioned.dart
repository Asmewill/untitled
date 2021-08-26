

import 'package:flutter/material.dart';

class StackPositioned extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Center(
       child: Container(
         height: 400,
         width: 400,
         color: Colors.red,
         child: Stack(
           children: [
             Positioned(
                 top: 10,
                 right: 10,
                 child: Icon(
                   Icons.home,
                   color: Colors.blue,
                   size: 40,
                 )
             ),
             Positioned(
                 top:185,
                 left: 185,
                 child: Icon(
                   Icons.home,
                   color: Colors.black,
                   size: 40,
                 )
             ),
             Positioned(
                 bottom: 10,
                 left: 10,
                 child: Icon(
                   Icons.home,
                   color: Colors.green,
                   size: 40,
                 )
             ),

           ],
         ),
       ),
     );
  }

}