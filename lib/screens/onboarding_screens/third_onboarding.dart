import 'package:flutter/material.dart';
import 'package:whatsapp_automation/utils/AppColors.dart';

// Parent component
class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // centered circle to hold other elements and icons
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Appcolors.parentBodyBGColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Appcolors.parentBodyBGColor,
                    offset: Offset(1, 3),
                    blurRadius: 12,
                    spreadRadius: 4,
                  ),
                ],
              ),
            ),
          ),

          // centered Icon with different elements such as a rectange and more to polish the UI more concisely
          Center(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 100,
              width: 145,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Appcolors.iconsAndBtnsColor,
                  width: 6,
                ),
                borderRadius: BorderRadius.circular(10),
              ),

              /* 
                Row to hold the icons inside the bordered container, 
                  => because there are multiple elements to be added
                  => the elements are in one row, and there are two columns out there
              */
              child: Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 4,
                children: [
                  // first column of the icon at the left side inside the border container
                  Column(
                    spacing: 4,
                    children: [
                      Container(
                        height: 22,
                        width: 35,
                        padding: EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: Appcolors.iconsAndBtnsColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 4,
                            width: 22,
                            decoration: BoxDecoration(
                              color: Appcolors.parentBodyBGColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Appcolors.iconsAndBtnsColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),

                  /*
                    second column of the icon at the right side inside the bordered container
                    => We'll use Column instead of Stack to because it 
                        will throw an exception if we use it
                  */
                  CustomIconPlacement(),
                ],
              ),
            ),
          ),

          // Description and title of the page at the bottom of the screen
          Positioned(
            bottom: 70,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Stay in Control, always",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 28,
                      color: Appcolors.headingTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Review conversations, step in anytime, and let AI handle the rest.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 17,
                      color: Appcolors.bodyTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// custom element to be used for the parent container "rectangle" inside the circle
class CustomIconPlacement extends StatelessWidget {
  CustomIconPlacement({super.key});

  // a method that will return a custom container with the give height, width and radius
  Container indicatorWidget(
    double indicatorHeight,
    double indicatorWidth,
    double indicatorRadius,
  ) {
    return Container(
      height: indicatorHeight,
      width: indicatorWidth,
      margin: EdgeInsets.only(left: 1),
      decoration: BoxDecoration(
        color: Appcolors.iconsAndBtnsColor,
        borderRadius: BorderRadius.circular(indicatorRadius),
      ),
    );
  }

  // list of elements with custom width and height
  final List<Map<String, dynamic>> elementsLayout = [
    {"width": 18.0, "height": 5.0, "radius": 5.0},
    {"width": 6.0, "height": 6.0, "radius": 7.0},
    {"width": 5.0, "height": 5.0, "radius": 6.0},
  ];

  // element list for making the "Signal Icon"
  final List<Map<String, dynamic>> signalIconElements = [
    {"_id": 1, "height": 18.0, "width": 12.0, "radius": 9.0},
    {"_id": 1, "height": 28.0, "width": 12.0, "radius": 9.0},
    {"_id": 1, "height": 37.0, "width": 12.0, "radius": 9.0},
    {"_id": 1, "height": 46.0, "width": 12.0, "radius": 9.0},
    {"_id": 1, "height": 56.0, "width": 12.0, "radius": 9.0},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            spacing: 2,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...elementsLayout.map((element) {
                return indicatorWidget(
                  element["height"],
                  element["width"],
                  element["radius"],
                );
              }),
            ],
          ),
          Positioned(
            top: 1,
            left: 3,
            child: Icon(
              Icons.auto_graph_outlined,
              size: 53,
              color: Appcolors.iconsAndBtnsColor,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            left: 0,
            height: 70,
            child: Row(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: signalIconElements.map((signalElem) {
                return Container(
                  height: signalElem["height"],
                  width: signalElem["width"],
                  decoration: BoxDecoration(
                    color: Appcolors.iconsAndBtnsColor,
                    borderRadius: BorderRadius.circular(signalElem["radius"]),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
