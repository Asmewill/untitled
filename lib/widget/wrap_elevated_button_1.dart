import 'package:flutter/material.dart';

import 'custom_elevated_button.dart';

class WrapElevatedButton1 extends StatelessWidget {
  const WrapElevatedButton1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          spacing: 10,
          //子组件之间的水平间距
          runSpacing: 5,
          //各行之间的间距
          direction: Axis.horizontal,
          //方向是水平还是竖直
         // runAlignment: WrapAlignment.center,//必须用Container包裹才会生效
          children: [
            CustomElevatedButton("第一季"),
            CustomElevatedButton("第二季666"),
            CustomElevatedButton("第三季1"),
            CustomElevatedButton("第四季"),
            CustomElevatedButton("第五季"),
            CustomElevatedButton("第六季32"),
            CustomElevatedButton("第七季"),
             CustomElevatedButton("第八季1478"),
            CustomElevatedButton("第9季"),
            CustomElevatedButton("第10季666"),
            CustomElevatedButton("第11季1"),
            CustomElevatedButton("12季"),
            CustomElevatedButton("第13季"),
            // CustomElevatedButton("第14季32"),
            // CustomElevatedButton("第15季"),
            // CustomElevatedButton("第16季1478"),
            // CustomElevatedButton("第17季"),
            // CustomElevatedButton("第18季666"),
            // CustomElevatedButton("第19季1"),
            // CustomElevatedButton("第20季"),
            // CustomElevatedButton("第21季"),
            // CustomElevatedButton("第22季32"),
            // CustomElevatedButton("第23季"),
            // CustomElevatedButton("第24季1478"),
          ],
        ));
  }
}
