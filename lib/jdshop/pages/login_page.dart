import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/pages/register_one_page.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/jdshop/widget/jd_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  String pwd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            print("exit");
          },
          icon: Icon(Icons.close),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("客服",
                  style: TextStyle(fontSize: 16, color: Colors.black)))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("images/flutter1.png"),
              ),
            ),
            SizedBox(height: 35),
            JdTextField(
              text: "用户名/手机号",
              onChanged: (value) {
                this.userName = value;
              },
            ),
            SizedBox(height: 15),
            JdTextField(
              text: "请输入密码",
              onChanged: (value) {
                this.pwd = value;
              },
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("忘记密码",
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RegisterOnePage();
                      }));
                    },
                    child: Text("用户注册",
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            JdButton(
              text: "登录",
              height: 48,
              pressed: doLogin,
            )
          ],
        ),
      ),
    );
  }

  doLogin() async {
    if (userName.length == 0) {
      ToastUtil.showMsg("用户名不能为空");
      return;
    }
    if (pwd.length == 0) {
      ToastUtil.showMsg("密码不能为空");
      return;
    }
    var api = "${Config.domain}api/doLogin";
    print("api:${api}");
    try{
      var result =await
      Dio().post(api, data: {'username': userName, 'password': pwd});
      print("返回结果:${result}");
      if(result.data['success']==true){
        //{"success":true,"message":"登录成功","userinfo":[{"_id":"60fcffbaa14f15029469d153","username":null,"tel":null,"salt":"774412967f19ea61d448977ad9749078"}]}
        SharedPreferencesUtils.setString(Config.USER_INFO, json.encode(result.data['userinfo']));//将结合转换成String
        eventBus.fire(UserEvent(text:"登录成功"));
        Navigator.pop(context);
      }else{
        ToastUtil.showMsg(result.data['message']);
      }
    }catch(e){
      print(e.toString());
    }
  }
}
