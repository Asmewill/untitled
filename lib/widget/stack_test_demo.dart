import 'package:flutter/material.dart';
///后面的控件覆盖前面的控件
///Postioned中最好不要嵌套Expended组件，否则会导致定位失效
class StackTestDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StackTest演示demo"),
      ),
      body: Stack(
        children: [
          Container(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(color: Colors.black),
                          ))
                    ],
                  );
                }),
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.blue),
              )),
          Positioned(
              top: 200,
              left: 100,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.red),
              )),

        ],
      ),
    );
  }
}
