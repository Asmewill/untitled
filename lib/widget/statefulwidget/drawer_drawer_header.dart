import 'package:flutter/material.dart';

import '../devide_line.dart';

///纯粹自定义的布局
class DrawerDrawerHeader extends StatefulWidget {
  const DrawerDrawerHeader({Key? key}) : super(key: key);

  @override
  _DrawerDrawerHeaderState createState() => _DrawerDrawerHeaderState();
}

class _DrawerDrawerHeaderState extends State<DrawerDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DrawerDrawerHeader演示"),
      ),
      body: Center(
        child: Text("centerr"),
      ),
      drawer: Drawer(
          child:Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.itying.com/images/flutter/2.png"),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(30, 50, 20,0),
                                child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                        "https://www.itying.com/images/flutter/1.png"))),
                            Padding(
                                padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                                child: Text("邮箱:1621722181@qq.com",
                                    style: TextStyle(fontSize: 14, color: Colors.white))),
                            Padding(
                                padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                child: Text(
                                  "地址:深圳市宝安区海纳百川大厦B座7楼706",
                                  style: TextStyle(fontSize: 14, color: Colors.white),overflow:TextOverflow.ellipsis ,
                                ))
                          ],
                        ),
                      ))
                ],
              ),
              ListTile(
                leading: CircleAvatar(
                  child:Icon(Icons.people),
                ),
                title: Text("个人中心"),
              ),
              DeviceLine(),
              ListTile(
                leading: CircleAvatar(
                  child:Icon(Icons.people),
                ),
                title: Text("设置中心"),
              ),
              DeviceLine(),
            ],
          )),
      endDrawer: Drawer(),
    );
  }
}
