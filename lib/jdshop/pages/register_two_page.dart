import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/pages/register_three_page.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/jdshop/widget/jd_textfield.dart';

class RegisterTwoPage extends StatefulWidget {
  final tel;

  const RegisterTwoPage({this.tel, Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterTwoPage> {
   String vCode="";
  int second = 10;
  bool isEnable = false;
 late Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showTime();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if(timer!=null){
      timer.cancel();
    }
  }

  void _showTime() {
     timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        this.second--;
        if (this.second == 0) {
          timer.cancel();
          this.isEnable = true;
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册--第二步"),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(left: 12,bottom: 10),
              child: Text(
                "请输入${widget.tel}收到的手机验证码",
                style: TextStyle(color: Colors.black),
              )),
          Stack(
            children: [
              Container(
                width: ScreenUtil().screenWidth * 2 / 3 - 20,
                child: JdTextField(
                    text: "请输入验证码",
                    onChanged: (value) {
                      this.vCode = value;
                    }),
              ),
              Positioned(
                  right: 0,
                  child: Container(
                    width: ScreenUtil().screenWidth / 3 - 20,
                   // alignment: Alignment.center,
                    child: JdButton(
                      height: 40,
                      text:this.isEnable? "重新发送":"${this.second}s后重发",
                      pressed: this.isEnable ? reSendCode : (){},
                    ),
                  ))
            ],
          ),
          SizedBox(height: 20),
          JdButton(
            height: 45,
            color: Colors.red,
            text: "下一步",
            pressed: validateCode,
          )
        ],
      ),
    );
  }

   void reSendCode() async{
     print("重新发送验证码");
     var api = '${Config.domain}api/sendCode';
     print("api:${api}");
     var result = await Dio().post(api, data: {"tel": widget.tel});
     print("返回结果:${result}");
     ToastUtil.showMsg("验证码:${result}");
     if(result.data["success"]==true){
       ToastUtil.showMsg(result.data['message']);
       setState(() {
         second = 10;
         isEnable = false;
       });
       _showTime();
     }else{
       ToastUtil.showMsg(result.data['message']);
     }

   }

  validateCode() async{
    if(vCode.length==0){
      ToastUtil.showMsg("请输入验证码");
    }else{
      var api = '${Config.domain}api/validateCode';
      print("api:${api}");
      var result=await Dio().post(api,data: {'tel':widget.tel,'code':vCode});
      print(result);
      if(result.data['success']==true){
        ToastUtil.showMsg(result.data['message']);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
          return RegisterThreePage(widget.tel,this.vCode);
        }));
      }else{
        ToastUtil.showMsg(result.data['message']);
      }
    }
  }
}
