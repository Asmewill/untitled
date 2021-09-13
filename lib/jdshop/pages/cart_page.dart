import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled/jdshop/model/ProductModel.dart';
import 'package:untitled/jdshop/model/product_detail_model.dart';
import 'package:untitled/jdshop/pages/product_detail_page.dart';
import 'package:untitled/jdshop/provider/cart_provider.dart';
import 'package:untitled/jdshop/utils/image_util.dart';
import 'package:untitled/jdshop/widget/cart_num.dart';
import 'package:untitled/jdshop/widget/cart_num_2.dart';
import 'package:untitled/widget/pages/product_info_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CartPage> {
  late CartProvider cartProvider;
  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("CartPage---build");
    cartProvider = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("购物车"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.launch),
                onPressed: () {
                  setState(() {
                    this.isEdit = !isEdit;
                  });
                })
          ],
        ),
        body: _getBodyWidget());
  }

  Widget _getBodyWidget() {
    if (cartProvider.cartList.length > 0) {
      return Stack(
        children: [
          ListView(
            children: [
              Column(
                children: cartProvider.cartList.map((item) {
                  ///购物车Item布局
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetailPage(id: item['_id']);
                      }));
                    },
                    child: Container(
                      height: 90,
                      padding: EdgeInsets.all(5),
                      // decoration: BoxDecoration(color: Colors.grey),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black26, width: 0.3))),
                      child: Row(
                        children: [
                          Container(
                            child: Checkbox(
                                value: item['checked'],
                                activeColor: Colors.pink,
                                onChanged: (value) {
                                  setState(() {
                                    item['checked'] = value;
                                    cartProvider.itemChage();
                                  });
                                }),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.network(
                                "${ImageUtil.getPicUrl(item['pic'])}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${item['title']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 8),
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
                                        child: CartNum2(item),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 50)
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(width: 0.3, color: Colors.black26))),
                child: Stack(
                  children: [
                    //全选
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            child: Checkbox(
                              onChanged: (bool? value) {
                                cartProvider.checkAll(value);
                              },
                              value: cartProvider.isCheckedAll,
                              activeColor: Colors.pink,
                            ),
                          ),
                          Text("全选"),
                          isEdit == false
                              ? Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Text("总计:"),
                                    SizedBox(width: 2),
                                    Text("￥${cartProvider.allPrice}",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.red))
                                  ],
                                )
                              : Text("")
                        ],
                      ),
                    ),
                    //结算
                    isEdit == false
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                child: Text("结算"),
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                child: Text("删除"),
                                onPressed: () {
                                  cartProvider.removeItem();
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                              ),
                            ),
                          )
                  ],
                ),
              ))
        ],
      );
    } else {
      return Center(
        child: Text("购物车空空如也..."),
      );
    }
  }
}
