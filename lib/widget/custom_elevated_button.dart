import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  const CustomElevatedButton(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Flutter 2.x以后新增了一些按钮组件  可以使用ElevatedButton替代RaisedButton，也可以继续使用RaisedButton
    return ElevatedButton(
        onPressed: (){},
        child: Text(this.title),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))
        ),
    );
  }
}

