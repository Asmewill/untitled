

import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget{
  double? size=32.0;
  Color? color=Colors.red;
  IconData icon;
  CustomIconContainer(this.icon,{this.color,this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: this.color,
      child: Icon(this.icon,size: this.size,color:Colors.white,),
    );
  }
}