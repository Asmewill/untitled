import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/model/product_list_model.dart';
import 'package:untitled/jdshop/pages/product_detail_page.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';

class ProductListPage extends StatefulWidget {
  final arguments;

  const ProductListPage({this.arguments, Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  //Scaffold key
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _keywords,_cid;

  /*
  排序:价格升序 sort=price_1 价格降序 sort=price_-1  销量升序 sort=salecount_1 销量降序 sort=salecount_-1
  */
  var _pageSize = 8;
  var _sort = "";
  var _page = 1;

  //解决重复请求的问题
  bool flag = true;

  //是否有下一页数据
  bool _hasMore = true;
  List<ProductListItemModel> _productList = [];
  ScrollController _scrollController = ScrollController(); //Listview的控制器
  List _subHeaderList = [
    {
      "id": 0,
      "title": "综合",
      "fileds": "all",
      "sort": -1,
      //排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 1, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 2, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 3, "title": "筛选"}
  ];

  var _selectHeaderId = 0;
  var _searchController=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._cid=widget.arguments["cid"];
    this._keywords=widget.arguments['keyword'];
    if(this._keywords!=null){
      _searchController.text=this._keywords;//设置初始值
    }
    _getProductListData();
    _scrollController.addListener(() {
      //_scrollController.position.pixels //获取滚动条滚动的高度
      //_scrollController.position.maxScrollExtent  //获取页面高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        print('flag:${flag}----hasMore:${_hasMore}');
        if (this.flag && this._hasMore) {
          _getProductListData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          ///注意：新版本的Flutter中加入Drawer组件会导致默认的返回按钮失效，所以我们需要手动加一下返回按钮
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
            ),
            child: TextField(
              controller: _searchController,
              autofocus: false,
              decoration: InputDecoration(
                hintText: "笔记本",
                hintStyle: TextStyle(color: Colors.black26,fontSize: 16),
                contentPadding: EdgeInsets.only(left: 20),

                border: OutlineInputBorder(
                  //borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
              ),
              onChanged: (value){
                this._keywords=value;
              },
            ),
          ),
          actions: [
            Container(
              width: 45,
              height: 45,
              margin: EdgeInsets.only(right: 10),
              child: TextButton(
                onPressed: () {
                 // print("aaaaaaa");
                  _filterListData(0);
                },
                child: Text("搜索", style: TextStyle(color: Colors.black)),
              ),
            )
          ]




      ),
      body: Stack(
        children: [_productListWidget(), _filterWidget()],
      ),
      endDrawer: Drawer(
        child: Container(
          child: Text("实现筛选功能"),
        ),
      ),
    );
  }

  void _getProductListData() async {
    setState(() {
      this.flag = false;
    });

    var api ;
        //'${Config.domain}api/plist?cid=${widget.arguments["cid"]}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    if(this._keywords==null){
      api ='${Config.domain}api/plist?cid=${this._cid}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    }else{
      api ='${Config.domain}api/plist?search=${this._keywords}&page=${this._page}&sort=${this._sort}&pageSize=${this._pageSize}';
    }

    print('Api:${api}');
    var result = await new Dio().get(api);
    print('返回结果:${result.data}');
    var productList = ProductListModel.fromJson(result.data);
    // setState(() {
    //   this._productList = productList.result;
    // });
    if (productList.result.length < this._pageSize) {
      setState(() {
        this._productList.addAll(productList.result);
        this._hasMore = false;
        this.flag = true;
      });
    } else {
      setState(() {
        this._productList.addAll(productList.result);
        this._page++;
        this.flag = true;
      });
    }
  }

  //显示加载中的圈圈
  Widget _showMore(index) {
    if (this._hasMore) {
      return (index == this._productList.length - 1)
          ? LoadingWidget()
          : Text("");
    } else {
      return (index == this._productList.length - 1)
          ? Container(
              child: Text("--  我是有底线的  --"),
              height: 50,
              alignment: Alignment.center,
            )
          : Text("");
    }
  }

  // decoration: BoxDecoration(
  // border: Border(top: BorderSide(color: Colors.grey,width:0.3))
  // )

  Widget _productListWidget() {
    if (_productList.length > 0) {
      return Container(
        margin: EdgeInsets.only(top: 45),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _productList.length,
          itemBuilder: (context, index) {
            var pic =
                (Config.domain + _productList[index].pic).replaceAll("\\", "/");
            return InkWell(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProductDetailPage(id:_productList[index].id);
                }));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 120,
                        height: 120,
                        alignment: Alignment.topCenter,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Image.network("${pic}", fit: BoxFit.cover),
                        ),
                        //  decoration: BoxDecoration(color: Colors.red),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 5, top: 10, right: 5, bottom: 10),
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("${_productList[index].title}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black)),
                                ),
                                // SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      height: 22,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "8G",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.black12),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: EdgeInsets.only(left: 8, right: 8),
                                      height: 22,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "16G",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.black12),
                                    ),
                                  ],
                                ),
                                //SizedBox(height: 15),
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  //height: double.infinity,
                                  child: Text(
                                    "￥${_productList[index].price}",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  //decoration: BoxDecoration(color: Colors.red),
                                )
                              ],
                            ),
                            //decoration: BoxDecoration(color: Colors.red),
                          ))
                    ],
                  ),
                  Divider(height: 1),
                  _showMore(index)
                ],
              ),
            );
          },
        ),
      );
    } else {
      return LoadingWidget();
    }
  }

  Widget _filterWidget() {
    return Positioned(
      top: 0, //ScreenUtil().screenWidth/4替换Expended布局，可以任意定位
      left: 0, //ScreenUtil().screenWidth/4替换Expended布局，可以任意定位
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))),
        child: Row(
          children: this._subHeaderList.map((item) {
            return InkWell(
              onTap: () {
                print(item['id']);
                //_subHeaderChange(item['id']);
                _filterListData(item['id']);
              },
              child: Container(
                height: 44,
                width: ScreenUtil().screenWidth / _subHeaderList.length,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['title'],
                        style: TextStyle(
                            color: this._selectHeaderId == item['id']
                                ? Colors.red
                                : Colors.black)),
                    showIcons(item['id'])
                  ],
                ),
                decoration: BoxDecoration(color: Colors.white),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget showIcons(int id) {
    if (id == 1 || id == 2) {
      if (_subHeaderList[id]['sort'] == 1) {
        return Icon(Icons.arrow_drop_up);
      } else {
        return Icon(Icons.arrow_drop_down);
      }
    } else {
      return Text("");
    }
  }

  _filterListData(id) {
    if (id == 3) {
      _scaffoldKey.currentState!.openEndDrawer();
      setState(() {
        this._selectHeaderId = id;
      });
    } else {
      setState(() {
        this._selectHeaderId = id;

        //默认降序排列，点击的时候，把其他的项设置为初始值降序排列
        for (var item in _subHeaderList) {
          if (item['id'] != 3) {
            if (id == item['id']) {
              print('sort:${_subHeaderList[id]['sort']}');
              _subHeaderList[id]['sort'] = _subHeaderList[id]['sort'] * -1;
            } else {
              item['sort'] = -1;
            }
          }
        }
        this._page = 1;
        this._sort = "${this._subHeaderList[id]["fileds"]}_${this._subHeaderList[id]["sort"]}";
        this._productList = [];
        this._hasMore = true;
        //回到顶部
        _scrollController.jumpTo(0);
        //重新请求
        this._getProductListData();
      });
    }
  }
// List _subHeaderList = [
//   {
//     "id": 0,
//     "title": "综合",
//     "fileds": "all",
//     "sort": -1, //排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
//   },
//   {"id": 1, "title": "销量", "fileds": 'salecount', "sort": -1},
//   {"id": 2, "title": "价格", "fileds": 'price', "sort": -1},
//   {"id": 3, "title": "筛选"}
// ];

}
