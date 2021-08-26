
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(//自适应宽度
      children: [
        ListTile(title: Text("我是一个文本")),
        ListTile(title: Text("我是一个文本")),
        ListTile(title: Text("我是一个文本")),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, "/login");
        }, child: Text("跳转到登录")),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, "/register_first");
        }, child: Text("跳转到注册"))
      ],
    );
  }
}
