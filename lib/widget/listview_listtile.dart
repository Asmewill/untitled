

import 'package:flutter/material.dart';

class ListViewListTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return ListView(
       children: <Widget>[
         ListTile(
           leading:Icon(Icons.home,color: Colors.black,size: 40,),
           title:Text("【环球时报驻美国特约记者 ",
             style:TextStyle(
                 fontSize: 14
             ) ,
           ),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
           trailing: Icon(Icons.map,color: Colors.yellow,size: 60,),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),
         ListTile(
           title:Text("【环球时报驻美国特约记者 "),
           subtitle: Text("美国副总统哈里斯23日在亚洲之行的第二天"),
         ),

       ],
     );
  }


}