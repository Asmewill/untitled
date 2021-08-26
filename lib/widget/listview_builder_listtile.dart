
import 'package:flutter/material.dart';

import 'data/listData.dart';

class ListViewBuilderListTile extends StatelessWidget{
  Widget _getListData(context,index){
    return ListTile(
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
      leading: Image.network(listData[index]['imageUrl'],),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listData.length,
        itemBuilder:this._getListData //使用的是这个方法的引用
    );
  }

}