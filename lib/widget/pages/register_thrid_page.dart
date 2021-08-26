import 'package:flutter/material.dart';
import 'package:untitled/widget/statefulwidget/scaffold_bottom_navigation_bar_1.dart';

class RegisterThridPage extends StatefulWidget {
  const RegisterThridPage({Key? key}) : super(key: key);

  @override
  _RegisterThridPageState createState() => _RegisterThridPageState();
}

class _RegisterThridPageState extends State<RegisterThridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第三步-输入密码"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text("输入密码"),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  ///Navigator.pop(context);
                  ///普通路由返回根
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ScaffoldBottomNavigationBar1(index: 2)
                      ),
                      (route) => route == null
                  );
                  ///命名路由返回根(--不支持传递参数--)
                 // Navigator.pushNamedAndRemoveUntil(context, "/", (route) => true);
                },
                child: Text("确定"))
          ],
        ),
      ),
    );
  }
}
