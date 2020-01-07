import 'package:flutter/material.dart';


class FAQ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FAQState();
  }
}

Widget userWidget() {
  return Column(
    children: <Widget>[
      Text('FAQ')
    ],
  );
}

class FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Container(
          child: Center(
            child: Text('Terms and Condtions'),
          )
      ),
    );
  }
}