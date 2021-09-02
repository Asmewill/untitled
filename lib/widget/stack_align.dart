

import 'package:flutter/material.dart';

class StackAlign extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Stack 演示demo"),
       ),
       body:Center(
           child: Container(
               width: 300,
               height: 300,
               color: Colors.red,
               child: Stack(
                 children: [
                   Align(
                     child: Icon(Icons.home, size: 40, color: Colors.white),
                     alignment: Alignment.topLeft,
                   ),
                   Align(
                     child: Icon(Icons.home, size: 40, color: Colors.white),
                     alignment: Alignment.topCenter,
                   ),
                   Align(
                     child: Icon(Icons.home, size: 40, color: Colors.white),
                     alignment: Alignment.topRight,
                   ),
                   Align(
                     child: Icon(Icons.add, size: 40, color: Colors.blue),
                     alignment: Alignment.centerLeft,
                   ),
                   Align(
                     child: Icon(Icons.add, size: 40, color: Colors.blue),
                     alignment: Alignment.center,
                   ),
                   Align(
                     child: Icon(Icons.add, size: 40, color: Colors.blue),
                     alignment: Alignment.centerRight,
                   ),
                   Padding(
                       padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                       child: Align(
                         child: Icon(Icons.search, size: 40, color: Colors.black),
                         alignment: Alignment.bottomLeft,
                       )),
                   Align(
                     child: Icon(Icons.search, size: 40, color: Colors.black),
                     alignment: Alignment.bottomCenter,
                   ),
                   Align(
                     child: Icon(Icons.search, size: 40, color: Colors.black),
                     alignment: Alignment.bottomRight,
                   ),
                 ],
               )
           )
       ) ,
     );
  }
  
}