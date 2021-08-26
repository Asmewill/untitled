import 'package:flutter/material.dart';

class AddNumByElevatedButton extends StatefulWidget {
  const AddNumByElevatedButton({Key? key}) : super(key: key);

  @override
  _AddNumByElevatedButtonState createState() => _AddNumByElevatedButtonState();
}

class _AddNumByElevatedButtonState extends State<AddNumByElevatedButton> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Chip(label: Text('$num')),
        ElevatedButton(
            onPressed: () {
              setState(() {
                this.num++;
              });
            },
            child: Text("+")
        )
      ],
    );
  }
}
