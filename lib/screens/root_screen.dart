import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/components/CustomButton.dart';
import 'package:whatsapp_automation/components/onboarding_progress_bar.dart';
import 'package:whatsapp_automation/screens/add_your_services.dart';
import 'package:whatsapp_automation/screens/business_info_screen.dart';
import 'package:whatsapp_automation/screens/create_business_account.dart';
import 'package:whatsapp_automation/screens/onboarding_screens/first_onboarding.dart';
import 'package:whatsapp_automation/screens/onboarding_screens/second_onboarding.dart';
import 'package:whatsapp_automation/screens/onboarding_screens/third_onboarding.dart';
import 'package:whatsapp_automation/states/application_state.dart';
import 'package:whatsapp_automation/utils/AppColors.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  // Return the child elements based on the current index, means that if the index changes then the screen will automatically switched
  @override
  Widget build(BuildContext context) {
    final int currentScreenIndex = context
        .watch<ApplicationState>()
        .current_onboarding_screen_index;

    final appState = context.watch<ApplicationState>();

    // Get the title of the screen from the array based on the index of the screen
    // final currentOnboardingTitle = currentOnboardingTitles[currentScreenIndex];

    // List of Screens to be used in the Root Screen
    final screensList = [
      FirstOnboarding(),
      SecondOnboarding(),
      ThirdOnboarding(),

      // Screens to get the data from the user about the business
      BusinessInfoScreen(),
      AddYourServices(),
      CreateBusinessAccount(),
    ];
    return Stack(
      children: [
        /* first child of the STACK to be inside the layout,
          -> to add more childs and acheive the desired UI, 
          -> we need to add more child widgets on top of the first child*/
        Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Appcolors.appsBodyBGColor,
          ),
          child:
              // Get the entire screen and shown to user depending on the index
              screensList[currentScreenIndex],
        ),

        // Circular elements at different corners of the screen
        CustomCircularElement(
          isTop: true,
          isRight: currentScreenIndex % 2 != 0 ? true : false,
          positionX: -30,
          positionY: -10,
          elementHeight: 100,
          elementWidth: 100,
          isBackground: true,
        ),
        CustomCircularElement(
          isTop: true,
          isRight: currentScreenIndex % 2 != 0 ? true : false,
          positionX: 60,
          positionY: 100,
          elementHeight: 20,
          elementWidth: 20,
          isBackground: true,
        ),
        CustomCircularElement(
          isTop: true,
          isRight: currentScreenIndex % 2 != 0 ? true : false,
          positionX: -100,
          positionY: -80,
          elementHeight: 250,
          elementWidth: 250,
          isBackground: false,
        ),

        CustomCircularElement(
          isTop: false,
          isRight: currentScreenIndex % 2 != 0 ? false : true,
          positionX: -20,
          positionY: -30,
          elementHeight: 100,
          elementWidth: 100,
          isBackground: true,
        ),
        CustomCircularElement(
          isTop: false,
          isRight: currentScreenIndex % 2 != 0 ? false : true,
          positionX: -105,
          positionY: -100,
          elementHeight: 250,
          elementWidth: 250,
          isBackground: false,
        ),

        CustomCircularElement(
          isTop: false,
          isRight: currentScreenIndex % 2 != 0 ? false : true,
          positionX: 15,
          positionY: 100,
          elementHeight: 20,
          elementWidth: 20,
          isBackground: true,
        ),

        // Adding a progress line to show the user actaul step, with "Next Button" to move forward in the screens list
        Positioned(
          bottom: 20,
          child: // Adding a progress line to show the user actaul step, with "Next Button" to move forward in the screens list
          Column(
            spacing: 10,
            children: [
              OnboardingProgressBar(currentScreenIndex: currentScreenIndex),
              Custombutton(
                buttonTitle: currentScreenIndex == 2
                    ? "Set up your account"
                    : "Next",
              ),
            ],
          ),
        ),
        // Arrow Icon at the top to get back to the previous screen,
        currentScreenIndex > 0
            ? Positioned(
                top: 20,
                left: 20,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: appState.decrementOnboardingScreenIndex,
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

// Custom Circular element at different corners of the screen, to make the UI more compact
class CustomCircularElement extends StatelessWidget {
  // two parameter to get the boolean value for placing element at the top of the screen, or right side of the screens
  final bool isTop;
  final bool isRight;

  // get the horizontal and vertical positions and width and height of the element to be placed
  final double positionX;
  final double positionY;
  final double elementWidth;
  final double elementHeight;

  // boolean parameter if it is true, we'll give background color to the element otherwise we'll add only a border
  final bool isBackground;

  const CustomCircularElement({
    super.key,
    required this.isTop,
    required this.isRight,
    required this.positionX,
    required this.positionY,
    required this.elementHeight,
    required this.elementWidth,
    required this.isBackground,
  });

  // function to return the border radius of element based on its position
  BorderRadius borderRadius() {
    // if the element needs to be adjusted at the top-right corner of the screen
    if (isTop && isRight & !isBackground) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(elementHeight),
        topLeft: Radius.circular(elementHeight),
      );
    }

    // if the element has to be placed at top-left corner of the screen
    if (isTop && !isRight & !isBackground) {
      return BorderRadius.only(
        bottomRight: Radius.circular(elementHeight),
        topRight: Radius.circular(elementHeight),
      );
    }

    // if the element has to be placed at the bottom-right corner of the screen
    if (!isTop && isRight & !isBackground) {
      return BorderRadius.only(
        bottomLeft: Radius.circular(elementHeight),
        topLeft: Radius.circular(elementHeight),
      );
    }

    // if the element has to be at the bottom-left corner of the screen
    if (!isTop && !isRight & !isBackground) {
      return BorderRadius.only(
        bottomRight: Radius.circular(elementHeight),
        topRight: Radius.circular(elementHeight),
      );
    }

    return BorderRadius.circular(elementHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isTop ? positionY : null,
      right: isRight ? positionX : null,
      bottom: !isTop ? positionY : null,
      left: !isRight ? positionX : null,

      child: Container(
        width: elementWidth,
        height: elementHeight,
        decoration: BoxDecoration(
          color: isBackground ? const Color(0x4AFACDCD) : Colors.transparent,
          border: !isBackground
              ? Border.all(
                  color: const Color.fromARGB(106, 218, 177, 177),
                  width: 2,
                )
              : Border.all(width: 0.0, style: BorderStyle.none),
          borderRadius: borderRadius(),
        ),
      ),
    );
  }
}
