import 'package:flutter/material.dart';

class AddDataByElevatedButton2 extends StatefulWidget {
  const AddDataByElevatedButton2({Key? key}) : super(key: key);

  @override
  _AddDataByElevatedButtonState createState() =>
      _AddDataByElevatedButtonState();
}

class _AddDataByElevatedButtonState extends State<AddDataByElevatedButton2> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 150),
      children: [
        Column(
          children: list
              .map((item) => ListTile(
                    title: Text(item),
                  ))
              .toList(),
        ),
        ElevatedButton(onPressed: () {
          setState(() {
            this.list.add("新增数据1");
          });
        }, child: Text("新增"))
      ],
    );
  }
}
