import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void showMsg(String str){
    Fluttertoast.showToast( msg: str, toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,);
  }
}