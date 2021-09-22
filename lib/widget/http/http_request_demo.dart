import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpRequestDemo extends StatefulWidget {
  const HttpRequestDemo({Key? key}) : super(key: key);
  @override
  _HttpRequestDemoState createState() => _HttpRequestDemoState();
}

class _HttpRequestDemoState extends State<HttpRequestDemo> {
  List _list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }
  _getData()async{
    //地址： https://jd.itying.com/api/plist?is_hot=1
    var apiUrl = Uri.parse('https://www.wanandroid.com/banner/json');
    print("api:${apiUrl}");
    var response = await http.get(apiUrl);
    print("result:${response}");
    if(response.statusCode==200){
      print("resultBody:${response.body}");
      print("decodeBody:${json.decode(response.body)}");
      setState(() {
        this._list=json.decode(response.body)["data"];
      });
    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据Demo"),
        ),
        body:this._list.length>0?ListView.builder(
          itemCount:this._list.length ,
          itemBuilder: (context,index){
            return ListTile(title: Text(this._list[index]["title"]));
          },
        ):Text("loading")
    );
  }
}
