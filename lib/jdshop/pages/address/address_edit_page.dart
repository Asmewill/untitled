
//import 'package:city_pickers/city_pickers.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/sign_util.dart';
import 'package:untitled/jdshop/utils/user_util.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/jdshop/widget/jd_textfield.dart';

class AddressEditPage extends StatefulWidget {
  final id;
  final name;
  final phone;
  final area;
  final detailAddress;
  AddressEditPage({this.id="",this.name="",this.phone="",this.area="",this.detailAddress="",Key? key}) : super(key: key);

  @override
  _AddressEditState createState() => _AddressEditState();
}

class _AddressEditState extends State<AddressEditPage> {
  String id="";
  String name="";
  String phone="";
  String area="";
  String detailAddress="";
  String address="";
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  //TextEditingController areaController=TextEditingController();
  TextEditingController detailController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.id=widget.id;
    this.name= nameController.text=widget.name;
    this.phone=phoneController.text=widget.phone;
    //areaController.text=widget.area;
    this.area=widget.area;
    this.detailAddress=detailController.text=widget.detailAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("编辑收货地址"),
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            child: JdTextField(
              controller: nameController,
              text: '收件人姓名',
              onChanged: (value){
                this.name=value;
              },
            ),
          ),
          Container(
            height: 50,
            child: JdTextField(
              controller: phoneController,
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
          ),
          TextField(
            maxLines: 3,
            controller: detailController,
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
                text: "修改",
                height: 48,
                pressed: doEditAddress,
              )),
          SizedBox(height: 50),
        ],
      ),
    );
  }
  doEditAddress()async{
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
      "id":this.id,
      "uid":userInfo[0]["_id"],
      "name":this.name,
      "phone":this.phone,
      "address":this.address,
      "salt":userInfo[0]['salt']
    };
    print("tempJson:${tempJson}");
    var sign=SignUtil.sign(tempJson);
    print("sign:${sign}");
    var api = '${Config.domain}api/editAddress';
    print("api:${api}");
    var result = await Dio().post(api,data:{
      "id":this.id,
      "uid":userInfo[0]["_id"],
      "name":this.name,
      "phone":this.phone,
      "address":this.address,
      "sign":sign
    });
    print("返回结果:${result}");
    if(result.data['success']){
      ToastUtil.showMsg(result.data['message']);
      eventBus.fire(AddressEvent(text: "修改地址"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data['message']);
    }
  }
}
