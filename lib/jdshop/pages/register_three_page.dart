import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/pages/tabs.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/jdshop/widget/jd_textfield.dart';

class RegisterThreePage extends StatefulWidget {
  final tel;
  final vCode;

  const RegisterThreePage(this.tel, this.vCode, {Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterThreePage> {
  String pwd1 = "";
  String pwd2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册--第三步"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "请设置您的登录密码",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
          SizedBox(height: 10),
          JdTextField(
            text: "请输入密码",
            onChanged: (value) {
              this.pwd1 = value;
            },
          ),
          SizedBox(height: 10),
          JdTextField(
              text: "请输入确认密码",
              onChanged: (value) {
                this.pwd2 = value;
              }),
          SizedBox(height: 20),
          JdButton(
            height: 45,
            color: Colors.red,
            text: "确定",
            pressed: doRegister,
          )
        ],
      ),
    );
  }

  doRegister() async {
    if (pwd1.length < 6) {
      ToastUtil.showMsg("密码长度不能小于6位");
      return;
    }
    if (pwd2.length < 6) {
      ToastUtil.showMsg("确认密码长度不能小于6位");
      return;
    }
    if (pwd1 != pwd2) {
      ToastUtil.showMsg("二次密码不一致");
      return;
    }
    var api = '${Config.domain}api/register';
    print("api：${api}");
    var result = await Dio().post(api,
        data: {'tel': widget.tel, 'code': widget.vCode, 'password': this.pwd1});
    print("返回数据：${result}");
    if (result.data['success'] == true) {
      //保存用户信息
      SharedPreferencesUtils.setString(Config.USER_INFO,
          json.encode(result.data['userinfo'])); //将list集合[]转换成String
      //返回到根
      Navigator.pushAndRemoveUntil(context,
          new MaterialPageRoute(builder: (context) {
        return Tabs();
      }), (route) => route == null);
    } else {
      ToastUtil.showMsg(result.data['message']);
    }
  }
}
