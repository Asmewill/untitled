
import 'package:flutter/material.dart';

class GridViewCountForContainer extends StatelessWidget{
  List<Widget> _getListData(){
    List<Widget> list=[];
    for(var i=0;i<20;i++){
      list.add(Container(
        child: Text(
          "这是第$i条数据",
          style: TextStyle(fontSize: 14,color: Colors.black),
        ),
        alignment: Alignment.center,
        color: Colors.blue,
        // height: 400, //设置高度没有反应,看来只能通过宽高比来自适应了
      ));
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap:true,  ///Container跟随GridView内容变化高度, shrinkWrap:true;
      crossAxisCount: 2,//一行Widget的数量
      children: _getListData(),
      childAspectRatio: 1.2,//宽高比默认是1.0
      mainAxisSpacing: 15.0,//竖直间距
      crossAxisSpacing: 10.0,//水平间距
      padding:EdgeInsets.all(10) ,
    );
  }

}