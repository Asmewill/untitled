

import 'package:flutter/material.dart';

class ListViewAxisHorizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 180,
            // height: 180,//水平列表,高度自适应,垂直列表，宽度自适应
            color: Colors.red,
          ),
          Container(
            width: 180,
            // height: 180,
            color: Colors.orange,
            child: ListView( //listView自适应宽度
              children: [
                Image.network("https://www.itying.com/images/flutter/1.png"),
                Text("我是一个文本")
              ],
            ),

          ),
          Container(
            width: 180,
            // height: 180,
            color: Colors.yellow,
          ),
          Container(
            width: 180,
            // height: 180,
            color: Colors.white,
          ),
          Container(
            width: 180,
            // height: 180,
            color: Colors.blue,
          ),
          Container(
            width: 180,
            //  height: 180,
            color: Colors.green,
          ),
        ],
      ),
    );

  }

}