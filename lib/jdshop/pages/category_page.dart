import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/model/left_model.dart';
import 'package:untitled/jdshop/model/right_model.dart';
import 'package:untitled/jdshop/pages/product_list_page.dart';
import 'package:untitled/widget/stack_align.dart';
import 'package:untitled/widget/stack_test_demo.dart';
import 'package:untitled/widget/statefulwidget/index_stack_demo.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  List<LeftItemModel> _leftList = [];
  List<RightItemModel> _rightList = [];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; //缓存当前页面
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLeftData();
  }

  void _getLeftData() async {
    var api = "${Config.domain}api/pcate";
    var result = await Dio().get(api);
    print("${result.data}");
    var leftModel = LeftModel.fromJson(result.data);
    setState(() {
      this._leftList = leftModel.result;
    });
    _getRightData(leftModel.result[0].id);
  }

  void _getRightData(var pid) async {
    var api = "${Config.domain}api/pcate?pid=${pid}";
    var result = await Dio().get(api);
    print("${result.data}");
    var rightModel = RightModel.fromJson(result.data);
    setState(() {
      this._rightList = rightModel.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_leftContent(), _rightGridViewBuildContent()],
    );
  }

  Widget _leftContent() {
    if (_leftList.length > 0) {
      return Expanded(
          flex: 1,
          child: Container(
              child: ListView.builder(
                  itemCount: _leftList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _getRightData(_leftList[index].id);
                          _currentIndex = index;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: Text("${_leftList[index].title}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: _currentIndex == index
                                        ? Colors.red
                                        : Colors.black)),
                            decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.black12
                                    : Colors.white,
                                // border: Border(
                                //     bottom: BorderSide(
                                //         color: Colors.grey, width: 0.2)
                                // )
                            ),
                          ),
                          Divider(height: 1)
                        ],
                      ),
                    );
                  })));
    } else {
      return Expanded(
        flex: 1,
        child: Container(
          alignment: Alignment.center,
          child: Text("加载中..."),
        ),
      );
    }
  }

  ///使用GridView实现
  Widget _rightGridViewBuildContent() {
    if (_rightList.length > 0) {
      double itemWidth = (ScreenUtil().screenWidth * 3 / 4 - 40) / 3;
      double itemHeight = itemWidth + 28;
      return Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            padding: EdgeInsets.all(10),
            alignment: Alignment.topCenter, //这个属性必须设置一下,控制字view居中，顶部显示
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(), ///取消滚动效果physics: NeverScrollableScrollPhysics();
                itemCount: _rightList.length,
                shrinkWrap: true,

                ///Container跟随GridView内容变化高度, shrinkWrap:true;
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //一行显示的Widget的个数
                  childAspectRatio: itemWidth / itemHeight,
                  //宽高比
                  mainAxisSpacing: 5,
                  //水平间距
                  crossAxisSpacing: 5,
                ),
                //竖直间距
                itemBuilder: (context, index) {
                  var pic = (Config.domain + _rightList[index].pic)
                      .replaceAll("\\", "/");
                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                         //return StackTestDemo();
                          return ProductListPage(arguments: {"cid": _rightList[index].id});
                      }));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: itemWidth,
                          child: AspectRatio(
                              aspectRatio: 1.0 / 1.0,
                              child:
                                  Image.network("${pic}", fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 28,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text("${_rightList[index].title}"),
                          decoration: BoxDecoration(
                              // color: Colors.black
                              ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ));
    } else {
      return Expanded(
          flex: 3,
          child: Container(alignment: Alignment.center, child: Text("加载中...")));
    }
  }

  ///使用GridView实现
  Widget _rightGridViewCountContent() {
    double itemWidth = (ScreenUtil().screenWidth * 3 / 4 - 40) / 3;
    double itemHeight = itemWidth + 28;
    return Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          padding: EdgeInsets.all(10),
          alignment: Alignment.topCenter, //这个属性必须设置一下,控制字view居中，顶部显示
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: GridView.count(
              /// shrinkWrap:true, ///Container跟随GridView内容变化高度, shrinkWrap:true;
              ///  physics: NeverScrollableScrollPhysics(),///取消滚动效果
              crossAxisCount: 3,
              //一行显示的Widget的个数
              childAspectRatio: itemWidth / itemHeight,
              //宽高比
              mainAxisSpacing: 5,
              //水平间距
              crossAxisSpacing: 5,
              //竖直间距
              children: [
                InkWell(
                  onTap: () {
                    print("111");
                  },
                  child: Column(
                    children: [
                      Container(
                        width: itemWidth,
                        child: AspectRatio(
                            aspectRatio: 1.0 / 1.0,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/1.png",
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 28,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("保暖夹克"),
                        decoration: BoxDecoration(
                            // color: Colors.black
                            ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("111");
                  },
                  child: Column(
                    children: [
                      Container(
                        width: itemWidth,
                        child: AspectRatio(
                            aspectRatio: 1.0 / 1.0,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/1.png",
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 28,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("保暖夹克"),
                        decoration: BoxDecoration(
                            // color: Colors.black
                            ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("111");
                  },
                  child: Column(
                    children: [
                      Container(
                        width: itemWidth,
                        child: AspectRatio(
                            aspectRatio: 1.0 / 1.0,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/1.png",
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: 28,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text("保暖夹克"),
                        decoration: BoxDecoration(
                            // color: Colors.black
                            ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  ///使用Wrap实现
  Widget _rightWrapContent() {
    return Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          padding: EdgeInsets.all(10),
          alignment: Alignment.topCenter, //这个属性必须设置一下,控制字view居中，顶部显示
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Wrap(
              spacing: 5,
              runSpacing: 4,
              children: [
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                        child: AspectRatio(
                            aspectRatio: 1.0 / 1.0,
                            child: Image.network(
                                "https://www.itying.com/images/flutter/1.png",
                                fit: BoxFit.cover)),
                      ),
                      Text("保暖夹克")
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: (ScreenUtil().screenWidth * 3 / 4 - 40) / 3,
                      child: AspectRatio(
                          aspectRatio: 1.0 / 1.0,
                          child: Image.network(
                              "https://www.itying.com/images/flutter/1.png",
                              fit: BoxFit.cover)),
                    ),
                    Text("保暖夹克")
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
