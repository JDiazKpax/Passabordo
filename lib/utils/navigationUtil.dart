import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationUtil {
  static Route appearChildAnimation(Widget child, {int durationMillis = 500}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        },
        transitionDuration: Duration(milliseconds: durationMillis),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Route pushChildAnimation(Widget? nextPage,
      {int durationMillis = 500}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return nextPage!;
        },
        transitionDuration: Duration(milliseconds: durationMillis),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Animation<Offset> _slideAnimationPage2 =
              Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                  .animate(animation);
          return Stack(
            children: <Widget>[
              SlideTransition(position: _slideAnimationPage2, child: nextPage),
            ],
          );
        });
  }

  static Route pushUpChildAnimation(Widget nextPage,
      {int durationMillis = 500}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return nextPage;
        },
        transitionDuration: Duration(milliseconds: durationMillis),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Animation<Offset> _slideAnimationPage2 =
              Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                  .animate(animation);
          return Stack(
            children: <Widget>[
              SlideTransition(position: _slideAnimationPage2, child: nextPage),
            ],
          );
        });
  }

  static Route removeChildAnimation(Widget child, {int durationMillis = 500}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        },
        transitionDuration: Duration(milliseconds: durationMillis),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1, 0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static void pushPage(BuildContext context,
      {required bool isRoot,
      required bool isHorizontalNavigation,
      Widget? child}) {
    Navigator.of(context, rootNavigator: isRoot).push(
      buildAdaptivePageRoute(
        builder: (context) => child!,
        fullscreenDialog: !isHorizontalNavigation,
      ),
    );
  }

  static PageRoute<T> buildAdaptivePageRoute<T>({
    required WidgetBuilder builder,
    bool fullscreenDialog = false,
  }) =>
      Platform.isAndroid
          ? MaterialPageRoute(
              builder: builder,
              fullscreenDialog: fullscreenDialog,
            )
          : CupertinoPageRoute(
              builder: builder,
              fullscreenDialog: fullscreenDialog,
            );
}
