import 'package:flutter/material.dart';
import 'custom_icon_container.dart';


class RowMainAxisCrossAxisAlignment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return  Container(
       width: 400,
       height: 500,
       color: Colors.yellow,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,//平均分配
         crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           CustomIconContainer(Icons.search,color: Colors.blue,),
           CustomIconContainer(Icons.home,color: Colors.orange,),
           CustomIconContainer(Icons.select_all,color: Colors.red,)
         ],
       ),
     );
  }

}