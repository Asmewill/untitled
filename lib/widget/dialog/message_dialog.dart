import 'package:flutter/material.dart';

class MessageDialog extends Dialog {
  var title;
  var message;
  var negativeText;
  var positiveText;
  var onCloseEvent;
  var onPositivePressEvent;

  MessageDialog({
    Key? key,
    @required this.title,
    @required this.message,
    required this.negativeText,
    required this.positiveText,
    required this.onPositivePressEvent,
    required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(30.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(8.0),
                  //   ),
                  // ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        //  Center(
                        //   child:  Text(
                        //     title,
                        //     style:  TextStyle(
                        //       fontSize: 19.0,
                        //     ),
                        //   ),
                        // ),
                        // InkWell(
                        //   child: Container(
                        //     padding: EdgeInsets.only(right: 5),
                        //     child:Icon(Icons.close),
                        //   ) ,
                        //   onTap: onCloseEvent,
                        // )
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: IconButton(
                                onPressed: () {
                                  onCloseEvent();
                                }, icon: Icon(Icons.close)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("提示信息",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  new Container(
                    constraints: BoxConstraints(minHeight: 180.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new IntrinsicHeight(
                        child: new Text(
                          "在利用eclipse+python+SDK跑android自动化测试脚本时，遇到了该问题，看到一篇博客传送门，总结了该问题的几种情况。"
                          "在利用eclipse+python+SDK跑android自动化测试脚本时，遇到了该问题，看到一篇博客传送门，总结了该问题的几种情况。"
                          "在利用eclipse+python+SDK跑android自动化测试脚本时，遇到了该问题，看到一篇博客传送门，总结了该问题的几种情况。"
                          "在利用eclipse+python+SDK跑android自动化测试脚本时，遇到了该问题，看到一篇博客传送门，总结了该问题的几种情况。"
                          "在利用eclipse+python+SDK跑android自动化测试脚本时，遇到了该问题，看到一篇博客传送门，总结了该问题的几种情况。",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  this._buildBottomButtonGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty)
      widgets.add(_buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty)
      widgets.add(_buildBottomPositiveButton());
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
        fit: FlexFit.tight,
        child: Container(
          height: 48,
          child: TextButton(
            onPressed: onCloseEvent,
            child: new Text(
              negativeText,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(8))))),
          ),
        ));
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
        fit: FlexFit.tight,
        child: Container(
          height: 48,
          child: TextButton(
            onPressed: onPositivePressEvent,
            child: Text(
              positiveText,
              style: TextStyle(
                color: Color(Colors.teal.value),
                fontSize: 16.0,
              ),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8))))),
          ),
        ));
  }
}
