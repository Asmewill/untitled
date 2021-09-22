import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({Key? key}) : super(key: key);

  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool? flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox用法演示"),
      ),
      body: Column(
        children: [
          Checkbox(
              value: this.flag,
              onChanged: (value) {
                setState(() {
                  this.flag = value;
                });
              },
              activeColor: Colors.lightGreen,
              ),
          Text(this.flag!?"选中":"未选中"),
          SizedBox(height: 40),
          Divider(),
          CheckboxListTile(
              value: this.flag,
              activeColor: Colors.red,
              onChanged: (v) {
                setState(() {
                  if (v != null) {
                    this.flag = v;
                  }
                });
              },
              title: Text("标题"),
              subtitle: Text("这是二级标题"),
              secondary: Icon(Icons.map))
        ],
      ),
    );
  }
}
