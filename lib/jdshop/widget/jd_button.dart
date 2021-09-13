import 'package:flutter/material.dart';

class JdButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;

  // final Function()? cb;    //注意：新版flutter中cb的类型为Function()?   或者也可以定义成var
  var pressed;
  final double height;

  JdButton(
      {Key? key,
      this.color = Colors.red,
      this.textColor=Colors.white,
      this.text = "按钮",
      this.pressed,
      this.height = 68})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.pressed,
      child: Container(
        height: this.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(onPressed: (){
          pressed();
        }, child: Text(text),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              foregroundColor: MaterialStateProperty.all(textColor)
          ),
        ),
      ),
    );
  }
}
