import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/jdshop/configs/config.dart';
import 'package:untitled/jdshop/model/order_model.dart';
import 'package:untitled/jdshop/pages/order_detail_page.dart';
import 'package:untitled/jdshop/utils/ToastUtil.dart';
import 'package:untitled/jdshop/utils/image_util.dart';
import 'package:untitled/jdshop/utils/sign_util.dart';
import 'package:untitled/jdshop/utils/user_util.dart';

class OrderTabPage extends StatefulWidget {
  const OrderTabPage({Key? key}) : super(key: key);

  @override
  _OrderTabPageState createState() => _OrderTabPageState();
}

class _OrderTabPageState extends State<OrderTabPage> {
  List<OrderItem> _orderList = [];

  @override
  void initState() {
    getOrderList();
  }

  getOrderList() async {
    List userinfo = await UserUtil.getUserInfo();
    var tempJson = {"uid": userinfo[0]['_id'], "salt": userinfo[0]["salt"]};
    var sign = SignUtil.sign(tempJson);
    var api =
        '${Config.domain}api/orderList?uid=${userinfo[0]['_id']}&sign=${sign}';
    print("api:${api}");
    var result = await Dio().get(api);
    print(result.data is Map);
    print("api:${result}");
    setState(() {
      var orderModel = new OrderModel.fromJson(result.data);
      this._orderList = orderModel.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _orderList.map((item) {
        return Card(
          margin: EdgeInsets.all(10),
          child: InkWell(
            child: Column(
              children: [
                Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10),
                  child: Text("订单编号:${item.id}"),
                ),
                Divider(height: 1, color: Colors.black26),
                SizedBox(height: 10),
                Column(
                  children: item.orderItem!.map((value){
                    return   Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                                "${ImageUtil.getPicUrl(value.productImg!)}",
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: 5, top: 10, right: 5),
                              child: Text("${value.productTitle}"),
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 5, top: 10, right: 15),
                          child: Text("x${value.productCount}"),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Container(
                  height: 60,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text("合计:￥66.666"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              ToastUtil.showMsg("申请售后");
                            },
                            child: Text("申请售后"),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return OrderDetailPage();
              }));
            },
          ),
        );
      }).toList(),
    );
  }
}
