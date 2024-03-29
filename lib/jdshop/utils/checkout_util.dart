import 'dart:convert';

import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';

class CheckoutUtil {
  //计算总价
  static getAllPrice(List checkOutListData) {
    var tempAllPrice = 0.0;
    for (var i = 0; i < checkOutListData.length; i++) {
      if (checkOutListData[i]["checked"] == true) {
        tempAllPrice +=
            double.parse(checkOutListData[i]["price"].toString())* checkOutListData[i]["count"];
      }
    }
    return tempAllPrice;
  }

  static removeUnSelectedCartItem() async {
    List _cartList = [];
    List _tempList = [];
    //获取购物车的数据
    String? cartListString = await SharedPreferencesUtils.getString('cartList');
    if (cartListString != null) {
      List cartListData = json.decode(cartListString);
      _cartList = cartListData;
    } else {
      _cartList = [];
    }
    for (var i = 0; i < _cartList.length; i++) {
      if (_cartList[i]["checked"] == false) {
        _tempList.add(_cartList[i]);
      }
    }
    SharedPreferencesUtils.setString("cartList", json.encode(_tempList));
  }
}