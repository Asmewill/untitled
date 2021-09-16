import 'dart:convert';

import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/utils/sharedpreferences_util.dart';

///[{_id: 60fcffbaa14f15029469d153, username: null, tel: null, salt: 774412967f19ea61d448977ad9749078}]
class UserUtil {
  static Future<List> getUserInfo() async{
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