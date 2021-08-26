
import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  final dynamic arguments;
  const ProductInfoPage({this.arguments,Key? key}) : super(key: key);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState(this.arguments);
}

class _ProductInfoPageState extends State<ProductInfoPage> {
   final dynamic  argumetns;
  _ProductInfoPageState(this.argumetns);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情"),
      ),
      body: Center(
        child: Text("商品详情ID:${argumetns['id']}"),
      ),
    );
  }
}
