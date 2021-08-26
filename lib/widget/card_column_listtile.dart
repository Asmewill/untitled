import 'package:flutter/material.dart';

class CardColumnListTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return ListView(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text("张三",style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师"),
                ),
                SizedBox(height: 0.3,child: Container(height: 0.3,decoration: BoxDecoration(color: Colors.grey),),),
                ListTile(
                  title: Text("电话:13148735190"),
                ),
                ListTile(
                  title: Text("地址:深圳市宝安区福永街道1001号"),
                )
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text("李四",style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师"),
                ),
                SizedBox(height: 0.3,child: Container(height: 0.3,decoration: BoxDecoration(color: Colors.grey),),),
                ListTile(
                  title: Text("电话:15072610423"),
                ),
                ListTile(
                  title: Text("地址:深圳市宝安区福永街道1002号"),
                )

              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text("王五",style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师"),
                ),
                SizedBox(height: 0.3,child: Container(height: 0.3,decoration: BoxDecoration(color: Colors.grey),),),
                ListTile(
                  title: Text("电话:18279259491"),
                ),
                ListTile(
                  title: Text("地址:深圳市宝安区福永街道1003号"),
                )
              ],
            ),
          )
        ],
      );
  }

}