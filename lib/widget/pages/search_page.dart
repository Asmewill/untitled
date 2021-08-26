
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final dynamic arguments;
  const SearchPage({this.arguments,Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState(this.arguments);
}

class _SearchPageState extends State<SearchPage> {
  final dynamic arguments;
  _SearchPageState(this.arguments);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索"),
      ),
      body:Center(
        child:  Text("search content...${this.arguments!=null?arguments['id']:"null"}"),
      ),
    );
  }
}
