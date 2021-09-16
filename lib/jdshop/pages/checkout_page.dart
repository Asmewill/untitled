import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/pages/address/address_add_page.dart';
import 'package:untitled/jdshop/pages/address/address_list_page.dart';
import 'package:untitled/jdshop/pages/pay_page.dart';
import 'package:untitled/jdshop/provider/cart_provider.dart';
import 'package:untitled/jdshop/provider/checkout_provider.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/checkout_util.dart';
import 'package:untitled/jdshop/utils/image_util.dart';
import 'package:untitled/jdshop/utils/sign_util.dart';
import 'package:untitled/jdshop/utils/user_util.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late CheckoutProvider checkoutProvider;
  late CartProvider cartProvider;
  List addressList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDefaultAddress();
    eventBus.on<CheckoutEvent>().listen((event) {
      this._getDefaultAddress();
    });

  }
  _getDefaultAddress()async{
    List userInfo=await UserUtil.getUserInfo();
    var tempJson={
      "uid":userInfo[0]['_id'],
      'salt':userInfo[0]['salt']
    };
    var sign=SignUtil.sign(tempJson);
    var api='${Config.domain}api/oneAddressList?uid=${userInfo[0]['_id']}&sign=${sign}';
    print("返回结果:${api}");
    var result=await new Dio().get(api);
    print(result.data is Map);
    print("返回结果:${result}");
    setState(() {
      this.addressList=result.data['result'];
    });

  }

  @override
  Widget build(BuildContext context) {
    checkoutProvider = Provider.of(context);
    cartProvider=Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("订单结算"),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              //有收货地址
              addressList.length>0?InkWell(
                child:  Container(
                  height: 80,
                  // decoration: BoxDecoration(color: Colors.red),
                  padding: EdgeInsets.only(left: 14,right: 10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${addressList[0]['name']}  ${addressList[0]['phone']}"),
                            SizedBox(height: 5),
                            Text("${addressList[0]['address']}"),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.navigate_next),
                      )
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return AddressListPage();
                  }));
                },
              ): InkWell(
                child: Container(
                  height: 80,
                  // decoration: BoxDecoration(color: Colors.red),
                  padding: EdgeInsets.only(left: 14, right: 10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_sharp),
                            SizedBox(height: 5),
                            Text("请添加您的收货地址")
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.navigate_next),
                      )
                    ],
                  ),
                ),
                onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return AddressAddPage();
                   }));
                },
              ),
              Container(
                height: 10,
                color: Colors.black12,
              ),
              //商品列表
              Column(
                children: checkoutProvider.checkoutList.map((item) {
                  return Column(
                    children: [
                      //ItemSku
                      InkWell(
                        child: Container(
                          height: 110,
                          //decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              Container(
                                height: 95,
                                padding: EdgeInsets.only(left: 10),
                                child: AspectRatio(
                                    aspectRatio: 1.0 / 1.0,
                                    child: Image.network(
                                        "${ImageUtil.getPicUrl(item['pic'])}",
                                        fit: BoxFit.cover)),
                              ),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.only(
                                    left: 8, top: 8, right: 8, bottom: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${item['title']}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                    Text("${item['selectedAttr']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis),
                                    Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("￥${item['price']}",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("x${item['count']}"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        onTap: () {
                          ToastUtil.showMsg("item Click");
                        },
                      ),
                      Divider(height: 0.5, color: Colors.grey),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 60)
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border(
                      top: BorderSide(color: Colors.black26, width: 0.2))),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text("实付款:"),
                        Text(
                          "￥123.12",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 100,
                      margin: EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          _doOrder();

                        },
                        child: Text("立即下单"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red), //背景颜色
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white) //文字颜色
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _doOrder()async{
    List userinfo=await UserUtil.getUserInfo();
    //注意：商品总价保留一位小数
    var allPrice=CheckoutUtil.getAllPrice(checkoutProvider.checkoutList).toStringAsFixed(1);
    //获取签名
    var sign=SignUtil.sign({
      "uid": userinfo[0]["_id"],
      "phone": this.addressList[0]["phone"],
      "address": this.addressList[0]["address"],
      "name": this.addressList[0]["name"],
      "all_price":allPrice,
      "products": json.encode(checkoutProvider.checkoutList),
      "salt":userinfo[0]["salt"]   //私钥
    });
    //请求接口
    var api = '${Config.domain}api/doOrder';
    print("api:${api}");
    var result = await Dio().post(api, data: {
      "uid": userinfo[0]["_id"],
      "phone": this.addressList[0]["phone"],
      "address": this.addressList[0]["address"],
      "name": this.addressList[0]["name"],
      "all_price":allPrice,
      "products": json.encode(checkoutProvider.checkoutList),
      "sign": sign
    });
    print(result);
    if(result.data["success"]){
      //删除购物车选中的商品数据
       await CheckoutUtil.removeUnSelectedCartItem();//必须添加await ,否则无法删除
      //调用CartProvider更新购物车数据
      cartProvider.updateCartList();
      //跳转到支付页面
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
         return PayPage();
       }));
    }

  }

}
