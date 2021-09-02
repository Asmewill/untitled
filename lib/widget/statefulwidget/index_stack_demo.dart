import 'package:flutter/material.dart';

///IndexedStack 和 Stack 一样，都是层布局控件，
/// 可以在一个控件上面放置另一 个控件，但唯一不同的是 IndexedStack
///在同一时刻只能显示子控件中的一个控 件，通过 Index 属性来设置显示的控件。
/// IndexedStack 来保持页面状态的优点就是配置简单。
/// IndexedStack 保持页面状 态的缺点就是不方便单独控制每个页面的状态。
class IndexStackDemo extends StatefulWidget {
  const IndexStackDemo({Key? key}) : super(key: key);

  @override
  _IndexStackDemoState createState() => _IndexStackDemoState();
}

class _IndexStackDemoState extends State<IndexStackDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexStack演示Demo"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: new IndexedStack(
          index: 1,
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              "https://www.itying.com/images/flutter/1.png",
              fit: BoxFit.cover,
            ),
            Image.network("https://www.itying.com/images/flutter/2.png",
                fit: BoxFit.cover)
          ],
        ),
      ),

    );
  }
}
