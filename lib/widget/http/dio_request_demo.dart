import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioRequestDemo extends StatefulWidget {
  const DioRequestDemo({Key? key}) : super(key: key);

  @override
  _DioRequestDemoState createState() => _DioRequestDemoState();
}

class _DioRequestDemoState extends State<DioRequestDemo> {
  List _list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }
  _getData() async{
    //地址： https://jd.itying.com/api/pcate

    var response = await Dio().get('https://jd.itying.com/api/pcate');
    print(response.data);
    print(response.statusCode);
    if(response.statusCode==200){
      setState(() {
        this._list=response.data["result"];
      });
    }else{
      print(response.statusCode);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("请求数据Demo-Dio"),
        ),
        body:this._list.length>0?ListView(
          children: this._list.map((value){
            return ListTile(title: Text(value["title"]));
          }).toList(),
        ):Text("")
    );
  }
}
