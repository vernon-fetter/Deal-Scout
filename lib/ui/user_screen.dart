import 'package:flutter/material.dart';
import 'package:dealbuddy/methods/userMethod.dart';
import 'package:dealbuddy/models/userModel.dart';

class UserScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserScreenState();
  }
}

Widget userWidget (User user) {
  return Column(
    children: <Widget>[
      Text('User')
    ],
  );
}

class UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? userWidget(snapshot.data):
            Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color(0xff800000),
                ));
          }
        )
      ),
    );
  }
}

