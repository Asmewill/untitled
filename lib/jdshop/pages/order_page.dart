import 'package:flutter/material.dart';
import 'package:untitled/jdshop/pages/order_tab_page.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length:5, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的订单"),
        bottom: TabBar(
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          isScrollable: true,
          tabs: [
            Tab(child: Text("全部")),
            Tab(child: Text("待付款")),
            Tab(child: Text("待收货")),
            Tab(child: Text("已完成")),
            Tab(child: Text("待评价")),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          OrderTabPage(),
          OrderTabPage(),
          OrderTabPage(),
          OrderTabPage(),
          OrderTabPage(),
        ],
      ),
    );
  }
}
