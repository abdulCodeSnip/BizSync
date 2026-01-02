import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/states/application_state.dart';

class OnboardingProgressBar extends StatelessWidget {
  final int currentScreenIndex;
  const OnboardingProgressBar({super.key, required this.currentScreenIndex});

  @override
  Widget build(BuildContext context) {
    final int currentScreenIndex = context
        .watch<ApplicationState>()
        .current_onboarding_screen_index;

    // Check if all the onboarding Screens are watched completely, if so, then move user to processing stage, to get basic and detailed information about the business.
    return currentScreenIndex < 2
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: List.generate(3, (i) {
              return Container(
                height: 8,
                width: currentScreenIndex == i ? 30 : 8,
                decoration: BoxDecoration(
                  color: currentScreenIndex == i ? Color(0xFF003C7B) : Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
              );
            }),
          )
        : Text("");
  }
}
