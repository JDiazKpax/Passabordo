//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:passabordo/ui/widgets/common_widgets.dart';
import 'package:passabordo/ui/widgets/showButtonsModal.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetFlights extends StatefulWidget {
  @override
  _GetFlightsState createState() => _GetFlightsState();
}

class _GetFlightsState extends State<GetFlights> {
  // Text and Page Controllers
  final PageController controller = PageController(initialPage: 0);
  TextEditingController nickNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final firstKey = GlobalKey<FormState>();
  final secondKey = GlobalKey<FormState>();
  final thirdKey = GlobalKey<FormState>();
  final fourthKey = GlobalKey<FormState>();
  final firstNewKey = GlobalKey<FormState>();

  List<String> baggage = [
    "Solo equipaje de mano (Super flexible)",
    "1 maleta (aprox 23 Kg.)",
    "2 o mas maletas",
  ];

  List<String> stops = [
    "Sin escalas",
    "Maximo una escala",
    "No importa",
  ];

  bool propertyScreenFilled = false;
  bool nicknameScreenFilled = false;
  bool descriptionScreenFilled = false;
  bool imageScreenFormFilled = false;
  int _currBaggage = 0;
  int _currStops = 0;

  FocusNode? descriptionFocusNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Material(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /*Container(
                      height: 175,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/wellbeing.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),*/
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            'Vamos a encontrar esos tiquetes',
                            style: TextStyle(
                              color: MyColors.activeDots,
                              fontFamily: FONT_URBANIST_BOLD,
                              fontSize: StyleReference.sectionTitle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: PageView(
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: controller,
                              children: <Widget>[
                                first(),
                                second(),
                                third(),
                                fourth(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )))));
  }

  //FIRST SCREEN
  Widget first() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          nicknameField(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                  top: 36.0,
                ),
                child: showButtonsModal(
                  backText: "CERRAR",
                  context: context,
                  nicknameScreenFilled: nicknameScreenFilled,
                  onTap1: () {
                    Navigator.of(context).pop(false);
                  },
                  onTap2: () {
                    if (firstKey.currentState!.validate()) {
                      if (nicknameScreenFilled) {
                        //FirebaseAnalytics().logEvent(
                        //   name: 'todo_step_one', parameters: null);
                        // Hide keyboard
                        FocusManager.instance.primaryFocus!.unfocus();
                        controller.nextPage(
                          duration: Duration(
                            milliseconds: 300,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    }
                  },
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //SECOND SCREEN
  Widget second() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          secondField(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                  top: 16.0,
                ),
                child: showButtonsModal(
                  context: context,
                  nicknameScreenFilled: nicknameScreenFilled,
                  onTap1: () {
                    //FirebaseAnalytics().logEvent(
                    //   name: 'todo_step_one', parameters: null);
                    // Hide keyboard
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.previousPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                  onTap2: () {
                    // if (nickNameKey.currentState!.validate()) {
                    //   if (nicknameScreenFilled && propertyId != 0) {
                    //FirebaseAnalytics().logEvent(
                    //   name: 'todo_step_one', parameters: null);
                    // Hide keyboard
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.nextPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                    //  }
                    // }
                  },
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //THIRD SCREEN
  Widget third() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          thirdField(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                  top: 16.0,
                ),
                child: showButtonsModal(
                  context: context,
                  nicknameScreenFilled: nicknameScreenFilled,
                  onTap1: () {
                    //FirebaseAnalytics().logEvent(
                    //   name: 'todo_step_one', parameters: null);
                    // Hide keyboard
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.previousPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                  onTap2: () {
                    // if (nickNameKey.currentState!.validate()) {
                    //   if (nicknameScreenFilled && propertyId != 0) {
                    //FirebaseAnalytics().logEvent(
                    //   name: 'todo_step_one', parameters: null);
                    // Hide keyboard
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.nextPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                    //  }
                    // }
                  },
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //FOURTH SCREEN
  Widget fourth() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          fourthField(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                  top: 16.0,
                ),
                child: showButtonsModal(
                  context: context,
                  nicknameScreenFilled: nicknameScreenFilled,
                  onTap1: () {
                    //FirebaseAnalytics().logEvent(
                    //   name: 'todo_step_one', parameters: null);
                    // Hide keyboard
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.previousPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                  },
                  onTap2: () {
                    // if (nickNameKey.currentState!.validate()) {
                    //   if (nicknameScreenFilled && propertyId != 0) {
                    //FirebaseAnalytics().logEvent(
                    //   name: 'todo_step_one', parameters: null);
                    // Hide keyboard
                    FocusManager.instance.primaryFocus!.unfocus();
                    controller.nextPage(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      curve: Curves.easeInOut,
                    );
                    //  }
                    // }
                  },
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget simpleDialogTwoButtons() {
    return dialogueTemplate(
      context: context,
      // headerText: getLabel(
      //   "To receive a more accurate quote, we recommend that you include photos. If you don't have them now, you can add them later.",
      //   textAlign: TextAlign.center,
      //   textColor: MyColors.contentBlack,
      //   textSize: StyleReference.bodyTextSize + 3,
      //   fontFamily: FONT_URBANIST_SEMIBOLD,
      //   maxLines: 1,
      // ),
      bodyText: Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "To receive a more accurate quote, we recommend that you include photos. If you don't have them now, you can add them later.",
              textAlign: TextAlign.center,
              //color: MyColors.contentBlack,
              //textSize: StyleReference.bodyTextSize + 3,
              //fontFamily: FONT_URBANIST_SEMIBOLD,
            ),
          ],
        ),
      ),
      confirmText: "Add Now",
      cancelText: "Add Later",
      confirmOnTap: () {
        //Navigator.of(context).pop();
        //loadAssets();
      },
      cancelOnTap: () {
        controller.nextPage(
          duration: Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeInOut,
        );

        Navigator.of(context).pop();
      },
    );
  }

  Widget dialogBody() {
    return Container(
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text:
                    'Keep an eye on your list for pricing and info on how to turn this job orange (get it ',
                style: TextStyle(
                  fontSize: StyleReference.bodyTextSize,
                  color: MyColors.contentBlack,
                  fontFamily: FONT_URBANIST_SEMIBOLD,
                ),
              ),
              TextSpan(
                text: 'done',
                style: TextStyle(
                  fontSize: StyleReference.bodyTextSize + 1,
                  color: MyColors.contentBlack,
                  fontFamily: FONT_URBANIST_SEMIBOLD,
                ),
              ),
              TextSpan(
                text: ').',
                style: TextStyle(
                  fontSize: StyleReference.bodyTextSize + 1,
                  color: MyColors.contentBlack,
                  fontFamily: FONT_URBANIST_SEMIBOLD,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIndicator() {
    return Container(
      margin: EdgeInsets.all(30),

      // Future builder is used because the indicators render before the
      // pageView so there was an error:
      // PageController.page cannot be accessed before a PageView is built with
      // it
      child: FutureBuilder(
        future: Future.value(true),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return SmoothPageIndicator(
            controller: controller, // PageController
            count: 4,
            effect: SlideEffect(
              dotHeight: 10,
              dotWidth: 10,
              spacing: 15,
              radius: 24,
              dotColor: MyColors.inactiveDots,
              activeDotColor: MyColors.activeDots,
            ),
          );
        },
      ),
    );
  }

  void updateNicknameScreen() {
    if (nickNameController.text != '') {
      setState(() {
        nicknameScreenFilled = true;
      });
    } else {
      setState(() {
        nicknameScreenFilled = false;
      });
    }
  }

  void updateDescriptionScreen() {
    if (descriptionController.text != '') {
      setState(() {
        descriptionScreenFilled = true;
      });
    } else {
      setState(() {
        descriptionScreenFilled = false;
      });
    }
  }

  void updateImageScreen() {
    setState(() {
      imageScreenFormFilled = true;
    });
  }

  // properties list drop down
  Widget properties() {
    return /*Showcase.withWidget(
      key: _propertyKey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      disableAnimation: true,
      overlayOpacity: 0.80,
      overlayPadding: EdgeInsets.all(10),
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      animationDuration: Duration.zero,
      containerBuilder: (context, bound, offset, container) {
        return Positioned(
          child: container,
        );
      },
      container: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: MediaQuery.of(context).size.height - _widgetYPosition,
                width: MediaQuery.of(context).size.width - 32,
                child: Container(
                  padding: Platform.isAndroid
                      ? EdgeInsets.only(bottom: 32)
                      : EdgeInsets.only(bottom: 0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Choose",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: FONT_URBANIST_MEDIUM,
                      ),
                      children: [
                        TextSpan(
                          text: ' "Add a New Property" ',
                          style: TextStyle(
                            color: MyColors.contentBlack,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: FONT_URBANIST_MEDIUM,
                          ),
                        ),
                        TextSpan(
                          text:
                              "in the drop down menu, and type in your address.",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _widgetYPosition + _widgetHeight,
                right: 16,
                child: Container(
                  child: roundedButton(
                    "Got It",
                    onTap: () {
                      Future.delayed(Duration(milliseconds: 300)).then(
                        (value) {
                          getPosition(_nickNameKey);
                          ShowCaseWidget.of(context)!.startShowCase(
                            [_nickNameKey],
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Which property is this for?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: StyleReference.boldedSubheading,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: DropdownButton(
              underline: Container(
                height: 1.0,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: MyColors.blackBorderColor,
                      width: 0.7,
                    ),
                  ),
                ),
              ),
              isExpanded: true,
              value: propertyVal,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              hint: getLabel(
                'Property',
                textColor: MyColors.contentBlack,
                textSize: StyleReference.boldedSubheading,
                fontFamily: FONT_URBANIST_SEMIBOLD,
              ),
              iconSize: 24,
              onChanged: (String? newValue) {
                if (newValue != "") {
                  setState(() {
                    propertyVal = newValue;
                  });
                }
              },
              items: propertiesItems,
            ),
          ),
        ],
      ),
    );*/
        Container();
  }

  Widget nicknameField() {
    return Container(
      //key: _nickNameWidgetKey,
      child: Column(
        children: [
          Text(
            "Dale un nombre a esta busqueda",
            style: TextStyle(
              color: MyColors.activeDots,
              fontFamily: FONT_URBANIST_SEMIBOLD,
              fontSize: StyleReference.bodyTextSize,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 35.0,
              right: 35.0,
              top: 42.0,
            ),
            child: Form(
              key: firstKey,
              child: CustomEditText(
                underlineColor: MyColors.activeDots,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                hint: "Nombre",
                textSize: StyleReference.bodyTextSize,
                maxLength: 40,
                validator: (String? value) {
                  if (value!.length == 0) {
                    return "Ingresa un nombre";
                  }
                  if (value.length > 100) {
                    return "Por favor menos de 4o caracteres (asi lo recuerdas mejor)";
                  }
                  return null;
                },
                textEditingController: nickNameController,
                fontFamily: FONT_URBANIST_SEMIBOLD,
                color: MyColors.activeDots,
                textColor: MyColors.activeDots,
                onChanged: (value) {
                  updateNicknameScreen();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondField() {
    return Container(
      child: Column(
        children: [
          Text(
            "Cuanto equipaje llevas?",
            style: TextStyle(
              color: MyColors.activeDots,
              fontFamily: FONT_URBANIST_SEMIBOLD,
              fontSize: StyleReference.bodyTextSize,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          for (int i = 0; i < baggage.length; i++)
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: 0,
              title: Text(
                baggage[i],
                style: TextStyle(
                  color: MyColors.activeDots,
                  fontFamily: FONT_URBANIST_MEDIUM,
                  fontSize: StyleReference.bodyTextSize,
                ),
              ),
              leading: Radio(
                value: i,
                groupValue: _currBaggage,
                activeColor: MyColors.activeDots,
                onChanged: (int? value) {
                  setState(
                    () {
                      _currBaggage = value!;
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget thirdField() {
    return Container(
      child: Column(
        children: [
          Text(
            "Como manejas las escalas",
            style: TextStyle(
              color: MyColors.activeDots,
              fontFamily: FONT_URBANIST_SEMIBOLD,
              fontSize: StyleReference.bodyTextSize,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          for (int i = 0; i < stops.length; i++)
            ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              horizontalTitleGap: 0,
              title: Text(
                stops[i],
                style: TextStyle(
                  color: MyColors.activeDots,
                  fontFamily: FONT_URBANIST_MEDIUM,
                  fontSize: StyleReference.bodyTextSize,
                ),
              ),
              leading: Radio(
                value: i,
                groupValue: _currStops,
                activeColor: MyColors.activeDots,
                onChanged: (int? value) {
                  setState(
                    () {
                      _currStops = value!;
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget fourthField() {
    return Container(
      child: Column(
        children: [
          Text(
            "A donde vas (y desde donde)?",
            style: TextStyle(
              color: MyColors.activeDots,
              fontFamily: FONT_URBANIST_SEMIBOLD,
              fontSize: StyleReference.bodyTextSize,
            ),
          ),
        ],
      ),
    );
  }

  statusDropDown() {
    return /*Expanded(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Showcase.withWidget(
              key: _nowSoonKey,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              overlayOpacity: 0.80,
              disableAnimation: true,
              animationDuration: Duration.zero,
              containerBuilder: (context, bound, offset, container) {
                return Positioned(
                  child: container,
                );
              },
              container: SafeArea(
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: MediaQuery.of(context).size.height -
                            _widgetYPosition,
                        width: MediaQuery.of(context).size.width - 16,
                        child: Container(
                          padding: Platform.isAndroid
                              ? EdgeInsets.only(bottom: 32)
                              : EdgeInsets.only(bottom: 0),
                          child: Column(
                            children: [
                              Container(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Last Step!",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FONT_URBANIST_MEDIUM,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "Tell us when you want the job done.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FONT_URBANIST_MEDIUM,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Container(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: '"Now"',
                                    style: TextStyle(
                                      color: MyColors.contentBlack,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: FONT_URBANIST_MEDIUM,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FONT_URBANIST_MEDIUM,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '"Soon" ',
                                        style: TextStyle(
                                          color: MyColors.contentBlack,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FONT_URBANIST_MEDIUM,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'will get you quotes right away.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: FONT_URBANIST_MEDIUM,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: _widgetYPosition + _widgetHeight,
                        right: 16,
                        child: Container(
                          child: roundedButton(
                            "Got It",
                            onTap: () {
                              getPosition(_somedayKey);
                              ShowCaseWidget.of(context)!.startShowCase(
                                [_somedayKey],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Radio(
                        value: 0,
                        groupValue: _currJobStatus,
                        activeColor: MyColors.contentBlack,
                        onChanged: (int? value) {
                          setState(
                            () {
                              //setting two values because it tracks current highlight in the list other saves the value
                              //For backend use (status).

                              status = statusTitle[value!];
                              _currJobStatus = value;
                            },
                          );
                        },
                      ),
                      title: Text(
                        statusTitle[0],
                        style: TextStyle(
                          fontSize: StyleReference.bodyTextSize - 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
                        child: Text(statusDescription[0]),
                      ),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 1,
                        groupValue: _currJobStatus,
                        activeColor: MyColors.contentBlack,
                        onChanged: (int? value) {
                          setState(
                            () {
                              //setting two values because it tracks current highlight in the list other saves the value
                              //For backend use (status).

                              status = statusTitle[value!];
                              _currJobStatus = value;
                            },
                          );
                        },
                      ),
                      title: Text(
                        statusTitle[1],
                        style: TextStyle(
                          fontSize: StyleReference.bodyTextSize - 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
                        child: Text(statusDescription[1]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Showcase.withWidget(
              key: _somedayKey,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              overlayOpacity: 0.80,
              disableAnimation: true,
              animationDuration: Duration.zero,
              containerBuilder: (context, bound, offset, container) {
                return Positioned(
                  child: container,
                );
              },
              container: SafeArea(
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        width: MediaQuery.of(context).size.width - 16,
                        bottom: MediaQuery.of(context).size.height -
                            _widgetYPosition,
                        child: Container(
                          padding: Platform.isAndroid
                              ? EdgeInsets.only(bottom: 32)
                              : EdgeInsets.only(bottom: 0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '"Someday"',
                              style: TextStyle(
                                color: MyColors.contentBlack,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: FONT_URBANIST_MEDIUM,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      ' will stay on your list until you request a quote sometime in the future.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FONT_URBANIST_MEDIUM,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: _widgetYPosition + _widgetHeight,
                        right: 16,
                        child: Container(
                          child: roundedButton(
                            "Got It",
                            onTap: () {
                              ShowCaseWidget.of(context)!.dismiss();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              child: ListTile(
                leading: Radio(
                  value: 2,
                  groupValue: _currJobStatus,
                  activeColor: MyColors.contentBlack,
                  onChanged: (int? value) {
                    setState(
                      () {
                        //setting two values because it tracks current highlight in the list other saves the value
                        //For backend use (status).

                        status = statusTitle[value!];
                        _currJobStatus = value;
                      },
                    );
                  },
                ),
                title: Text(
                  statusTitle[2],
                  style: TextStyle(
                    fontSize: StyleReference.bodyTextSize - 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
                  child: Text(statusDescription[2]),
                ),
              ),
            ),
          ],
        ),
      ),
    );*/
        Container();
  }
}
