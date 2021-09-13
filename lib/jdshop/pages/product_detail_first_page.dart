import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/model/product_detail_model.dart';
import 'package:untitled/jdshop/provider/cart_provider.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/cart_util.dart';
import 'package:untitled/jdshop/utils/image_util.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';
import 'package:untitled/jdshop/widget/cart_num.dart';

class ProductDetailFirstPage extends StatefulWidget {
  List<ProductDetailItemModel> _productContent;

  ProductDetailFirstPage(this._productContent, {Key? key}) : super(key: key);

  @override
  _ProductDetailFirstPageState createState() => _ProductDetailFirstPageState();
}

class _ProductDetailFirstPageState extends State<ProductDetailFirstPage>
    with AutomaticKeepAliveClientMixin {
  late List<ProductDetailItemModel> _productContent;
  late ProductDetailItemModel itemModel;
  List<Attr> _attr = [];
  var _selectValue;

  ///当 State 对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("ProductDetailFirstPage---didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant ProductDetailFirstPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("ProductDetailFirstPage---didUpdateWidget");
  }

  ///reassemble()：此回调是专门为了开发调试而提供的，
  ///在热重载（hot reload）时会被调用，此回调在Release 模式下永远不会被调用。
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("ProductDetailFirstPage---reassemble");
  }

  ///当 State 对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("ProductDetailFirstPage---deactivate");
  }

  var actionEventBus;

  ///当 State 对象从树中被永久移除时调用。通常在此回调中释放资源。
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("ProductDetailFirstPage---dispose");
    actionEventBus.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("ProductDetailFirstPage---initState");
    _productContent = widget._productContent;
    itemModel = _productContent[0];
    _attr = _productContent[0].attr;
    _initAttr();
    this.actionEventBus = eventBus.on<ProductContentEvent>().listen((event) {
      print(event.text);
      this._attrBottomSheet();
    });
    //[{"cate":"鞋面材料","list":["牛皮 "]},{"cate":"闭合方式","list":["系带"]},{"cate":"颜色","list":["红色","白色","黄色"]}]

    // list":["系带","非系带"]

    /*
    [

        {
        "cate":"尺寸",
        list":[{

              "title":"xl",
              "checked":false
            },
            {

              "title":"xxxl",
              "checked":true
            },
          ]
        },
        {
        "cate":"颜色",
        list":[{

              "title":"黑色",
              "checked":false
            },
            {

              "title":"白色",
              "checked":true
            },
          ]
        }
    ]
   */
  }

  _initAttr() {
    for (var i = 0; i < _attr.length; i++) {
      List tempList = _attr[i].list!;
      _attr[i].attrList = [];
      for (var j = 0; j < tempList.length; j++) {
        if (j == 0) {
          _attr[i].attrList.add({'title': tempList[j], 'checked': true});
        } else {
          _attr[i].attrList.add({'title': tempList[j], 'checked': false});
        }
      }
    }
    _setSelectedValue();
    // print("_attr:${json.encode(_attr[0].attrList)}");
  }

  late CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    print("ProductDetailFirstPage---build");
    cartProvider = Provider.of<CartProvider>(context);
    if (_productContent.length > 0) {
      return ListView(
        children: [
          Container(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(ImageUtil.getPicUrl(itemModel.pic),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "${itemModel.title}",
              style: TextStyle(fontSize: 20, color: Colors.black),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          itemModel.subTitle!=null? Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "${itemModel.subTitle}",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ):Text(""),
          //特价，原价
          Stack(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 10),
                //decoration: BoxDecoration(color: Colors.red),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("特价:"),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 2),
                      child: Text(
                        "￥${itemModel.price}",
                        style: TextStyle(fontSize: 22, color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(right: 10),
                  //decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("原价:"),
                      ),
                      Container(
                        child: Text(
                          "￥${itemModel.oldPrice}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(height: 0.2, color: Colors.black26),
          //选择属性
          _attrWidget(),
          Divider(height: 0.2, color: Colors.black26),
          Container(
            height: 55,
            padding: EdgeInsets.only(left: 10),
            //decoration: BoxDecoration(color: Colors.red),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "运费:",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 15),
                Text(
                  "免费",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 0.2, color: Colors.black26),
          SizedBox(height: 200)
        ],
      );
    } else {
      return LoadingWidget();
    }
  }

  ///ListView的二种实现方式
  Widget listStyleWidget(setBottomState, styleType) {
    if (styleType == 1) {
      return ListView.builder(
        itemCount: _attr.length + 1,
        itemBuilder: (context, index) {
          if (index == _attr.length) {
            return Container(
              margin: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [Text("数量 :    "), CartNum(itemModel)],
              ),
            );
          } else {
            return Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text("${_attr[index].cate}:",
                          style: TextStyle(color: Colors.black)),
                    ),
                    Expanded(
                        flex: 1,
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _attr[index].attrList!.map((item) {
                            return InkWell(
                              onTap: () {
                                _changeAttr(
                                    _attr[index],
                                    _attr[index].cate.toString(),
                                    item,
                                    setBottomState);
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(item['title'],
                                        style: TextStyle(
                                            color: item['checked']
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 14))
                                  ],
                                ),
                                height: 50,
                                padding: EdgeInsets.only(left: 30, right: 30),
                                decoration: BoxDecoration(
                                    color: item['checked']
                                        ? Colors.red
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            );
                          }).toList(),
                        ))
                  ],
                ),
              ],
            );
          }
        },
      );
    } else {
      return ListView(
        children: [
          Column(
            children: _attr.map((Attr itemParent) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Text("${itemParent.cate}:",
                            style: TextStyle(color: Colors.black)),
                      ),
                      Expanded(
                          flex: 1,
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: itemParent.attrList!.map((item) {
                              return InkWell(
                                onTap: () {
                                  _changeAttr(
                                      itemParent,
                                      itemParent.cate.toString(),
                                      item,
                                      setBottomState);
                                },
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(item['title'],
                                          style: TextStyle(
                                              color: item['checked']
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 14))
                                    ],
                                  ),
                                  height: 50,
                                  padding: EdgeInsets.only(left: 30, right: 30),
                                  decoration: BoxDecoration(
                                      color: item['checked']
                                          ? Colors.red
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              );
                            }).toList(),
                          ))
                    ],
                  )
                ],
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 20),
            child: Row(
              children: [Text("数量 :    "), CartNum(itemModel)],
            ),
          )
        ],
      );
    }
  }

  _attrBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setBottomState) {
            return Stack(
              children: [
                listStyleWidget(setBottomState, 2),
                Positioned(
                  bottom: 0,
                  height: 50,
                  width: ScreenUtil().screenWidth, //必须设置宽度和高度
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.3))),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                //加入购物车
                                onPressed: () async {
                                  //print("加入购物车");
                                  await CartUtil.addCart(itemModel);
                                  Navigator.pop(context);
                                  cartProvider.updateCartList();
                                  ToastUtil.showMsg("加入购物车成功");

                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                child: Text("加入购物车",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  print("立即购买");
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)))),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.orangeAccent),
                                ),
                                child: Text("立即购买",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                )
              ],
            );
          });
        });
  }

  _changeAttr(
      Attr attrItem, String cate, Map currentItem, dynamic setBottomState) {
    setBottomState(() {
      for (var i = 0; i < attrItem.attrList!.length; i++) {
        if (currentItem['title'].toString() ==
                attrItem.attrList[i]["title"].toString() &&
            (cate == attrItem.cate)) {
          attrItem.attrList[i]['checked'] = true;
        } else {
          attrItem.attrList[i]['checked'] = false;
        }
      }
      print(attrItem.attrList);
      _setSelectedValue();
    });
  }

  _setSelectedValue() {
    List tempList = [];
    for (int m = 0; m < _attr.length; m++) {
      for (int n = 0; n < _attr[m].attrList.length; n++) {
        if (_attr[m].attrList[n]['checked'] == true) {
          tempList.add(_attr[m].attrList[n]["title"]);
        }
      }
    }
    setState(() {
      _selectValue = tempList.join(" , ");
      //给筛选属性赋值
      this.itemModel.selectedAttr = this._selectValue;
    });
    // print("已选属性值：${tempList}");
  }

  Widget _attrWidget() {
    if (_attr.length > 0) {
      return InkWell(
        child: Container(
          height: 55,
          padding: EdgeInsets.only(left: 10),
          //decoration: BoxDecoration(color: Colors.red),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "已选:",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 15),
              Text(
                "${_selectValue}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          _attrBottomSheet();
        },
      );
    } else {
      return Container();
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
