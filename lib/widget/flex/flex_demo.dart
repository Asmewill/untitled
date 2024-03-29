import 'package:flutter/material.dart';

class FlexDemo extends StatefulWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  _FlexDemoState createState() => _FlexDemoState();
}

class _FlexDemoState extends State<FlexDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flex功能展示"),
      ),
      body: Column(

        children: <Widget>[
          // Flex的两个子widget按1:2来占据水平空间
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 100.0,
              // Flex的三个子widget，在垂直方向按2:1:1来占用100像素的空间
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
