

import 'package:flutter/material.dart';

import 'data/listData.dart';

class GridViewBuilderForContainer extends StatelessWidget{
  Widget _getListData(context,index){
    return  Container(
      child: Column(
        children: [
          Image.network(listData[index]["imageUrl"]),//自适应宽度，高度使用fit:BoxFit.cover是无法填充整个控件
          SizedBox(height: 12,),
          Container(
            child:Text(
              listData[index]["title"],
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center,),//TextAlign.center无效 所有才是用Container包裹 使用 alignment: Alignment.center
             alignment: Alignment.center,
          )

        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(color:Colors.grey,width: 1)//设置边框
      ),
      // height: 500,//设置高度没有反应
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listData.length,
        shrinkWrap: true,///Container跟随GridView内容变化高度, shrinkWrap:true;
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio:1.0,//宽高比
        ),
        itemBuilder: _getListData);
  }

}