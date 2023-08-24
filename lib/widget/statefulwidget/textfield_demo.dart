import 'package:flutter/material.dart';

class TextFiledDemo extends StatefulWidget {
  const TextFiledDemo({Key? key}) : super(key: key);

  @override
  _TextFiledState createState() => _TextFiledState();
}

class _TextFiledState extends State<TextFiledDemo> {
 var _usernameController ;
  var _password;

   TextEditingController inputTextCollection(String value) {
    TextEditingController tempController = TextEditingController();
   //解决设置了初始值之后，
    tempController.addListener(() {
      final text =tempController.text;
      tempController.value = tempController.value.copyWith(
        text: text,
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    tempController.text = value;
    return tempController;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController=inputTextCollection("初始值");
    //_usernameController.text = "初始值";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TextField演示页面"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(hintText: "请输入用户名"),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _usernameController.text = value;

                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(hintText: "请输入密码"),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    this._password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        print("用户名：" + _usernameController.text);
                        print("密码：" + _password);
                      },
                      child: Text("登录"),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ));
  }
}
