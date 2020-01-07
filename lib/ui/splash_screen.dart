import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dealbuddy/methods/root_page.dart';
import 'package:dealbuddy/methods/authorisation.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 1,
      loadingText: new Text('Loading...'),
      navigateAfterSeconds: new RootPage(
      auth: new Auth()
  ),
      title: new Text('Finding the best deals for You...',
        style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),),
      image: new Image.asset('./assets/images/logo.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
        fontStyle: FontStyle.italic,
      ),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
  }
}