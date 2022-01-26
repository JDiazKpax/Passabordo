import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:passabordo/model/homeScreenDataSource.dart';
import 'package:passabordo/ui/screens/GetFlights.dart';
import 'package:passabordo/ui/screens/Home.dart';
import 'package:passabordo/ui/widgets/common_widgets.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

Widget buildHomeCard(BuildContext context, int index) {
  return Container(
      height: 130,
      child: largeCardTypeI(
        iconPath: HomeData.homeScreenCards[index]['iconPath'] as String,
        title: HomeData.homeScreenCards[index]['title'],
        body: HomeData.homeScreenCards[index]['body'] as String,
        section: int.parse(HomeData.homeScreenCards[index]['section']!),
        gradient1:
            Color(int.parse(HomeData.homeScreenCards[index]['gradient1']!)),
        gradient2:
            Color(int.parse(HomeData.homeScreenCards[index]['gradient2']!)),
        cardBackground:
            int.parse(HomeData.homeScreenCards[index]['cardBackground']!),
        //gradient1: MyColors.inactiveDots,
        //gradient2: MyColors.activeDots,
        //cardBackground: int.parse("0xFF546E7A"),
        onTap: () async {
          if (HomeData.homeScreenCards[index]['modal'] == "1") {
            showCupertinoModalBottomSheet(
                expand: false,
                context: context,
                useRootNavigator: false,
                backgroundColor: Colors.white,
                builder: (context) => GetFlights(),
                barrierColor: MyColors.backgroundSemiTransp);
          } else {
            Navigator.of(context).pushNamed("searchPlaces");
          }
        },
      ));
}

Widget buildHomeRoundedCard(BuildContext context, int index) {
  return roundedCard(
    imagePath: HomeData.homeScreenEssentials[index]['iconPath'] as String,
    title: HomeData.homeScreenEssentials[index]['title'],
    gradient1: int.parse(HomeData.homeScreenEssentials[index]['gradient1']!),
    gradient2: int.parse(HomeData.homeScreenEssentials[index]['gradient2']!),
    border: int.parse(HomeData.homeScreenEssentials[index]['border']!),
    onTap: () async {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        useRootNavigator: true,
        backgroundColor: MyColors.navBarBackground,
        builder: (context) => Home(),
      );
    },
  );
}

Widget buildHomeSquaredCard(BuildContext context, int index) {
  return squaredCard(
    imagePath: HomeData.homeScreenPurpose[index]['imagePath'] as String,
    title: HomeData.homeScreenPurpose[index]['title'],
    body: HomeData.homeScreenPurpose[index]['body'],
    onTap: () async {
      showCupertinoModalBottomSheet(
        // expand: true,
        context: context,
        useRootNavigator: true,
        backgroundColor: Colors.white,
        builder: (context) => Home(),
      );
    },
  );
}

Widget homeScreenTitle({String title = "", String? subheader}) {
  return Container(
    padding: EdgeInsets.only(top: 35, bottom: 20.0, left: 20, right: 20),
    // alignment: Alignment.topLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: StyleReference.sectionTitle,
              fontFamily: FONT_URBANIST_SEMIBOLD),
        ),
        SizedBox(
          height: 7,
        ),
        subheader != null
            ? Text(
                subheader,
                style: TextStyle(
                    fontSize: StyleReference.sectionSubheader,
                    fontFamily: FONT_URBANIST_MEDIUM,
                    color: MyColors.subHeader),
              )
            : Container()
      ],
    ),
  );
}

Widget largeCardTypeI({
  required String iconPath,
  required String body,
  String? title,
  VoidCallback? onTap,
  required int section,
  required Color gradient1,
  required Color gradient2,
  required int cardBackground,
}) {
  return GestureDetector(
    child: Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      color: Color(cardBackground),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 24.0,
                ),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      gradient: LinearGradient(
                        colors: [
                          gradient1,
                          gradient2,
                        ],
                        begin: FractionalOffset(0.5, 0.5),
                        end: FractionalOffset(0.9, 0.99),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Image(
                      image: AssetImage(
                        iconPath,
                      ),
                    ),
                  ),
                ),
              ),
              title != null
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: StyleReference.largeCardTitle,
                            fontFamily: FONT_URBANIST_SEMIBOLD,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(children: [
              ClipOval(
                clipper: MyClipper(section),
                child: GradientBack(
                  "",
                  double.infinity,
                  gradient1,
                  gradient2,
                  fractional1: 0.3,
                  fractional2: 0.3,
                  fractional3: 0.9,
                  fractional4: 0.8,
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 30),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: StyleReference.largeCardBody,
                      fontFamily: FONT_URBANIST_MEDIUM,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ])
            ]),
          ),
        ),
      ]),
    ),
    onTap: onTap,
  );
}

