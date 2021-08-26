import 'package:flutter/material.dart';
/***
 * Column里面不能嵌套ListView,否则加载不出来
 */

class AddDataByElevatedButton1 extends StatefulWidget {
  const AddDataByElevatedButton1({Key? key}) : super(key: key);

  @override
  _AddDataByElevatedButtonState createState() =>
      _AddDataByElevatedButtonState();
}

class _AddDataByElevatedButtonState extends State<AddDataByElevatedButton1> {
  List list = ["xxx","xxx"];
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListView(
          children: list.map((e) => ListTile(title: Text(e))).toList(),
        ),
      ],
    );
  }
}
