import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  Object sex = 2;
  bool flag=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio用法演示"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("男"),
              Radio(
                  value: 1,
                  groupValue: this.sex,
                  onChanged: (value) {
                    setState(() {
                      this.sex = value!;
                    });
                  }),
              Text("女"),
              Radio(
                  value: 2,
                  groupValue: this.sex,
                  onChanged: (value) {
                    setState(() {
                      this.sex = value!;
                    });
                  }),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(this.sex == 1 ? "男" : "女"),
          ),
          SizedBox(height: 80),
          Divider(),

          //Flutter2.x以后调用RadioListTile的时候需要指定传入参数的类型  this.sex为int类型，所以这里我们指定为int类型
          RadioListTile(
            value: 1,
            onChanged: (value){
              setState(() {
                this.sex=value!;
              });
            },
            groupValue: this.sex,
            title: Text("标题"),
            subtitle: Text("这是二级标题"),
            secondary: Icon(Icons.help),
            selected: this.sex == 1,
          ),
          RadioListTile(
            value: 2,
            onChanged: (value){
              setState(() {
                this.sex=value!;
              });
            },
            groupValue: this.sex,
            title: Text("标题"),
            subtitle: Text("这是二级标题"),
            secondary:
            Image.network('https://www.itying.com/images/flutter/1.png'),
            selected: this.sex == 2,
          ),
          SizedBox(height: 40),
          Switch(
            value:this.flag,
            onChanged: (v) {
              setState(() {
                print(v);
                this.flag = v;
              });
            },
          )
        ],
      ),
    );
  }
}
