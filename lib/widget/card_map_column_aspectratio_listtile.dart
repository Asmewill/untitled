
import 'package:flutter/material.dart';


import 'data/listData.dart';

class CardMapColumnAspectRadioListTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return ListView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),//给底部一个50的padding
        children: listData.map((item) =>
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 20.0/9.0,
                    child: Image.network(item['imageUrl'],fit: BoxFit.cover),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(item['imageUrl']),
                    ),
                    title: Text(item['title']),
                    subtitle: Text(item['description'],maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ),
                ],
              ),
            )
        ).toList(),
      );
  }
}