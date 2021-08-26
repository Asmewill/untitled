
import 'package:flutter/material.dart';

import 'custom_icon_container.dart';

class RowExpanded1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomIconContainer(Icons.search, color: Colors.blue,),
          flex: 1,
        ),
        Expanded(
          child: CustomIconContainer(Icons.home, color: Colors.green,),
          flex: 2,
        ),
      ],
    );
  }
}