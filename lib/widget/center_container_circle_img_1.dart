import 'package:flutter/material.dart';

//Container+BoxDecoration
class CenterContainerCircleImage1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
               // image:NetworkImage(),
                image: AssetImage("images/img5.png"),
                fit: BoxFit.cover
            ),
          )
      ),
    );
  }
}