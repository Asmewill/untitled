import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';
/////////////////////////////////////////////
/////////////////////Notice 使用List<Map>定义会报错///////////////////////////
////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////Notice 使用List<Map>定义会报错///////////////////////////
////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////Notice 使用List<Map>定义会报错///////////////////////////
////////////////////////////////////////////

class CartProvider with ChangeNotifier{


  List _cartList = []; //状态   使用List<Map>定义会报错

  List get cartList => this._cartList;

  bool _isCheckedAll = false; //状态
  bool get isCheckedAll => this._isCheckedAll;

  double _allPrice = 0; //总价
  double get allPrice => this._allPrice;

  CartProvider() {
    this.init();
  }
  //初始化的时候获取购物车数据
  init() async {
    //注意：新版shared_preferences增加了可空类型，如果为空不会报错了，所以这里直接可以判断。
    String? cartList = await SharedPreferencesUtils.getString('cartList');
    if (cartList != null) {
      List cartListData = json.decode(cartList);//使用List<Map>接收会报错
      this._cartList = cartListData;
      print("获取到购物车列表:${_cartList}");
    } else {
      this._cartList = [];
    }
    computeAllPrice();
    notifyListeners();
  }

  updateCartList() {
    this.init();
  }

  //数量改变触发的方法
  itemCountChange() {
    computeAllPrice();
    SharedPreferencesUtils.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }

  //全选 反选
  checkAll(value) {
    for (var i = 0; i < this._cartList.length; i++) {
      this._cartList[i]["checked"] = value;
    }
    this._isCheckedAll = value;
    computeAllPrice();
    SharedPreferencesUtils.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }

  //判断是否全选
  bool isCheckAll() {
    if (this._cartList.length > 0) {
      for (var i = 0; i < this._cartList.length; i++) {
        if (this._cartList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  //监听每一项的选中事件
  itemChage(){
    if(this.isCheckAll()==true){
      this._isCheckedAll=true;
    }else{
      this._isCheckedAll=false;
    }
    computeAllPrice();
    SharedPreferencesUtils.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }

  //计算总价
  computeAllPrice() {
    double tempAllPrice = 0;
    for (var i = 0; i < this._cartList.length; i++) {
      if (this._cartList[i]["checked"] == true) {
        tempAllPrice += double.parse(this._cartList[i]["price"].toString()) * this._cartList[i]["count"];
      }
    }
    this._allPrice = tempAllPrice;
    notifyListeners();
  }
  //删除数据
  removeItem() {
    //  1        2
    // ['1111','2222','333333333','4444444444']
    // 错误的写法
    // for (var i = 0; i < this._cartList.length; i++) {
    //   if (this._cartList[i]["checked"] == true) {
    //      this._cartList.removeAt(i);
    //   }
    // }

    List tempList=[];
    for (var i = 0; i < this._cartList.length; i++) {
      if (this._cartList[i]["checked"] == false) {
        tempList.add(this._cartList[i]);
      }
    }
    this._cartList=tempList;
    //计算总价
    this.computeAllPrice();
    SharedPreferencesUtils.setString("cartList", json.encode(this._cartList));
    notifyListeners();
  }


}

/////////////////////////////////////////////
/////////////////////Notice 使用List<Map>定义会报错///////////////////////////
////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////Notice 使用List<Map>定义会报错///////////////////////////
////////////////////////////////////////////
/////////////////////////////////////////////
/////////////////////Notice 使用List<Map>定义会报错///////////////////////////
////////////////////////////////////////////