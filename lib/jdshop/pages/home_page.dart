import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/model/banner_model.dart';
import 'package:untitled/jdshop/model/hot_product_model.dart';
import 'package:untitled/jdshop/model/you_like_model.dart';
import 'package:untitled/jdshop/pages/product_detail_page.dart';
import 'package:untitled/jdshop/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerItemModel> _bannerList = [];
  List<YouLikeItemModel> _youlikeList = [];
  List<HotProductItemModel> _hotProductList = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; //保持页面状态，防止每次都从新加载页面

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBannerData();
    _getGuessYouLike();
    _getHotProduct();
  }

  void _getHotProduct() async {
    var api = Config.domain + "api/plist?is_best=1";
    print("api:${api}");
    var result = await Dio().get(api);
    print("返回结果:${result}");
    var hotProductModel = HotProductModel.fromJson(result.data);
    setState(() {
      _hotProductList = hotProductModel.result;
    });
  }

  //请求轮播图数据
  void _getBannerData() async {
    var api = Config.domain + "api/focus";
    print("api:${api}");
    var result = await Dio().get(api);
    print("返回结果:${result}");
    var bannerModel = BannerModel.fromJson(result.data);
    //print("result.data:${result.data}");
    setState(() {
      this._bannerList = bannerModel!.result!;
    });
  }

  void _getGuessYouLike() async {
    var api = Config.domain + "api/plist?is_hot=1";
    print("api:${api}");
    var result = await Dio().get(api);
    print("返回结果:${result}");
    var youlikeMode = YouLikeModel.fromJson(result.data);
    setState(() {
      this._youlikeList = youlikeMode.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.center_focus_weak),
          onPressed: () {},
        ),
        title: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SearchPage();
            }));
          },
          child: Container(
            padding: EdgeInsets.only(left: 10),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23), color: Colors.black12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black26,
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, bottom: 2),
                  child: Text("笔记本",
                      style: TextStyle(fontSize: 16, color: Colors.black26)),
                )
              ],
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.message))],
      ),
      body: ListView(
        children: [
          _swiperWidget(),
          _guessYouLikeWidget(),
          _hotWidget(),
        ],
      ),
    );
  }

  ///轮播图
  Widget _swiperWidget() {
    if (_bannerList.length > 0) {
      return Container(
        child: AspectRatio(
          aspectRatio: 2 / 1,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              var pic = Config.domain + _bannerList[index].pic;
              var picUrl = pic.replaceAll("\\", "/");
              return new Image.network(
                "${picUrl}",
                fit: BoxFit.cover,
              );
            },
            itemCount: _bannerList.length,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    //color: Color.fromRGBO(200, 200, 200, 0.5),
                    color: Colors.blue,
                    size: 8.0,
                    activeSize: 8.0)),
            autoplay: true,
          ),
        ),
      );
    } else {
      return Text("加载中...");
    }
  }

  ///猜你喜欢
  Widget _guessYouLikeWidget() {
    if (_youlikeList.length > 0) {
      return Column(
        children: [
          Container(
            height: 25,
            margin: EdgeInsets.only(left: 15, top: 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 5, color: Colors.red))),
            child: Text("猜你喜欢"),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 10),
            height: 116,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _youlikeList.length,
                itemBuilder: (context, index) {
                  //图片去除\\转换
                  var pic = Config.domain + _youlikeList[index].pic!;
                  var picUrl = pic.replaceAll("\\", "/");
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetailPage(id: _youlikeList[index].id);
                      }));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          margin: EdgeInsets.only(right: 10), //距离右边的边距
                          child: AspectRatio(
                              aspectRatio: 1.0 / 1.0,
                              child: Image.network(picUrl, fit: BoxFit.cover)),
                        ),
                        Container(
                          width: 85,
                          padding: EdgeInsets.only(top: 5),
                          alignment: Alignment.center,
                          child: Text(
                            "￥${_youlikeList[index].price}",
                            style: TextStyle(fontSize: 12, color: Colors.red),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      );
    } else {
      return Text("加载中...");
    }
  }

  ///热门推荐
  Widget _hotWidget() {
    if (_hotProductList.length > 0) {
      return Column(
        children: [
          Container(
            height: 25,
            margin: EdgeInsets.only(left: 15, top: 5),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                border: Border(left: BorderSide(width: 5, color: Colors.red))),
            child: Text("热门推荐"),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
              child: Wrap(
                runSpacing: 10.0, //竖直间距
                spacing: 10, //水平间距
                children: _hotProductList.map((item) {
                  var pic = Config.domain + "${item.pic}";
                  var picUrl = pic.replaceAll("\\", "/");
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetailPage(id: item.id);
                      }));
                    },
                    child: Container(
                        width: (ScreenUtil().screenWidth - 40) / 2,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.black12)),
                        child: Column(
                          children: [
                            Container(
                              child: AspectRatio(
                                aspectRatio: 1.0 / 1.0,
                                child: Image.network(picUrl, fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text("￥${item.title}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "￥${item.price}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.red),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("￥${item.oldPrice}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                }).toList(),
              ))
        ],
      );
    } else {
      return Text("加载中...");
    }
  }
}
