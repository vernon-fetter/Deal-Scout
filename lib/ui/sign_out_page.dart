import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dealbuddy/methods/authorisation.dart';

// Author: VC Fetter

class Profile extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  const Profile({Key key, this.auth, this.onSignedOut}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ProfileState();
  }
}

class ProfileState extends State<Profile> {

  void _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  void _showAbout(BuildContext context) async {
    var about = new AlertDialog(
      title: new Text(
        'About Deal Buddy',
      ),
      content: new Container(
          height: 500.0,
          width: 300.0,
          child: new Column(
            children: <Widget>[
              Text('Deal Buddy was developed by IDM, in partnership with Cyberflex.')
            ],
          )
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('Close'),
        ),
      ],
    );
    showDialog(context: context, child: about);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder(
            future: FirebaseAuth.instance.currentUser(),
            builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
              return snapshot.hasData
                  ? Text(snapshot.data.email,
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              )
                ,)
                  : Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Color(0xff800000),
                    ));
            }),
        FlatButton(
            onPressed: () {_signOut();},
            color: Color(0xff800000),
            child: new Text('Sign Out')
        ),
        FlatButton(
            onPressed: () {_showAbout(context);},
            color: Color(0xff800000),
            child: new Text('About')
        ),
        FlatButton(
            onPressed: () {_showAbout(context);},
            color: Color(0xff800000),
            child: new Text('Terms and Conditions')
        ),
      ],
    ));
  }
}

