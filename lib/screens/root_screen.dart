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

      // Screens to get the data from the user
      BusinessInfoScreen(),
      AddYourServices(),
      CreateBusinessAccount(),
    ];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 20,
        children: [
          // Arrow Icon at the top to get back to the previous screen
          currentScreenIndex > 0
              ? Container(
                  margin: EdgeInsets.only(top: 30, left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: appState.decrementOnboardingScreenIndex,
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
          // Get the entire screen and shown to user depending on the index
          Expanded(child: screensList[currentScreenIndex]),

          // Adding a progress line to show the user actaul step, with "Next Button" to move forward
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
        ],
      ),
    );
  }
}
