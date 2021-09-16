import 'package:flutter/material.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/widget/jd_button.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  List payList = [
    {
      "title": "支付宝支付",
      "checked": true,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "title": "微信支付",
      "checked": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("去支付"),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: payList.map((item) {
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "${item['image']}",
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(width: 10),
                                  Text("${item['title']}")
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: item['checked']
                                  ? Icon(Icons.check, color: Colors.red)
                                  : Icon(Icons.check, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          payList.forEach((element) {
                             if(element==item){
                               if(item['checked']==false){
                                 item['checked']=true;
                               }
                             }else{
                               element['checked']=false;
                             }
                          });

                        });
                      },
                    )
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 80),
            Padding(
                padding: EdgeInsets.all(10),
                child: JdButton(
                  text: "去支付",
                  height: 45,
                  pressed: (){
                    ToastUtil.showMsg("去支付");
                  },
                ))
          ],
        ),
      ),
    );
  }
}
