import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/widget/http/http_request_demo.dart';

class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  String _msg = "";

  //请求数据
  _getData() async {
    //获取数据的接口： https://jd.itying.com/api/httpGet
    var apiUrl = Uri.parse('https://jd.itying.com/api/httpGet');
    var response = await http.get(apiUrl);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(response.body is String);
    print(response.body is Map);
    print(json.decode(response.body) is Map);
    print('Response DecodeBody:${json.decode(response.body)}');
    setState(() {
      this._msg = json.decode(response.body)["msg"];
    });
  }

  //提交数据
  _postData() async {
    // https://jd.itying.com/api/httpPost
    var apiUrl = Uri.parse('https://jd.itying.com/api/httpPost');
    var response =
        await http.post(apiUrl, body: {"username": "张三111", "age": "20"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(response.body is String);
    print(response.body is Map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http请求演示"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _getData();
                },
                child: Text("Get请求数据")),
            ElevatedButton(
                onPressed: () {
                  _postData();
                },
                child: Text("Post请求数据")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HttpRequestDemo();
                  }));
                },
                child: Text("Get请求渲染数据")),
          ],
        ),
      ),
    );
  }
}
