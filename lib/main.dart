import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:passabordo/ui/screens/SearchPlaces.dart';
import 'package:passabordo/ui/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set orientation to portrait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: OverlaySupport(
            child: MaterialApp(
          title: 'Passabordo',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: {
            'searchPlaces': (context) => SearchPlaces(),
            /*Here's where you receive your routes, and it is also the main widget*/
          },
        )));
  }
}
