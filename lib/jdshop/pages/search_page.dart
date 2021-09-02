import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/jdshop/pages/product_list_page.dart';
import 'package:untitled/jdshop/pages/search_list_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var keyWord="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
          ),
          child: TextField(
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
              this.keyWord=value;
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                      print("value:${this.keyWord}");
                  return ProductListPage(arguments: {"keyword":this.keyWord});
                }));
              },
              child: Text("搜索", style: TextStyle(color: Colors.black)),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 10),
            child: Text("热搜",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            width: double.infinity,
            height: 30,
            padding: EdgeInsets.only(left: 10),
            // decoration: BoxDecoration(color: Colors.red),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Text(
                          "超级秒杀",
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ),
                      onTap: () {
                        print("秒杀");
                      },
                    ),
                    SizedBox(width: 10)
                  ],
                );
              },
            ),
          ),
          Container(
            height: 12,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(color: Colors.black12),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: Text("历史记录",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
          Divider(height: 1),
          Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1))
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1))
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1))
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1)),
                  Container(
                    height: 45,
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.centerLeft,
                    child: Text("笔记本电脑",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Divider(height: 1))
                ],
              ),
              SizedBox(height: 50),
              InkWell(
                child: Container(
                  height: 50,
                  width: ScreenUtil().screenWidth / 2,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // margin: EdgeInsets.only(top: 50, left: 50, right: 50,bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.delete), Text("清空历史记录")],
                  ),
                ),
                onTap: () {
                  print("clear history");
                },
              ),
              SizedBox(height: 50),
            ],
          )
        ],
      ),
    );
  }
}
