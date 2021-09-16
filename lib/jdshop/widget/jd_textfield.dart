import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JdTextField extends StatelessWidget {
  final String text;
  final bool password;
  var onChanged;
  var controller;

  JdTextField(
      {Key? key,
      this.text = "输入内容",
      this.controller,
      this.password = false,
      this.onChanged })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
     //   textAlign: TextAlign.end,
        controller: controller,
        textAlignVertical: TextAlignVertical.bottom,
        maxLines: 1,
        obscureText: this.password,
      //  autofocus: true,
        decoration: InputDecoration(
            hintText: this.text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
            )),
        onChanged: this.onChanged,
      ),
      height: 40,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
    );
  }
}
