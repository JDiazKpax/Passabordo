import 'package:flutter/material.dart';
import 'package:passabordo/ui/widgets/common_widgets.dart';
import 'package:passabordo/utils/myColors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget showButtonsModal({
  required BuildContext context,
  required bool nicknameScreenFilled,
  VoidCallback? onTap1,
  VoidCallback? onTap2,
  String? backText,
  VoidCallback? progress,
  PageController? controller,
}) {
  return Container(
    height: 60,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buttonTypeI(
          backText != null ? backText : "ATRAS",
          height: 40,
          width: 150,
          color: Colors.transparent,
          textColor: Colors.grey,
          onTap: onTap1,
          outline: false,
        ),
        _buildCircleIndicator(controller),
        buttonTypeI("SIGUIENTE",
            height: 40,
            width: 150,
            color: Colors.transparent,
            textColor:
                nicknameScreenFilled ? MyColors.contentBlack : Colors.grey,
            onTap: onTap2,
            outline: false)
      ],
    ),
  );
}

Widget _buildCircleIndicator(PageController? controller) {
  return Container(
    margin: EdgeInsets.all(0),

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
            spacing: 5,
            radius: 24,
            dotColor: MyColors.inactiveDots,
            activeDotColor: MyColors.activeDots,
          ),
        );
      },
    ),
  );
}
