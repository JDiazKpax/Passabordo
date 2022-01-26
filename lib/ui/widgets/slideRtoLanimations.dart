import 'package:flutter/material.dart';

class SlideRToLTransition extends PageRouteBuilder {
  //BaseState fromBaseState;
  StatefulWidget toWidget;
  AnimationStatusListener? animationStatusListener;

  SlideRToLTransition(
      //this.fromBaseState
      this.toWidget,
      {Duration transitionDuration = const Duration(milliseconds: 400),
      this.animationStatusListener})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return toWidget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget toChild) {
              if (animationStatusListener != null) {
                animation.addStatusListener(animationStatusListener);
              }
              return SlideTransition(
                position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation),
                child: toChild,
              );
            },
            transitionDuration: transitionDuration);
}
