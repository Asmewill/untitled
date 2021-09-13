import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:untitled/jdshop/model/product_detail_model.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';

class ProductDetailSecondPage extends StatefulWidget {
  List<ProductDetailItemModel> _productContent;

  ProductDetailSecondPage(this._productContent, {Key? key}) : super(key: key);

  @override
  _ProductDetailSecondPageState createState() =>
      _ProductDetailSecondPageState();
}

class _ProductDetailSecondPageState extends State<ProductDetailSecondPage> with AutomaticKeepAliveClientMixin{
  bool _flag = true;
  var _id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id = widget._productContent[0].id;
    print("URL:https://jd.itying.com/pcontent?id=${this._id}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          this._flag ? LoadingWidget() : Text(""),
          Expanded(
              child: InAppWebView(
            //老版本：initialUrl    新版本：initialUrlRequest
            initialUrlRequest: URLRequest(
                url:
                    Uri.parse("https://jd.itying.com/pcontent?id=${this._id}")),
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              print(progress / 100);
              if (progress / 100 > 0.9999) {
                setState(() {
                  this._flag = false;
                });
              }
            },
          )
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
