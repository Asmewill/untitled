import 'package:flutter/material.dart';

class DeviceLine extends StatelessWidget {
  const DeviceLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.2,
      child: Container(
        height: 0.2,
        decoration: BoxDecoration(
          color: Colors.grey
        ),
      ),
    );
  }
}
