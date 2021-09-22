import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widget/http/dio_request_demo.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({Key? key}) : super(key: key);

  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  String _msg = "";

  //请求数据
  _getData() async {
    //获取数据的接口： https://jd.itying.com/api/httpGet
    var response = await Dio().get('https://jd.itying.com/api/httpGet');
    print(response.data);
    print(response.data is Map);
    setState(() {
      this._msg = response.data["msg"];
    });
  }

  //提交数据
  _postData() async {
    // 地址：https://jd.itying.com/api/httpPost
    var response = await Dio().post('https://jd.itying.com/api/httpPost',
        data: {"username": "张三111", "age": "20"});
    print(response.data);
    print(response.data is Map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio网络请求演示"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this._msg),
            ElevatedButton(
              child: Text('Get请求数据'),
              onPressed: _getData,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Post提交数据'),
              onPressed: _postData,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Get请求数据 渲染数据'),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DioRequestDemo();
                }));
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
