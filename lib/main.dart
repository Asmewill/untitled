import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/jdshop/routes/routes.dart';
import 'package:untitled/widget/aspectratio_to_container.dart';
import 'package:untitled/widget/aspectratio_to_parent.dart';
import 'package:untitled/widget/card_column_aspectratio_listtile.dart';
import 'package:untitled/widget/card_column_listtile.dart';
import 'package:untitled/widget/card_map_column_aspectratio_listtile.dart';
import 'package:untitled/widget/custom_elevated_button.dart';
import 'package:untitled/widget/custom_icon_container.dart';
import 'package:untitled/widget/demo_column_row_expanded.dart';
import 'package:untitled/widget/gridview_builder_for_container.dart';
import 'package:untitled/widget/gridview_count_for_container.dart';
import 'package:untitled/widget/gridview_count_map_container.dart';
import 'package:untitled/widget/gridview_count_padding.dart';
import 'package:untitled/widget/listview_axis_horizontal.dart';
import 'package:untitled/widget/listview_builder_listtile.dart';
import 'package:untitled/widget/listview_for_listtile.dart';
import 'package:untitled/widget/listview_listtile.dart';
import 'package:untitled/widget/listview_map_listtile.dart';
import 'package:untitled/widget/listview_padding_image_container.dart';
import 'package:untitled/widget/pages/form_page.dart';
import 'package:untitled/widget/pages/search_page.dart';

import 'package:untitled/widget/row_expanded_1.dart';
import 'package:untitled/widget/row_expanded_2.dart';
import 'package:untitled/widget/row_mainaxis_crossaxis_alignment.dart';
import 'package:untitled/widget/stack_align.dart';
import 'package:untitled/widget/stack_alignment.dart';
import 'package:untitled/widget/stack_positioned.dart';
import 'package:untitled/widget/statefulwidget/add_data_by_elevated_button_2.dart';
import 'package:untitled/widget/statefulwidget/add_data_by_elevated_button_1.dart';
import 'package:untitled/widget/statefulwidget/add_num_by_elevated_button.dart';
import 'package:untitled/widget/statefulwidget/scaffold_bottom_navigation_bar_2.dart';
import 'package:untitled/widget/statefulwidget/scaffold_bottom_navigation_bar_1.dart';
import 'package:untitled/widget/wrap_elevated_button_1.dart';
import 'package:untitled/widget/wrap_elevated_button_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        //designSize: Size(750, 1334),
        builder: (){
      return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "FirstFlutter",
        ///默认不配置抽取路由
        // home: ScaffoldBottomNavigationBar1(),
        // routes: {
        //   '/search':(context)=>SearchPage(),
        //   '/form':(context)=>FormPage(),
        // },
        ///抽取路由配置之后
        initialRoute: '/',
        onGenerateRoute:onGenerateRoute,
        theme: ThemeData(primaryColor: Colors.white),
      );
    });
  }
}
//
// class HomeContent extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return AddNumByElevatedButton();
//   }
// }
