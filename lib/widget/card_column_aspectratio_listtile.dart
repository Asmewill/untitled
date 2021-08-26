

import 'package:flutter/material.dart';

class CardColumnAspectRatioListTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return ListView(
       children: [
         Card(
           margin: EdgeInsets.all(10),
           child: Column(
             children: [
               AspectRatio(
                 aspectRatio: 2.0 / 1.0,
                 child:Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover,),
               ),
               ListTile(
                 leading: CircleAvatar(
                   radius: 20,
                   backgroundImage: NetworkImage("https://www.itying.com/images/flutter/1.png"),
                 ),
                 title: Text("Candy Shop1"),
                 subtitle: Text(
                   "Flutter is a handsome tools,Are you believe it? if you dont think so , i will be ",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),

               ),
             ],
           ),
         ),
         Card(
           child: Column(
             children: [
               AspectRatio(
                 aspectRatio: 2.0 / 1.0,
                 child:Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover,),
               ),
               ListTile(
                 leading: CircleAvatar(
                   radius: 20,
                   backgroundImage: NetworkImage("https://www.itying.com/images/flutter/1.png"),
                 ),
                 title: Text("Candy Shop"),
                 subtitle: Text(
                   "Flutter is a handsome tools,Are you believe it? if you dont think so , i will be ",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),

               ),
             ],
           ),
         ),
         Card(
           child: Column(
             children: [
               AspectRatio(
                 aspectRatio: 2.0 / 1.0,
                 child:Image.network("https://www.itying.com/images/flutter/1.png",fit: BoxFit.cover,),
               ),
               ListTile(
                 leading: CircleAvatar(
                   radius: 20,
                   backgroundImage: NetworkImage("https://www.itying.com/images/flutter/1.png"),
                 ),
                 title: Text("Candy Shop"),
                 subtitle: Text(
                   "Flutter is a handsome tools,Are you believe it? if you dont think so , i will be ",
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                 ),

               ),
             ],
           ),
         )
       ],
     );
  }
}