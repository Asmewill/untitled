

import 'package:flutter/material.dart';
import 'data/listData.dart';

class GridViewCountMapContainer extends StatelessWidget{
  List<Widget> _getListData() {
    var list=listData.map((item) => Container(
      child:Column(
        children: [
          Image.network(item["imageUrl"]),//自适应宽度
          SizedBox(height: 15,),//填充15宽度
          Text(item["title"],style: TextStyle(fontSize: 15,color: Colors.red),)
        ],
      ) ,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1.0)
      ),
      // height: 500,//设置无效
    ));
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,///Container跟随GridView内容变化高度, shrinkWrap:true;
      crossAxisCount: 2,//一行显示的Widget的个数
      childAspectRatio: 0.95,//宽高比,不设置默认是1
      children: _getListData(),
      mainAxisSpacing: 10,//竖直间距
      crossAxisSpacing: 10,//水平间距
    );
  }

}