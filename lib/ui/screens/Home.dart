import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passabordo/model/homeScreenDataSource.dart';
import 'package:passabordo/ui/widgets/homeScreenWidgets.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? notificationType, jobId, location, jobName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.screenBackground,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: CustomScrollView(
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 30, bottom: 20.0, left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Que quieres hacer hoy?",
                          style: TextStyle(
                            fontSize: StyleReference.mainTitle,
                            fontFamily: FONT_URBANIST_SEMIBOLD,
                          ),
                        ),
                      ),
                    ),
                    SliverList(delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      if (index > HomeData.homeScreenCards.length - 1)
                        return null;
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16),
                            child: buildHomeCard(context, index),
                          ),
                        ],
                      );
                    })),
                    SliverToBoxAdapter(
                        child: homeScreenTitle(
                            title: "Tus esenciales de viaje",
                            subheader:
                                "Manten el control de tu viaje antes, durante y despues")),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: HomeData.homeScreenEssentials.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 90.0,
                              child: buildHomeRoundedCard(context, index),
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: homeScreenTitle(
                            title: "Viajes con proposito",
                            subheader:
                                "Colecciones unicas de lugares y experiencias que dan sentido a la vida")),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 240.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: HomeData.homeScreenPurpose.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 270.0,
                              child: buildHomeSquaredCard(context, index),
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: homeScreenTitle(
                          title: "Passabordo Fun Tips", subheader: ""),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 240.0,
                        child: Container(
                          width: 270.0,
                          child: homeTip(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
