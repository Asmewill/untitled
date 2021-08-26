import 'package:flutter/material.dart';

class CenterClipOvalImage2 extends StatelessWidget{
  //通常只在头像的时候使用，但是我不会用，太差劲了
  @override
  Widget build(BuildContext context) {
     return Center(
         child: ClipOval(
           child: Image.asset("images/img1.png",width: 40,height: 40)
         )
     );
  }
}

