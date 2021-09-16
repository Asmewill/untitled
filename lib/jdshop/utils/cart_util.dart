import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/jdshop/model/product_detail_model.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';

class CartUtil {

  static addCart  (ProductDetailItemModel item)async{
    //把对象转换成Map类型的数据
    var tempMap=CartUtil.formatCartData(item);
    /*
      1、获取本地存储的cartList数据
      2、判断cartList是否有数据
            有数据：
                1、判断购物车有没有当前数据：
                        有当前数据：
                            1、让购物车中的当前数据数量 等于以前的数量+现在的数量
                            2、重新写入本地存储

                        没有当前数据：
                            1、把购物车cartList的数据和当前数据拼接，拼接后重新写入本地存储。

            没有数据：
                1、把当前商品数据以及属性数据放在数组中然后写入本地存储



                List list=[
                  {"_id": "1",
                    "title": "磨砂牛皮男休闲鞋-有属性",
                    "price": 688,
                    "selectedAttr": "牛皮 ,系带,黄色",
                    "count": 4,
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  },
                    {"_id": "2",
                    "title": "磨xxxxxxxxxxxxx",
                    "price": 688,
                    "selectedAttr": "牛皮 ,系带,黄色",
                    "count": 2,
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  }

                ];


      */

    //注意：新版shared_preferences增加了可空类型，如果为空不会报错了，所以这里直接可以判断。

    String? cartList = await SharedPreferencesUtils.getString('cartList');
    if (cartList != null) {
      List cartListData = json.decode(cartList);
      //判断购物车有没有当前数据
      bool hasData = cartListData.any((value) {
        return value['_id'] == tempMap['_id'] &&
            value['selectedAttr'] == tempMap['selectedAttr'];
      });

      if (hasData) {
        for (var i = 0; i < cartListData.length; i++) {
          if (cartListData[i]['_id'] == tempMap['_id'] &&
              cartListData[i]['selectedAttr'] == tempMap['selectedAttr']) {
            cartListData[i]["count"] = cartListData[i]["count"] + 1;
          }
        }
        print("购物车原始数据0:${cartListData}");
        await SharedPreferencesUtils.setString('cartList', json.encode(cartListData));
      } else {
        cartListData.add(tempMap);
        print("购物车原始数据1:${cartListData}");
        await SharedPreferencesUtils.setString('cartList', json.encode(cartListData));
      }
    } else {
      List tempList = [];
      tempList.add(tempMap);
      print("购物车原始数据2:${tempList}");
      await SharedPreferencesUtils.setString('cartList', json.encode(tempList));
    }
//     {_id: 5a0425bc010e711234661439, title: 磨砂牛皮男休闲鞋-有属性, price: 688, selectedAttr: 牛皮 ,系带,黄色, count: 3, pic: public\upload\RinsvExKu7Ed-oc
// s_7W1DxYO.png, checked: true}
  }

  //过滤数据  把Model类转换成 Map对象
  static  formatCartData(ProductDetailItemModel item){
    final Map data = new Map<String, dynamic>();
    data['_id'] = item.id;
    data['title'] = item.title;
    data['price'] = item.price;
    // if(item.price is int||item.price is double){
    //   data['price'] = item.price;
    // }else{
    //   data['price'] = double.parse(item.price.toString());
    // }
    data['selectedAttr'] = item.selectedAttr;
    data['count'] = item.count;
    data['pic'] = item.pic;
    //是否选中
    data['checked'] = true;
    return data;
  }

  //获取购物车选中的数据
  static getCheckOutData() async {
    List cartListData = [];
    List tempCheckOutData = [];

    String? cartList = await SharedPreferencesUtils.getString('cartList');
    if (cartList != null) {
      cartListData = json.decode(cartList);
    }else{
      cartListData = [];
    }
    for (var i = 0; i < cartListData.length; i++) {
      if (cartListData[i]["checked"] == true) {
        tempCheckOutData.add(cartListData[i]);
      }
    }

    return tempCheckOutData;
  }
}
