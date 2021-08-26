import 'package:flutter/cupertino.dart';

//listView所包含的Widget是自适应宽度的
class ListViewPaddingImageContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return ListView(
        padding: EdgeInsets.all(10),
        children: [
          Image.network("https://iconfont.alicdn.com/t/ff6e3a4d-9e5f-4d38-a9bf-0a9f49544733.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            height: 40,
            //alignment: Alignment.center,
          ),
          Image.network("https://iconfont.alicdn.com/t/ff6e3a4d-9e5f-4d38-a9bf-0a9f49544733.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18

              ),
            ),
            height: 40,
            //alignment: Alignment.center,
          ),
          Image.network("https://iconfont.alicdn.com/t/ff6e3a4d-9e5f-4d38-a9bf-0a9f49544733.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18

              ),
            ),
            height: 40,
            //alignment: Alignment.center,
          ),
          Image.network("https://iconfont.alicdn.com/t/ff6e3a4d-9e5f-4d38-a9bf-0a9f49544733.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18

              ),
            ),
            height: 40,
            //alignment: Alignment.center,
          ),
          Image.network("https://iconfont.alicdn.com/t/ff6e3a4d-9e5f-4d38-a9bf-0a9f49544733.png"),
          Container(
            child: Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18

              ),
            ),
            height: 40,
            //alignment: Alignment.center,
          ),

        ],
      );

  }
  
}