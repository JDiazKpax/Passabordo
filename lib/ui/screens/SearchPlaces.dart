import 'package:flutter/material.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

class SearchPlaces extends StatefulWidget {
  @override
  _SearchPlaces createState() => _SearchPlaces();
}

class _SearchPlaces extends State<SearchPlaces> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.screenBackground,
      child: SafeArea(
        bottom: false,
        child: Container(
          child: Scaffold(
            appBar: headerView() as PreferredSizeWidget?,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverToBoxAdapter(child: header()),
                SliverToBoxAdapter(child: searchBar()),
                /*SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0, left: 20),
                    alignment: Alignment.centerLeft,
                    child: buttonTypeI(
                      "Nuevo Destino",
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
                ),*/
                /*SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 30, bottom: 20.0, left: 20, right: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tus destinos favoritos estaran aqui. Podras ver toda la informacion y detalle que necesitas para disfrutar al maximo de ese grandioso lugar.",
                      style: TextStyle(
                        fontSize: StyleReference.bodyTextSizeLrg,
                        fontFamily: FONT_URBANIST_MEDIUM,
                      ),
                    ),
                  ),
                ),*/
                /*SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0, left: 20),
                    alignment: Alignment.centerLeft,
                    child: buttonTypeI(
                      "Necesitas Inspiracion?",
                      color: MyColors.navBarBackground,
                      textColor: MyColors.screenBackground,
                      onTap: () {},
                      outline: false,
                      borderColor: MyColors.navBarBackground,
                      width: 230,
                    ),
                  ),
                ),*/
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

  Widget headerView() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: MyColors.screenBackground,
      title: Text(
        "Lugares",
        style: TextStyle(
          color: MyColors.contentBlack,
          fontSize: 22,
          fontFamily: FONT_URBANIST_REGULAR,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget header() {
    return //Container(
        //child:
        Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/kayak.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40, left: 20),
          child: Text(
            "Encuentra\nexperiencias memoriables",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: FONT_URBANIST_BOLD,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
      // )
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Container(
        //width: MediaQuery.of(context).size.width - 60,
        //decoration: getServiceSearchDecoration(),
        height: 50,
        child: TextFormField(
          cursorColor: MyColors.contentBlack,
          controller: _controller,
          maxLines: 1,
          autofocus: false,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          focusNode: focusNode,
          textCapitalization: TextCapitalization.sentences,
          onChanged: searchOperation(),
          enabled: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: MyColors.inactiveDots,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                const Radius.circular(44.0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24.0),
              ),
              borderSide: BorderSide(
                color: MyColors.contentBlack,
                width: 2.0,
              ),
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              onPressed: () {
                //initSearch();
              },
            ),
            filled: true,
            labelStyle: TextStyle(
              color: MyColors.contentBlack,
              fontSize: StyleReference.bodyTextSize,
              fontFamily: FONT_URBANIST_SEMIBOLD,
            ),
            fillColor: MyColors.screenBackground,
            hintText: "Elige un destino",
            hintStyle: TextStyle(
              color: MyColors.subHeader,
              fontSize: StyleReference.bodyTextSize,
              fontFamily: FONT_URBANIST_SEMIBOLD,
            ),
          ),
        ),
      ),
    );
  }

  searchOperation() {
    _controller.addListener(() {
      /*if (_controller.text.isEmpty) {
        setState(() {
          searchedList.clear();
        });
      } else if (_controller.text.length > 4) {
        initSearch();
      }*/
    });
  }

  void initSearch() {
    /*searchedList.clear();
    bool isMatch = false;
    for (int i = 0; i < homeSubServiceList.length; i++) {
      for (int j = 0; j < homeSubServiceList[i].subCategories.length; j++) {
        if (homeSubServiceList[i]
            .subCategories[j]
            .name
            .toLowerCase()
            .contains(_controller.text.toLowerCase())) {
          isMatch = true;
          setState(() {
            if (!searchedList.contains(homeSubServiceList[i]))
              searchedList.add(homeSubServiceList[i]);
          });
        }
      }
    }
    if (!isMatch) {
      setState(() {
        searchedList.clear();
      });
    }*/
  }
}
