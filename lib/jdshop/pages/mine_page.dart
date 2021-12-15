import 'package:flutter/material.dart';
import 'package:untitled/jdshop/event/event_bus.dart';
import 'package:untitled/jdshop/pages/login_page.dart';
import 'package:untitled/jdshop/pages/order_page.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/user_util.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';
import 'package:untitled/widget/statefulwidget/scaffold_bottom_navigation_bar_1.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List userInfo = [];
  bool isLogin = false;

  var actionEventBus;

  // {
  //     "message": "注册成功",
  //     "success": true,
  //     "userinfo": [
  //         {
  //             "_id": "613f082fbfe97109b80e713c",
  //             "salt": "fcf1d8d2f36c0cde8eca4b86a8fe1df8",
  //             "tel": "13148735191",
  //             "username": "13148735191"
  //         }
  //     ]
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getUserInfo();
    this.actionEventBus = eventBus.on<UserEvent>().listen((event) {
      print("UserEvent:${event.text}");
      this._getUserInfo();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("_MinePageState---dispose");
    actionEventBus.cancel();
  }

  _getUserInfo() async {
    List userInfo = await UserUtil.getUserInfo();
    bool isLogin = await UserUtil.getUserLoginState();
    setState(() {
      this.userInfo = userInfo;
      print("userInfo:${userInfo}");
      this.isLogin = isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //头部背景栏
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/user_bg.jpg"), fit: BoxFit.cover),
              color: Colors.red,
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("images/user.png"),
                ),
                SizedBox(width: 10),
                isLogin == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "用户名：${userInfo[0]['username'] == null ? "Owen" : userInfo[0]['username']}",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                          Text("普通会员", style: TextStyle(color: Colors.white))
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: Text("登录/注册",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    height: 65,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.assignment, color: Colors.red),
                        SizedBox(width: 30),
                        Text("全部订单",
                            style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return OrderPage();
                    }));
                  },
                ),
                Divider(height: 0.5, color: Colors.black26),
                InkWell(
                  child: Container(
                    height: 65,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.payment, color: Colors.red),
                        SizedBox(width: 30),
                        Text("待付款",
                            style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                  onTap: () {
                    ToastUtil.showMsg("待付款");
                  },
                ),
                Divider(height: 0.5, color: Colors.black26),
                InkWell(
                  child: Container(
                    height: 65,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.local_car_wash, color: Colors.red),
                        SizedBox(width: 30),
                        Text("FlutterDemo",
                            style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return ScaffoldBottomNavigationBar1();
                        }));
                  },
                ),
                Divider(height: 0.5, color: Colors.black26),
                InkWell(
                  child: Container(
                    height: 65,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.green),
                        SizedBox(width: 30),
                        Text("我的收藏",
                            style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                  onTap: () {
                    ToastUtil.showMsg("我的收藏");
                  },
                ),
                Divider(height: 0.5, color: Colors.black26),
                InkWell(
                  child: Container(
                    height: 65,
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(Icons.people, color: Colors.grey),
                        SizedBox(width: 30),
                        Text("在线客服",
                            style: TextStyle(fontSize: 18, color: Colors.black))
                      ],
                    ),
                  ),
                  onTap: () {
                    ToastUtil.showMsg("在线客服");
                  },
                ),
                Divider(height: 0.5, color: Colors.black26),
                this.isLogin
                    ? Container(
                        margin: EdgeInsets.only(left: 10, right: 10, top: 25),
                        child: JdButton(
                          text: "退出登录",
                          height: 45,
                          pressed: doLoginOut,
                        ),
                      )
                    : Text("")
              ],
            ),
          )
        ],
      ),
    );
  }

  doLoginOut() {
    ToastUtil.showMsg("退出登录成功");
    UserUtil.loginOut();
    this._getUserInfo();
  }
}
