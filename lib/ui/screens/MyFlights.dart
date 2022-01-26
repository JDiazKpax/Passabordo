import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:passabordo/ui/screens/GetFlights.dart';
import 'package:passabordo/ui/widgets/common_widgets.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

class MyFlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.screenBackground,
      child: SafeArea(
        bottom: false,
        child: Container(
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
                    padding: EdgeInsets.only(top: 30, bottom: 20.0, left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tus Vuelos",
                      style: TextStyle(
                        fontSize: StyleReference.mainTitle,
                        fontFamily: FONT_URBANIST_SEMIBOLD,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0, left: 20),
                    alignment: Alignment.centerLeft,
                    child: buttonTypeI(
                      "Nuevo Vuelo",
                      color: Colors.transparent,
                      textColor: MyColors.contentBlack,
                      onTap: () async {
                        showCupertinoModalBottomSheet(
                            expand: false,
                            context: context,
                            useRootNavigator: false,
                            backgroundColor: Colors.white,
                            builder: (context) => GetFlights(),
                            barrierColor: MyColors.backgroundSemiTransp);
                      },
                      outline: true,
                      borderColor: MyColors.navBarBackground,
                      icon: Icons.add_circle,
                      iconColor: MyColors.navBarBackground,
                      iconSize: 30,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 20.0, left: 20, right: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Aqui encontraras los vuelos que has creado. Agrega nuevos vuelos de nuestra seccion de ofertas y hallazgos y mantente al dia con las tarifas dinamicas.",
                      style: TextStyle(
                        fontSize: StyleReference.bodyTextSizeLrg,
                        fontFamily: FONT_URBANIST_MEDIUM,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0, left: 20),
                    alignment: Alignment.centerLeft,
                    child: buttonTypeI(
                      "Ofertas actuales",
                      color: MyColors.navBarBackground,
                      textColor: MyColors.screenBackground,
                      onTap: () {},
                      outline: false,
                      borderColor: MyColors.navBarBackground,
                      width: 200,
                    ),
                  ),
                ),
                /*SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (index > HomeData.homeScreenCards.length - 1) return null;
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 16),
                        child: buildHomeCard(context, index),
                      ),
                    ],
                  );
                })),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
