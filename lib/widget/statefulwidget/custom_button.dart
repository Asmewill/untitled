import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final pressed;
  const CustomButton(this.text,this.pressed,{Key? key,this.width=20.0,this.height=20.0}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState(this.text,this.pressed,width:this.width,height:this.height);
}

class _CustomButtonState extends State<CustomButton> {
  final String text;
  final double width;
  final double height;
  final pressed;
  _CustomButtonState(this.text,this.pressed,{this.width=20.0,this.height=20.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: ElevatedButton(
        onPressed: this.pressed,
        child: Text(this.text),
      ),
    );
  }
}
