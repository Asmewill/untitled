import 'dart:convert';

import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';

class UserUtil {
  static getUserInfo() async{
    String? userInfo = await SharedPreferencesUtils.getString(Config.USER_INFO);
    if (userInfo != null) {
      List userInfoList = json.decode(userInfo);
      return userInfoList;
    }else{
      return [];
    }
  }
  static getUserLoginState() async{
    var userInfo=await UserUtil.getUserInfo();
    if(userInfo.length>0&&userInfo[0]["username"]!=""){
      return true;
    }
    return false;
  }
  static loginOut(){
    SharedPreferencesUtils.remove(Config.USER_INFO);
  }
}