
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品页面"),
      ),
      body:  Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, "/product_info",arguments: {"id":"888"});
          },
          child: Text("这是一个商品页面,点击跳转到商品详情"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("back"),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (index){
      //
      //   },
      //   currentIndex: 2,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
      //   ],
      // ),
    );
  }
}
