import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/pages/address/address_add_page.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/sign_util.dart';
import 'package:untitled/jdshop/utils/user_util.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';

import 'address_edit_page.dart';

class AddressListPage extends StatefulWidget {
  const AddressListPage({Key? key}) : super(key: key);

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressListPage> {
  List addressList = [];
  late StreamSubscription<AddressEvent> actionEventBus;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    actionEventBus.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAddressList();
    actionEventBus = eventBus.on<AddressEvent>().listen((event) {
      this._getAddressList();
    });
  }

  //修改默认收货地址
  _changeDefaultAddress(id) async {
    List userinfo = await UserUtil.getUserInfo();
    var tempJson = {
      "uid": userinfo[0]['_id'],
      "id": id,
      "salt": userinfo[0]["salt"]
    };
    var sign = SignUtil.sign(tempJson);
    var api = '${Config.domain}api/changeDefaultAddress';
    print("api:${api}");
    var result = await Dio()
        .post(api, data: {"uid": userinfo[0]['_id'], "id": id, "sign": sign});
    print("返回结果:${result}");
    if (result.data['success'] == true) {
      ToastUtil.showMsg(result.data['message']);
      eventBus.fire(CheckoutEvent(text: "修改默认地址成功"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data['message']);
    }
  }

  _getAddressList() async {
    List userInfo = await UserUtil.getUserInfo();
    var tempJson = {"uid": userInfo[0]['_id'], 'salt': userInfo[0]['salt']};
    var sign = SignUtil.sign(tempJson);
    var api =
        '${Config.domain}api/addressList?uid=${userInfo[0]['_id']}&sign=${sign}';
    print("api:${api}");
    var result = await new Dio().get(api);
    print(result.data is Map);
    print("返回结果:${result}");
    setState(() {
      this.addressList = result.data['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地址列表"),
      ),
      body: this.addressList.length > 0
          ? Stack(
              children: [
                ListView.builder(
                  itemCount: addressList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(left: 15),
                            //decoration: BoxDecoration(color: Colors.grey),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      addressList[index]['default_address'] == 1
                                          ? Icon(Icons.check, color: Colors.red)
                                          : Icon(Icons.check,
                                              color: Colors.white),
                                      SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${addressList[index]['name']}  ${addressList[index]['phone']}"),
                                          SizedBox(height: 5),
                                          Text(
                                              "${addressList[index]['address']}"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 15),
                                    child: IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return AddressEditPage(id:addressList[index]['_id'],
                                              name: addressList[index]['name'],phone:addressList[index]['phone'],
                                              area: addressList[index]['address'].split(",")[0],
                                              detailAddress: addressList[index]['address'].split(",")[1],
                                            );
                                          }));
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(height: 0.5, color: Colors.grey),
                          index == addressList.length - 1
                              ? SizedBox(height: 51)
                              : SizedBox(height: 0),
                        ],
                      ),
                      onTap: (){
                        this._changeDefaultAddress(addressList[index]['_id']);
                      },
                      onLongPress: (){
                        showDelDialog(addressList[index]['_id']);
                      },
                    );
                  },
                ),
                Positioned(
                    //一定要指定宽度
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: ScreenUtil().screenWidth,
                      decoration: BoxDecoration(color: Colors.red),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return AddressAddPage();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.add), Text("新增收货地址")],
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        ),
                      ),
                    ))
              ],
            )
          : LoadingWidget(),
    );
  }
  
  showDelDialog(addressId){
    var result=  showDialog(
        barrierDismissible:false,   //表示点击灰色背景的时候是否消失弹出框
        context:context,
        builder: (context){
          return AlertDialog(
            title: Text("提示信息!"),
            content:Text("您确定要删除吗?") ,
            actions: <Widget>[
              TextButton (
                child: Text("取消"),
                onPressed: (){
                  Navigator.pop(context,'Cancle');
                },
              ),
              TextButton (
                child: Text("确定"),
                onPressed: () {
                  _delAddress(addressId);
                },
              )
            ],

          );
        }
    );
    print("dialogResult:${result}");
  }

  _delAddress(addressId) async{
    List userInfo= await UserUtil.getUserInfo();
    print("${userInfo}");
    var tempJson={
      "id":addressId,
      "uid":userInfo[0]["_id"],
      "salt":userInfo[0]['salt']
    };
    var sign=SignUtil.sign(tempJson);
    var api = '${Config.domain}api/deleteAddress';
    print("api:${api}");
    var result = await Dio().post(api,data:{
      "id":addressId,
      "uid":userInfo[0]["_id"],
      "sign":sign
    });
    print("返回结果:${result}");
    if(result.data['success'] ){
      ToastUtil.showMsg(result.data['message']);
      Navigator.pop(context,'Cancle');
      this._getAddressList();
      eventBus.fire(CheckoutEvent(text: "删除地址"));
    }else{
      ToastUtil.showMsg(result.data['message']);
    }
  }
}
