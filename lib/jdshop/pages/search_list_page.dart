import 'package:flutter/material.dart';

class SearchListPage extends StatefulWidget {
  final keyWord;
  const SearchListPage({this.keyWord="",Key? key}) : super(key: key);

  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索列表"),
      ),
      body: Center(
        child: Text("value:${widget.keyWord}"),
      ),
    );
  }
}
