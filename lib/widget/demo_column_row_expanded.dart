
import 'package:flutter/material.dart';

//Container组件Row中通过Expanded包裹，自适应宽度
//ListView包裹Container自适应宽度
class DemoColumnRowExpanded extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 180,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    "你好，flutter",style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 180,
                  child: Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover,),
                ),

              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child:Container(
                  height: 180,
                  child:ListView(
                    children: [
                      Container(
                        height: 85,
                        child: Image.network("https://www.itying.com/images/flutter/3.png",fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 85,
                        child: Image.network("https://www.itying.com/images/flutter/4.png",fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
  }
}