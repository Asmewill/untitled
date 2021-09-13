import 'dart:convert';

import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';
//函数都不写返回值
class SearchHistoryUtil{
  static setHistoryData(keywords) async {
    /*
          1、获取本地存储里面的数据  (searchList)
          2、判断本地存储是否有数据
              2.1、如果有数据
                    1、读取本地存储的数据
                    2、判断本地存储中有没有当前数据，
                        如果有不做操作、
                        如果没有当前数据,本地存储的数据和当前数据拼接后重新写入
              2.2、如果没有数据
                    直接把当前数据放在数组中写入到本地存储
      */
    //注意：新版shared_preferences增加了可空类型，如果为空不会报错了，所以这里直接可以判断。
    String? searchList = await SharedPreferencesUtils.getString(Config.SEARCH_LIST);
    if (searchList != null) {
      List searchListData = json.decode(searchList);///将Json String转换成集合对象
      var hasData = searchListData.any((v) {
        return v == keywords;
      });
      if (!hasData) {
        print("存储的keyword2:${keywords}");
        searchListData.add(keywords);
        await SharedPreferencesUtils.setString(Config.SEARCH_LIST, json.encode(searchListData));
      }
    } else {
      List tempList = [];
      tempList.add(keywords);
      await SharedPreferencesUtils.setString(Config.SEARCH_LIST, json.encode(tempList));
      print("存储的keyword1:${json.encode(tempList)}");///将集合对象转换成String
    }
  }

  static  getHistoryList() async {
    String? searchList = await SharedPreferencesUtils.getString(Config.SEARCH_LIST);
    if (searchList != null) {
      List searchListData = json.decode(searchList);
      return searchListData;
    }
    return [];
  }

  static clearHistoryList() async {
    await SharedPreferencesUtils.remove(Config.SEARCH_LIST);
  }

   //删除单个key
  static removeHistoryData(keywords) async {
    //注意：新版shared_preferences的可空类型
    String? jsonStr = await SharedPreferencesUtils.getString(Config.SEARCH_LIST);
    if (jsonStr != null) {
      List listData = json.decode(jsonStr);
      listData.remove(keywords);
      await SharedPreferencesUtils.setString(Config.SEARCH_LIST, json.encode(listData));
    }
  }
}