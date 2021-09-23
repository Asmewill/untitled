import 'package:flutter/material.dart';

///这种是固定样式
class DrawerUserAccountsDrawerHeader extends StatefulWidget {
  const DrawerUserAccountsDrawerHeader({Key? key}) : super(key: key);

  @override
  _DrawerUserAccountsDrawerHeaderState createState() =>
      _DrawerUserAccountsDrawerHeaderState();
}

class _DrawerUserAccountsDrawerHeaderState
    extends State<DrawerUserAccountsDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DrawerUserAccountsDrawerHeader演示"),
        ),
        body: Center(
          child: Text("Center"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Asmewill"),
                accountEmail: Text("1621722181@qq.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/2.png"),
                ),
                otherAccountsPictures: [
                  Image.network("https://www.itying.com/images/flutter/1.png"),
                  Image.network("https://www.itying.com/images/flutter/2.png"),
                  Image.network("https://www.itying.com/images/flutter/3.png"),
                ],
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.itying.com/images/flutter/1.png"),
                        fit: BoxFit.cover)),
              ),
              ListTile(
                title: Text("个人中心"),
                leading: CircleAvatar(child: Icon(Icons.people)),
              ),
              Divider(),
              ListTile(
                title: Text("系统设置"),
                leading: CircleAvatar(child: Icon(Icons.settings)),
              )
            ],
          ),
        ));
  }
}
