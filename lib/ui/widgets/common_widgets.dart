//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passabordo/utils/constants.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:passabordo/utils/styleReference.dart';

Widget internetDialogTemplate(
    {BuildContext? context,
    Widget? headerIcon,
    required String headerText,
    String? bodyText,
    required String buttonText,
    Function? onPress}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          headerIcon ?? Container(),
          Container(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: headerText + "\n\n",
                    style: TextStyle(
                      fontSize: StyleReference.dialogBody,
                      color: MyColors.contentBlack,
                      fontWeight: FontWeight.bold,
                      fontFamily: FONT_URBANIST_MEDIUM,
                    ),
                  ),
                  TextSpan(
                    text: bodyText,
                    style: TextStyle(
                      fontSize: StyleReference.dialogBody,
                      color: MyColors.contentBlack,
                      fontFamily: FONT_URBANIST_MEDIUM,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24,
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                    right: 15.0,
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontSize: StyleReference.dialogButton,
                        fontWeight: FontWeight.w600,
                        color: MyColors.contentBlack),
                  ),
                ),
                onTap: () {
                  onPress!();
                  Navigator.pop(context!);
                },
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget dialogueTemplate({
  BuildContext? context,
  Widget? headerIcon,
  Widget? headerText,
  Widget? bodyText,
  bool cancel = true,
  String? confirmText,
  String cancelText = "GO BACK",
  Function? confirmOnTap,
  Function? cancelOnTap,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          headerIcon ?? Container(),
          SizedBox(height: 8),
          Container(
            child: headerText ?? Container(),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16),
            child: bodyText ?? Container(),
          ),
          Row(
            mainAxisAlignment:
                cancel ? MainAxisAlignment.center : MainAxisAlignment.center,
            children: [
              cancel
                  ? GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cancelText,
                          style: TextStyle(
                            fontSize: StyleReference.bodyTextSize,
                            fontWeight: FontWeight.w600,
                            color: MyColors.subHeader,
                          ),
                        ),
                      ),
                      onTap: () {
                        cancelOnTap!();
                      },
                    )
                  : Container(),
              cancel
                  ? SizedBox(
                      width: 24,
                    )
                  : Container(),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    confirmText ?? "YES",
                    style: TextStyle(
                      fontSize: StyleReference.bodyTextSize,
                      fontWeight: FontWeight.w600,
                      color: MyColors.contentBlack,
                    ),
                  ),
                ),
                onTap: () {
                  confirmOnTap!();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget GradientBack(
  String title,
  double gradientHeight,
  Color gradient1,
  Color gradient2, {
  double fractional1 = 0.5,
  double fractional2 = 0.5,
  double fractional3 = 0.9,
  double fractional4 = 0.99,
}) {
  final gradientRectangle = Container(
    height: gradientHeight,
    decoration: BoxDecoration(
        gradient: LinearGradient(
      colors: [
        gradient1,
        gradient2,
      ],
      begin: FractionalOffset(fractional1, fractional2),
      end: FractionalOffset(fractional3, fractional4),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    )),
    child: Text(
      title.length > 0 ? title : "",
      style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontFamily: "RussoOne",
        fontWeight: FontWeight.bold,
      ),
    ),
    alignment: Alignment(-0.9, -0.6),
  );

  return gradientRectangle;
}

// ignore: must_be_immutable
class CustomEditText extends StatelessWidget {
  Color? underlineColor = MyColors.subHeader;
  final String? hint;
  final TextEditingController? textEditingController;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? icon;
  final int? maxLength;
  bool? large;
  bool? medium;
  bool autovalidate;
  final Key? key;
  FocusNode? nextFocus;
  final Color color;
  final Color textColor;
  final bool readOnly;
  final onTap;
  bool isCardText;
  double textSize = 14;
  double hintTextSize = 10;
  int maxErrorLines;
  final onSaved;
  final onChanged;
  String? fontFamily;
  FormFieldValidator<String>? validator;
  FocusNode? focusNode = FocusNode();

  CustomEditText({
    this.underlineColor,
    this.hint,
    this.textEditingController,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.icon,
    this.onSaved,
    this.obscureText = false,
    this.maxLength,
    this.nextFocus,
    this.focusNode,
    this.readOnly = false,
    this.autovalidate = false,
    this.key,
    this.color = MyColors.contentBlack,
    this.onTap,
    this.textSize = 14,
    this.hintTextSize = 10,
    this.validator,
    this.maxErrorLines = 5,
    this.isCardText = false,
    this.fontFamily,
    this.textColor = MyColors.contentBlack,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var padding;
    if (!isCardText) {
      padding = EdgeInsets.fromLTRB(2.0, 2.0, 12.0, 4.0);
    } else {
      padding = EdgeInsets.symmetric(vertical: 7);
    }

    return Container(
      child: TextFormField(
        style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontFamily: fontFamily,
        ),
        obscureText: obscureText,
        controller: textEditingController,
        autocorrect: false,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        cursorColor: MyColors.contentBlack,
        textInputAction: TextInputAction.next,
        autofocus: false,
        readOnly: readOnly,
        validator: validator,
        onTap: onTap,
        maxLength: maxLength,
        buildCounter: (BuildContext context,
                {int? currentLength, int? maxLength, bool? isFocused}) =>
            null,
        onSaved: onSaved,
        onChanged: onChanged,
        key: key,
        focusNode: focusNode,
        onFieldSubmitted: (v) {
          focusNode!.unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
        },
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(
            color: color,
            fontSize: textSize,
            fontFamily: FONT_URBANIST_LIGHT,
          ),
          contentPadding: padding,
          errorMaxLines: maxErrorLines,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: underlineColor!,
              width: 0.7,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.contentBlack,
              width: 0.7,
            ),
          ),
        ),
      ),
    );
  }
}

//oval button with icon and/or text inside
Widget buttonTypeI(
  String text, {
  GestureTapCallback? onTap,
  Color textColor = const Color.fromARGB(255, 255, 255, 255),
  double height = 55,
  double width = 265,
  EdgeInsetsGeometry? margin,
  BoxFit fit = BoxFit.cover,
  String fontFamily = FONT_URBANIST_SEMIBOLD,
  double textSize = 18.0,
  Color color = const Color(0XFFFFFFFF),
  IconData? icon,
  Color colorSurface = const Color.fromARGB(255, 255, 255, 255),
  Color iconColor = const Color.fromARGB(255, 255, 255, 255),
  double iconSize = 12,
  required bool outline,
  Color borderColor = const Color.fromARGB(255, 255, 255, 255),
}) {
  return outline
      ? OutlinedButton(
          child: Container(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Align(
                        alignment: Alignment.center,
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: iconSize,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: textSize,
                      fontFamily: fontFamily,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          style: OutlinedButton.styleFrom(
            primary: color,
            onSurface: colorSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(44.0),
            ),
            side: BorderSide(width: 2, color: borderColor),
          ),
          onPressed: onTap,
        )
      : InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(width: width, height: height),
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: textColor,
                        fontSize: textSize,
                        fontFamily: fontFamily,
                      ),
                      child: Text(text),
                    ),
                  ),
                  icon != null
                      ? Align(
                          alignment: Alignment.center,
                          child: Icon(icon),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        );
}
