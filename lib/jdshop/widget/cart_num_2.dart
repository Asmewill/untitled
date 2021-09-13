
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/jdshop/model/product_detail_model.dart';
import 'package:untitled/jdshop/provider/cart_provider.dart';

class CartNum2 extends StatefulWidget {
  var itemModel;
  CartNum2(this.itemModel,{Key? key}) : super(key: key);

  @override
  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum2> {
 late var itemModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this.itemModel=widget.itemModel;//只会初始化一次，从购物车点击Item进入，新增数量之后，再次回到购物车，不会更新数据
  }
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider=Provider.of(context);
    this.itemModel=widget.itemModel;//从购物车点击Item进入，新增数量之后，
    return Container(
      width: 92,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Row(
        children: [
          InkWell(
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.grey))),
              child: Text("-", style: TextStyle(fontSize: 20)),
            ),
            onTap: (){
              setState(() {
                if(itemModel['count']>1){
                  itemModel['count']--;
                  cartProvider.itemCountChange();
                }
              });
            },
          ),
          Container(
            width: 40,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey))),
            child: Text("${itemModel['count']}", style: TextStyle(fontSize: 14)),
          ),
        InkWell(
          child:   Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            child: Text("+", style: TextStyle(fontSize: 20)),
          ),
          onTap: (){
            setState(() {
              itemModel['count']++;
              cartProvider.itemCountChange();
            });
          },
        ),
        ],
      ),
    );
  }
}
