import 'package:flutter/material.dart';

class RegisterSecondPage extends StatefulWidget {
  const RegisterSecondPage({Key? key}) : super(key: key);

  @override
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二步-验证码"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("输入验证码"),
            SizedBox(height: 40),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/register_thrid");
              ///  替换路由
             // Navigator.pushReplacementNamed(context, "/register_thrid");
            }, child: Text("下一步"))
          ],
        ),
      ),
    );
  }
}
