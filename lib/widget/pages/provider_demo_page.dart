import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widget/provider/count_provider.dart';

class ProviderDemoPage extends StatefulWidget {
  const ProviderDemoPage({Key? key}) : super(key: key);

  @override
  _ProviderDemoPageState createState() => _ProviderDemoPageState();
}

class _ProviderDemoPageState extends State<ProviderDemoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider功能演示"),
      ),
      body: Center(
        child: Text("计数:${counterProvider.count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.updateCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
