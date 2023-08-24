import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:untitled/jdshop/widget/LoadingWidget.dart';

class NewsDetailPage2 extends StatefulWidget {
  final aid;

  NewsDetailPage2({Key? key, this.aid}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage2> {
  List _list = [];
  bool _flag = true;
  var apiUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiUrl = "https://www.phonegap100.com/newscontent.php?aid=${widget.aid}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻详情${widget.aid}"),
        ),
        body: Column(
          children: [
            this._flag ? LoadingWidget() : Container(),
            Expanded(
                child: InAppWebView(
              //老版本：initialUrl    新版本：initialUrlRequest
              initialUrlRequest: URLRequest(url: Uri.parse("${apiUrl}")),
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                if ((progress / 100) > 0.999) {
                  setState(() {
                    this._flag = false;
                  });
                }
              },
            )),
          ],
        ));
  }
}
