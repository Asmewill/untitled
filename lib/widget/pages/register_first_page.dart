
import 'package:flutter/material.dart';

class RegisterFirstPage extends StatefulWidget {
  const RegisterFirstPage({Key? key}) : super(key: key);

  @override
  _RegisterFirstPageState createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一步-输入手机号"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("这是注册的第一步,请输入您的手机号 然后点击下一步"),
            SizedBox(height: 50),
            ElevatedButton(onPressed: (){
             Navigator.pushNamed(context, "/register_second");
            //  Navigator.pushReplacementNamed(context, "/register_second");
            }, child: Text("下一步"))
          ],
        ),
      ),
    );
  }
}
