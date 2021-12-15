import 'package:flutter/material.dart';
import 'package:untitled/widget/button_checkbox_radio/checkbox_demo.dart';
import 'package:untitled/widget/button_checkbox_radio/radio_demo.dart';
import 'package:untitled/widget/dialog/dialog_demo.dart';
import 'package:untitled/widget/flex/flex_demo.dart';
import 'package:untitled/widget/http/dio_demo.dart';
import 'package:untitled/widget/http/http_demo.dart';
import 'package:untitled/widget/http/http_request_demo.dart';
import 'package:untitled/widget/pages/form_page.dart';
import 'package:untitled/widget/picker/image_picker_page.dart';
import 'package:untitled/widget/refresh/refresh_demo.dart';

class CategoryPage extends StatefulWidget {
   CategoryPage({Key? key,}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(15),
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,//不生效,必须Container包裹
        children: [
          ElevatedButton(
              onPressed: () {
                ///普通路由传值跳转
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return FormPage(title:"路由传值的标题:表单~");
                    }
                    )
                );
              },
              child: Text("普通路由传值:跳转到表单界面")
          ),
          ElevatedButton(
              onPressed: () {
                ///命名路由跳转
                Navigator.pushNamed(context, "/form");
              },
              child: Text("命名路由:跳转到表单界面")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return CheckBoxDemo();
                }));
              },
              child: Text("CheckBox用法演示")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return RadioDemo();
                }));
              },
              child: Text("Radio用法演示")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return DialogDemo();
                }));
              },
              child: Text("Dialog用法演示")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return FlexDemo();
                }));
              },
              child: Text("Flex功能演示")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return HttpDemo();
                }));
              },
              child: Text("Http请求功能演示")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return DioDemo();
                }));
              },
              child: Text("Dio请求功能演示")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return RefreshDemo();
                }));
              },
              child: Text("Refresh下拉刷新")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return ImagePickerPage();
                }));
              },
              child: Text("相机拍照")
          )
        ],
      ),
    );
  }
}
