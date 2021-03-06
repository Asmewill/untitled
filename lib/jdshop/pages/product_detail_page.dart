import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/model/product_detail_model.dart';
import 'package:untitled/jdshop/pages/cart_page.dart';
import 'package:untitled/jdshop/pages/product_detail_first_page.dart';
import 'package:untitled/jdshop/pages/product_detail_second_page.dart';
import 'package:untitled/jdshop/pages/product_detail_thrid_page.dart';
import 'package:untitled/jdshop/provider/cart_provider.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/cart_util.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';

class ProductDetailPage extends StatefulWidget {
  final id;

  const ProductDetailPage({this.id, Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  List<ProductDetailItemModel> _productContent=[];
  List<Attr> attr=[];

  late CartProvider cartProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getProductDetail();
  }

  _getProductDetail()async{
    var api=Config.domain+"api/pcontent?id=${widget.id}";
    print("api:${api}");
    var result=await Dio().get(api);
    print("θΏεη»ζ:${result}");
    var productDetailModel=ProductDetailModel.fromJson(result.data);
    setState(() {
      _productContent.add(productDetailModel.result??ProductDetailItemModel(attr: attr));
    });
  }
  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of(context);
      return DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil().screenWidth / 2,
                      child: TabBar(
                          isScrollable: false,
                          //θ?Ύη½?ζ―ε¦ε―δ»₯ζ»ε¨
                          unselectedLabelColor: Colors.black,
                          //ζͺιδΈ­ζΆζε­ι’θ²
                          labelColor: Colors.red,
                          //ζε­ι’θ²
                          indicatorColor: Colors.red,
                          //εΊι¨ζ²»ζΆζηι’θ²
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(child: Text("εε")),
                            Tab(child: Text("θ―¦ζ")),
                            Tab(child: Text("θ―δ»·")),
                          ]),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                                ScreenUtil().screenWidth - 100, 80, 0, 0),
                            items: [
                              PopupMenuItem(
                                  child: Row(
                                    children: [Icon(Icons.home), Text("ι¦ι‘΅")],
                                  )),
                              PopupMenuItem(
                                  child: Row(
                                    children: [Icon(Icons.search), Text("ζη΄’")],
                                  )),
                            ]);
                      },
                      icon: Icon(Icons.more_horiz))
                ],
              ),
              body: _getBodyWidget()));
  }

 Widget _getBodyWidget(){
    if(_productContent.length>0){
      return Stack(
        children: [
          TabBarView(
              physics: NeverScrollableScrollPhysics(), //η¦ζ­’ pageView ζ»ε¨
              children: [
            ProductDetailFirstPage(_productContent),
            ProductDetailSecondPage(_productContent),
            ProductDetailThridPage(),
          ]),
          Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            color: Colors.black26, width: 0.2))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return CartPage();
                          }));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            Text("θ΄­η©θ½¦")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: ()async{
                            if(_productContent[0].attr.length>0){
                              eventBus.fire(ProductContentEvent(text:"event-ε ε₯θ΄­η©θ½¦"));
                            }else{
                              await CartUtil.addCart(_productContent[0]);
                              //θ°η¨Provider ζ΄ζ°ζ°ζ?
                              cartProvider.updateCartList();
                              ToastUtil.showMsg("ε ε₯θ΄­η©θ½¦ζε");
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            height: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("ε ε₯θ΄­η©θ½¦",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                    ),
                    SizedBox(width: 20),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){
                            ToastUtil.showMsg("η«ε³θ΄­δΉ°");
                          },
                          child: Container(
                            height: double.infinity,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("η«ε³θ΄­δΉ°",
                                style: TextStyle(color: Colors.white)),
                          ),
                        )
                    ),
                    SizedBox(width:10),
                  ],
                ),
              ))
        ],
      );
    }else{
      return LoadingWidget();
    }
  }
}
