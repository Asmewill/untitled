import 'package:flutter/material.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/widget/dialog/message_dialog.dart';
import 'package:untitled/widget/dialog/my_loadingdialog.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({Key? key}) : super(key: key);

  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog用法演示"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    showAlertDialog();
                  },
                  child: Text("AlertDialog")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    showSimpleDialog();
                  },
                  child: Text("SimpleDialog")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    showMModalBottomSheet();
                  },
                  child: Text("showModalBottomSheet")),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MyLoadingDialog(text: "加载中...");
                        });
                  },
                  child: Text("自定义LoadingDialog")),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MessageDialog(
                            title: "提示信息",
                            message:
                                "开发中,我们经常需要向用户展示信息,多数情况下,我们使用dialog展示提示信息,那么在Flutter中如何创建dialog, 并使用呢?现在就让我们来看看如何打造我们自己的dialog对象",
                            negativeText: "取消",
                            positiveText: "确定",
                            onCloseEvent: () {
                              Navigator.pop(context);
                            },
                            onPositivePressEvent: () {
                              ToastUtil.showMsg("确定");
                              Navigator.pop(context);
                            },
                          );
                        });
                  },
                  child: Text("自定义LoadingDialog")),
            ],
          )
        ],
      ),
    );
  }

  void showAlertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("确定要删除吗?"),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, "ok");
                  },
                  child: Text("确定")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, "cancel");
                  },
                  child: Text("取消")),
            ],
          );
        });
    print("result:$result");
  }

  void showSimpleDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("选择内容", textAlign: TextAlign.center),
                  Icon(Icons.close)
                ],
              ),
            ),
            children: [
              // Text("选择内容"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("选择内容"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("选择内容"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("Text1"),
              // Text("Text1"),
              Divider(height: 1),
              SimpleDialogOption(
                child: Text("Option A"),
                onPressed: () {
                  ToastUtil.showMsg("Option A");
                },
              ),
              Divider(height: 1),
              SimpleDialogOption(
                child: Text("Option B"),
                onPressed: () {
                  ToastUtil.showMsg("Option B");
                },
              ),
              Divider(height: 1),
              SimpleDialogOption(
                child: Text("Option C"),
                onPressed: () {
                  ToastUtil.showMsg("Option C");
                },
              )
            ],
          );
        });
    print("result:$result");
  }

  showMModalBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            child: ListView(
              children: [
                ListTile(
                  title: Text("分享 A"),
                  onTap: () {
                    ToastUtil.showMsg("分享 A");
                    Navigator.pop(context, "分享 A");
                  },
                ),
                ListTile(
                  title: Text("分享 B"),
                  onTap: () {
                    ToastUtil.showMsg("分享 B");
                    Navigator.pop(context, "分享 B");
                  },
                ),
                ListTile(
                  title: Text("分享 C"),
                  onTap: () {
                    ToastUtil.showMsg("分享 C");
                    Navigator.pop(context, "分享 C");
                  },
                )
              ],
            ),
          );
        });
    print("result:$result");
  }
}
