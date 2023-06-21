import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/sign_util.dart';
import 'package:untitled/jdshop/utils/user_util.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/jdshop/widget/jd_textfield.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({Key? key}) : super(key: key);

  @override
  _AddressAddState createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAddPage> {
  String area="";
  String name="";
  String phone="";
  String address="";
  String detailAddress="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("增加收货地址"),
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            child: JdTextField(
              text: '收件人姓名',
              onChanged: (value){
                this.name=value;
              },
            ),
          ),
          Container(
            height: 50,
            child: JdTextField(
              text: '收件人电话号码',
              onChanged: (value){
                this.phone=value;
              },
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Icon(Icons.location_on_sharp), Text((area.length)>0?"${this.area}":"省/市/区")],
              ),
            ),
            onTap: () async{
             // 最新版本的Flutter注意返回的类型  需要判断是否为空
              Result? result = await CityPickers.showCityPicker(
                  context: context,
                  cancelWidget:
                      Text("取消", style: TextStyle(color: Colors.blue)),
                  confirmWidget:
                      Text("确定", style: TextStyle(color: Colors.blue)));
               print(result);
               setState(() {
                 this.area="${result!.provinceName}/${result!.cityName}/${result!.areaName}";
               });
            },
          )
          ,
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
                hintText: "详细地址",
                border: OutlineInputBorder(borderSide: BorderSide.none)),
            onChanged: (value){
              this.detailAddress=value;
              this.address="${this.area},${value}";
            },
          ),
          Divider(height: 0.5, color: Colors.grey),
          SizedBox(height: 50),
          Padding(
              padding:
                  EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              child: JdButton(
                text: "增加",
                height: 48,
                pressed: doAddAddress,

              )),
          SizedBox(height: 50),
        ],
      ),
    );
  }
  doAddAddress()async{
    List userInfo= await UserUtil.getUserInfo();
    print("${userInfo}");
    if(name.length<=0){
      ToastUtil.showMsg("请输入收件人姓名");
      return;
    }
    if(phone.length<=0){
      ToastUtil.showMsg("请输入收件人电话号码");
      return;
    }
    if(area.length<=0){
      ToastUtil.showMsg("请选择省/市/区");
      return;
    }
    if(detailAddress.length<=0){
      ToastUtil.showMsg("请填写详细地址");
      return;
    }

    var tempJson={
      "uid":userInfo[0]["_id"],
      "name":this.name,
      "phone":this.phone,
      "address":this.address,
      "salt":userInfo[0]['salt']
    };
    print("tempJson:${tempJson}");
    var sign=SignUtil.sign(tempJson);
    print("sign:${sign}");
    var api = '${Config.domain}api/addAddress';
    var result = await Dio().post(api,data:{
      "uid":userInfo[0]["_id"],
      "name":this.name,
      "phone":this.phone,
      "address":this.address,
      "sign":sign
    });
    print("返回结果:${result}");
    if(result.data['success'] ){
      ToastUtil.showMsg(result.data['message']);
      eventBus.fire(AddressEvent(text: "新增地址"));
      eventBus.fire(CheckoutEvent(text: "结算地址"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data['message']);
    }
  }
}
