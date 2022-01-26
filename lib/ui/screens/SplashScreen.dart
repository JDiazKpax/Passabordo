/*  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // precacheImage(AssetImage('assets/backgrounds/homebackground.png'), context);
  }

  @override
  void addObserver() {
    // static pages response
    viewModel!.responseStream.listen((response) {
      if (response != null)
        SharedPrefJsonUtils()
            .save(PREF_STATIC_PAGES, jsonEncode(response.pages));
      //print("saved.....");
    }, onError: (error) {
      //print("error_getting_pages: " + error.toString());
    });

    viewModel!.cityResponseStream.listen((response) {
      if (response != null) {
        response.city!.forEach((element) {
          setState(() {
            citiesServed.add(element);
          });
        });
      }
    }, onError: (error) {
      print("error_getting_cities: " + error.toString());
    });

    viewModel!.categoryResponseStream.listen((response) {
      if (response != null) {
        setState(() {
          servicesList.addAll(response.services!);
        });
      }
    }, onError: (error) {
      print("error_getting_cities: " + error.toString());
    });
  }

  @override
  SplashViewModel createViewModel() {
    return SplashViewModel();
  }
}*/
//el orden de consumo es: main->SignInScreen(.dart)->Bloc(bloc_user.dart)->AuthRepository(.dart)->FirebaseAuthAPI(.dart)

//import 'dart:async';

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:passabordo/ui/screens/HomeScreen.dart';
//import 'package:lottie/lottie.dart';
import 'package:passabordo/ui/widgets/common_widgets.dart';
import 'package:passabordo/ui/widgets/slideRtoLanimations.dart';
import 'package:passabordo/utils/myColors.dart';

//class SplashScreen extends StatelessWidget {
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("SplashScreen: createState");
    return _SplashState();
  }
}

class _SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  bool internetConnected = true;

  static bool? isLoggedIn = false;
  static bool? isFirstRun = true;

  bool animationComplete = false;

  //AnimationController? logoController;

  // Keep the logo animation and opacity animation moving at the same speed.

  @override
  void initState() {
    super.initState();

    print("SplashScreen: initState");
    Timer(Duration(seconds: 3), () {
      checkInternet();
    });

    // logoController = AnimationController(
    //   vsync: this,
    // );

    // set the opacity progress to logo animation progress
    //  logoController!.addListener(() {
    //   setState(() {
    //     animCounter = logoController!.value;
    //  });
    //  });

    /*SharedPrefUtils.getPreference(PREF_IS_LOGIN, boolVal: false).then((value) {
      isLoggedIn = value;
     });
    SharedPrefUtils.getPreference(PREF_FIRST_RUN, boolVal: true).then((value) {
      isFirstRun = value;
     });*/

    //viewModel!.getCities();
    // viewModel!.callCategoryApi();
    isLoggedIn = true;
    animationComplete = true;
  }

  @override
  dispose() {
    super.dispose();
    //logoController!.dispose();
  }

  final String logoText = "TRAVEL CLUB";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
              "", height, MyColors.splashGradient1, MyColors.splashGradient2),
          Container(
            height: 150.0,
            width: 90.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/palm.png"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: height / 5,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "P",
                        style: TextStyle(
                          color: MyColors.splashLogoP,
                          fontSize: 40.0,
                          fontFamily: "RussoOne",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "ASSABORDO",
                        style: TextStyle(
                          color: MyColors.splashLogo,
                          fontSize: 27.0,
                          fontFamily: "RussoOne",
                        ),
                      ),
                    ),
                  ],
                ),
                //),
                Container(
                  padding: EdgeInsets.only(bottom: 2.0, left: 92.0),
                  child: Text(
                    logoText,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: MyColors.splashLogo,
                      fontSize: 15.0,
                      fontFamily: "RussoOne",
                    ),
                  ),
                ),

                /* Container(
                  height: 200,
                  child: Lottie.asset(
                    'assets/wave.json',
                    repeat: false,
                    controller: logoController,
                    onLoaded: (composition) {
                      // delay by 1 sec to allow background to load
                      Timer(
                        const Duration(seconds: 1),
                        () {
                          if (mounted) {
                            logoController!
                              ..duration = composition.duration
                              ..forward().whenComplete(() {
                                setState(() {
                                  animationComplete = true;
                                });
                                if (internetConnected)
                                  navigateToLoginDelayed(context);
                                else
                                  checkInternet();
                              });
                          }
                        },
                      );
                    },
                  ),
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    setState(() {
      internetConnected = connectivityResult != ConnectivityResult.none;
    });

    if (!internetConnected) {
      noInternetDialog();
    } else {
      if (animationComplete) navigateToLoginDelayed(context);
    }
  }

  void noInternetDialog() {
    Dialog d = internetDialogTemplate(
      context: context,
      headerIcon: Icon(Icons.wifi_off, color: MyColors.contentBlack),
      headerText: "No Internet",
      bodyText: "Connection failed, please check your wifi and try again",
      buttonText: "Try Again",
      onPress: checkInternet,
    ) as Dialog;

    showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (BuildContext context) => d);
  }

  void navigateToLoginDelayed(BuildContext context) {
    if (internetConnected) {
      if (isLoggedIn!) {
        Navigator.of(context).pushReplacement(SlideRToLTransition(//this,
            HomeScreen()));
      } else {
        // Navigator.of(context).pushReplacement(SlideRToLTransition(this, LoginScreen()));
        if (isFirstRun!) {
          // FirebaseAnalytics().logEvent(name: 'first_install', parameters: null);
          //  SharedPrefUtils.setPreference(PREF_FIRST_RUN, boolVal: false);
          //  Navigator.of(context).pushReplacement(SlideRToLTransition(this, IntroScreen()));
        } else {
          //  Navigator.of(context).pushReplacement(SlideRToLTransition(this, LoginScreen()));
        }
      }
    }
  }
}
