import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/pages/register_two_page.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/jdshop/widget/jd_textfield.dart';

class RegisterOnePage extends StatefulWidget {
  const RegisterOnePage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterOnePage> {
   String tel="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册--第一步"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 20),
          JdTextField(
              text: "请输入手机号",
              onChanged: (value) {
                this.tel = value;
              }),
          SizedBox(height: 20),
          JdButton(
            height: 45,
            color: Colors.red,
            text: "下一步",
            pressed: () {
              sendCode();
            },
          )
        ],
      ),
    );
  }

  RegExp reg = new RegExp(r"^1\d{10}$");

  void sendCode() async {
    if(tel.length==0){
      ToastUtil.showMsg("请输入手机号码");
      return;
    }

    if (reg.hasMatch(this.tel)) {
      var api = '${Config.domain}api/sendCode';
      print("api:${api}");
      var result = await Dio().post(api, data: {"tel": this.tel});
      print("返回结果:${result}");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return RegisterTwoPage(tel: this.tel);
      }));
    } else {
      ToastUtil.showMsg("手机号格式不对");
    }
  }
}
