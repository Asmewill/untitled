import 'package:flutter/material.dart';

class TextFieldDemo2 extends StatelessWidget {
  const TextFieldDemo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文本演示页面二"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Column(
              children: <Widget>[
                TextField(),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      hintText: "请输入搜索的内容", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "多行文本框", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "密码框", border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "用户名")),
                SizedBox(height: 20),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "密码",
                      // labelStyle: TextStyle()
                    )),
                SizedBox(height: 20),
                TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.people), hintText: "请输入用户名")),
              ],
            ),
            SizedBox(height: 200)
          ],
        ),
      ),
    );
  }
}
