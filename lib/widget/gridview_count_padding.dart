

import 'package:flutter/material.dart';
//有些widget没有padding属性的时候，可以给widget最外层包裹一层Padding组件
//通过给最外层包一个Padding控件，实现右边距10//EdgeInsets.fromLTRB(0, 0, 10, 0)
class GridViewCountPadding extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
       child: GridView.count(
         shrinkWrap: true,///Container跟随GridView内容变化高度, shrinkWrap:true;
         crossAxisCount: 2,//一行Widget的数量
         childAspectRatio: 1.7, //宽高比
         // mainAxisSpacing: 10,
         // crossAxisSpacing: 10,
         // padding: EdgeInsets.all(10),

         children: [
           Padding(
             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
             child: Image.network(
               "https://www.itying.com/images/flutter/1.png",
               fit: BoxFit.cover,
             ),
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
             child: Image.network(
               "https://www.itying.com/images/flutter/2.png",
               fit: BoxFit.cover,
             ),
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
             child: Image.network(
               "https://www.itying.com/images/flutter/3.png",
               fit: BoxFit.cover,
             ),
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
             child: Image.network(
               "https://www.itying.com/images/flutter/4.png",
               fit: BoxFit.cover,
             ),
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
             child: Image.network(
               "https://www.itying.com/images/flutter/5.png",
               fit: BoxFit.cover,
             ),
           ),
           Padding(
             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
             child: Image.network(
               "https://www.itying.com/images/flutter/6.png",
               fit: BoxFit.cover,
             ),
           ),
         ],
       ),
     );
  }

}