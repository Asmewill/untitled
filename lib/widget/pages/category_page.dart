import 'package:flutter/material.dart';
import 'package:untitled/widget/pages/form_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
          )
        ],
    ));
  }
}
