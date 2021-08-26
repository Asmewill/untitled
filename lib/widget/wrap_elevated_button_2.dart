
import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';
//Wrap组件用Container包裹之后，alignment: WrapAlignment.end,
//runAlignment: WrapAlignment.center才会生效
class WrapElevatedButton2 extends StatelessWidget {
  const WrapElevatedButton2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300,
      height: 500,
      color: Colors.pink,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        direction:Axis.vertical ,
        //alignment: WrapAlignment.end,  //用Container包裹之后生效了
       // runAlignment: WrapAlignment.center,
        children: [
          CustomElevatedButton("第一集"),
          CustomElevatedButton("第二集"),
          CustomElevatedButton("第三集"),
          CustomElevatedButton("第四集"),
          CustomElevatedButton("第五集"),
          CustomElevatedButton("第六集"),
          CustomElevatedButton("第七集"),
          CustomElevatedButton("第八集"),
          CustomElevatedButton("第九集"),
          CustomElevatedButton("第十集"),
          CustomElevatedButton("第十一集"),
        ],
      ),
    );
  }
}
