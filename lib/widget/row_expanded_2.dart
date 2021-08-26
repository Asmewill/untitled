import 'package:flutter/material.dart';
import 'custom_icon_container.dart';
//左边宽度100,右边自适应剩余宽度
class RowExpanded2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Row(
        children: [
          Expanded(
            child: CustomIconContainer(Icons.home,color: Colors.green,),
            flex: 1,
          ),
          CustomIconContainer(Icons.map,color: Colors.black,),
        ],
      );
  }

}