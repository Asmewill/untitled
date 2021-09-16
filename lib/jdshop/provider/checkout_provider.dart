import 'package:flutter/material.dart';

class CheckoutProvider with ChangeNotifier{
  List _checkoutList=[];
  List get checkoutList=>_checkoutList;

  void setCheckoutList(data){
    this._checkoutList=data;
    notifyListeners();
  }
}