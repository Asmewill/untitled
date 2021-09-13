import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                )),
            SizedBox(width: 30),
            Text(
              '加载中...',
              style: TextStyle(fontSize: 12.0,color: Colors.grey),
            )
          ],
        ),
      ),
    );
    ;
  }
}
