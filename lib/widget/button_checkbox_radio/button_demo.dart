import 'package:flutter/material.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/widget/statefulwidget/custom_button.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮演示页面"),
        actions: [
          IconButton(
              onPressed: () {
                print("IconButton");
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    print("普通按钮");
                  },
                  child: Text("普通按钮")),
              SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  print("颜色按钮");
                },
                child: Text("颜色按钮"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  //foregroundColor: MaterialStateProperty.all(Colors.black)
                ),
              ),
              SizedBox(width: 5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("阴影按钮");
                },
                child: Text("阴影按钮"),
                style: ButtonStyle(elevation: MaterialStateProperty.all(50)),
              ),
              SizedBox(width: 5),
              ElevatedButton.icon(
                onPressed: () {
                  print("图标按钮");
                },
                icon: Icon(Icons.search),
                style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 16))),
                label: Text("图标按钮"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("宽度高度");
                  },
                  child: Text("宽度高度"),
                  style: ButtonStyle(
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 16))),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  onPressed: () {
                    print("自适应按钮");
                  },
                  child: Text("自适应按钮"),
                  style: ButtonStyle(
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 16))),
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  print("圆角按钮");
                },
                child: Text("圆角按钮"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Container(
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    print("圆形按钮");
                  },
                  child: Text("圆形按钮"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          CircleBorder(side: BorderSide(color: Colors.black))),//CircleBorder
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.black)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  print("文本按钮");
                },
                child: Text("文本按钮"),
                // style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(Colors.white),
                //     foregroundColor: MaterialStateProperty.all(Colors.blue)
                // ),
              ),
              OutlinedButton(
                  onPressed: () {
                    print("线框按钮");
                  },
                  child: Text("线框按钮"))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: OutlinedButton(
                      onPressed: () {
                        print("注册");
                      },
                      child: Text("注册")),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBar(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        print("登录");
                      },
                      child: Text("登录")),
                  ElevatedButton(
                      onPressed: () {
                        print("注册");
                      },
                      child: Text("注册")),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton("我是自定义按钮", () {
                  ToastUtil.showMsg("我是自定义按钮");
              }, width: 200, height: 50)
            ],
          )
        ],
      ),
    );
  }
}
