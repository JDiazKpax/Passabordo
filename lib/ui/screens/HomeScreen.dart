import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passabordo/ui/screens/Home.dart';
import 'package:passabordo/ui/screens/MyFlights.dart';
import 'package:passabordo/ui/screens/MyProfile.dart';
import 'package:passabordo/ui/screens/MyTrips.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? notificationType, jobId, location, jobName;
  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    Home(),
    MyFlights(),
    MyTrips(),
    MyProfile(),
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetsChildren[indexTap],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: MyColors.navBarBackground,
          ),
          child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            selectedLabelStyle: TextStyle(
              fontSize: StyleReference.navBarSize,
              fontFamily: FONT_URBANIST_MEDIUM,
            ),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.flight), label: "Tus Vuelos"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.beach_access), label: "Tus Viajes"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin), label: "Perfil"),
            ],
          ),
        ));
  }
}
