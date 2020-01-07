import 'package:flutter/material.dart';


class TermsAndCondtions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TermsAndCondtionsState();
  }
}

Widget userWidget() {
  return Column(
    children: <Widget>[
      Text('Terms and Condtions')
    ],
  );
}

class TermsAndCondtionsState extends State<TermsAndCondtions> {
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