Widget roundedCard({
  required String imagePath,
  String? title,
  VoidCallback? onTap,
  required int gradient1,
  required int gradient2,
  required int border,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(),
        child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              border: Border.all(color: Color(border), width: 2),
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: ClipOval(
              child: Image(
                  image: AssetImage(
                    imagePath,
                  ),
                  fit: BoxFit.cover),
            )),
      ),
      title != null
          ? Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: StyleReference.bodyTextSize,
                    fontFamily: FONT_URBANIST_MEDIUM,
                  ),
                ),
              ),
            )
          : Container(),
    ],
  );
}

Widget squaredCard({
  required String imagePath,
  String? body,
  String? highlightText = "",
  String? title,
  VoidCallback? onTap,
}) {
  return Container(
    padding: EdgeInsets.only(right: 8, left: 8),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFFa0d4de),
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child:
                            /*CachedNetworkImage(
                            color: Colors.black.withOpacity(0.0),
                            colorBlendMode: BlendMode.multiply,
                            imageUrl: imagePath,
                            fit: BoxFit.cover,
                          ),*/
                            Image(
                                image: AssetImage(
                                  imagePath,
                                ),
                                fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  title != null
                      ? Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                title.toUpperCase(),
                                style: TextStyle(
                                  fontSize: StyleReference.squaredCardTitle,
                                  fontFamily: FONT_URBANIST_BOLD,
                                  color: MyColors.contentBlack,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: body,
                          children: [
                            TextSpan(
                              text: highlightText,
                              style: TextStyle(
                                fontSize: StyleReference.squaredCardBody,
                              ),
                            )
                          ],
                          style: TextStyle(
                              fontSize: StyleReference.squaredCardBody,
                              fontFamily: FONT_URBANIST_REGULAR,
                              color: MyColors.contentBlack),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget homeTip() {
  return Container(
      height: 200,
      width: 270,
      padding: EdgeInsets.only(right: 8, left: 8),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                      //width: 200,
                      height: 200,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child:
                              /*CachedNetworkImage(
                            color: Colors.black.withOpacity(0.0),
                            colorBlendMode: BlendMode.multiply,
                            imageUrl: imagePath,
                            fit: BoxFit.cover,
                          ),*/
                              Image(
                                  image: AssetImage(
                                    HomeData.homeTip[0]['imagePath'] as String,
                                  ),
                                  fit: BoxFit.cover))),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          HomeData.homeTip[0]['title']!.toUpperCase(),
                          style: TextStyle(
                            fontSize: StyleReference.squaredCardTitle,
                            fontFamily: FONT_URBANIST_BOLD,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        HomeData.homeTip[0]['body']!,
                        style: TextStyle(
                            fontSize: StyleReference.squaredCardBody,
                            fontFamily: FONT_URBANIST_REGULAR,
                            color: MyColors.contentBlack),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}

class MyClipper extends CustomClipper<Rect> {
  final int section;
  MyClipper(this.section);

  @override
  Rect getClip(Size size) {
    Rect rect;
    switch (section) {
      case 1:
        rect = Rect.fromLTWH(0.0, -80.0, size.width * 1.5, size.height * 4.8);
        return rect;
      case 2:
        rect = Rect.fromLTWH(0.0, -200.0, size.width * 2, size.height * 4.0);
        return rect;
      case 3:
        rect = Rect.fromLTWH(0.0, -430.0, size.width * 1.5, size.height * 4.8);
        return rect;
      default:
        rect = Rect.fromLTWH(0.0, -80.0, size.width * 1.5, size.height * 4.8);
        return rect;
    }
  }

  @override
  bool shouldReclip(MyClipper oldClipper) {
    return true;
  }
}
