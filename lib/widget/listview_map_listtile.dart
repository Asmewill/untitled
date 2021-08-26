

import 'package:flutter/material.dart';
import 'data/listData.dart';

class ListViewMapListTile extends StatelessWidget{
  List<Widget> _getData() {
    var list = listData.map((item) => ListTile(
      title: Text(item['title']),
      subtitle: Text(item['author']),
      leading: Image.network(item["imageUrl"]),
    ));
    //('12344444','1234444')
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getData(),
    );
  }

}