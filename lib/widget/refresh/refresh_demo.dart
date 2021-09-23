import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';
import 'package:untitled/widget/refresh/news_detail_1.dart';
import 'package:untitled/widget/refresh/news_detail_2.dart';

class RefreshDemo extends StatefulWidget {
  const RefreshDemo({Key? key}) : super(key: key);

  @override
  _RefreshDemoState createState() => _RefreshDemoState();
}

class _RefreshDemoState extends State<RefreshDemo> {
  List _list = [];
  int _page = 1;
  var _pageSize = 20;
  bool _hasMore = true; //判断有没有数据
  ScrollController _scrollController = new ScrollController();

  //解决重复请求的问题
  bool flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
    //监听滚动条事件
    _scrollController.addListener(() {
      // print(_scrollController.position.pixels); //获取滚动条下拉的距离
      // print(_scrollController.position.maxScrollExtent); //获取整个页面的高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        if (this.flag && this._hasMore) {
          _getData();
        }
      }
    });
  }

  void _getData() async {
    setState(() {
      this.flag = false;
    });

    await Future.delayed(Duration(milliseconds: 500), () async{
      var apiUrl =
          "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}";
      print("api:${apiUrl}");
      var result = await Dio().get(apiUrl);
      print("返回结果:${result}");
      print("response.data is Map :${result.data is Map}");
      print("response.data is String :${result.data is String}");
      List tempList = json.decode(result.data)["result"];
      if (tempList.length < this._pageSize) {
        setState(() {
          this._list.addAll(tempList);
          this._hasMore = false;
          this.flag = true;
        });
      } else {
        setState(() {
          this._list.addAll(tempList);
          this._page++;
          this.flag = true;
        });
      }

    });

  }

  //下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      print('请求数据完成');
      this._page = 1;
      this._hasMore = true;
      this.flag = true;
      this._list.clear();
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻列表"),
      ),
      body: this._list.length > 0
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: this._list.length, //20
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title:
                          Text("${this._list[index]["title"]}", maxLines: 1),
                        ),
                        Divider(height: 1,color: Colors.black26,),
                        _showMore(index)
                      ],
                    ),
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                         if(index % 2==0){
                           return NewsDetailPage1(aid:_list[index]['aid']);
                         }else{
                           return NewsDetailPage2(aid:_list[index]['aid']);
                         }
                       }));
                    },
                  );
                },
              ))
          : LoadingWidget(),
    );
  }

  //显示加载中的圈圈
  Widget _showMore(index) {
    if (this._hasMore) {
      return (index == this._list.length - 1) ? LoadingWidget() : Container();
    } else {
      return (index == this._list.length - 1)
          ? Container(
              child: Text("--  我是有底线的  --"),
              height: 50,
              alignment: Alignment.center,
            )
          : Container();
    }
  }
}
