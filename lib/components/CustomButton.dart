// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/states/application_state.dart';

class Custombutton extends StatelessWidget {
  final String buttonTitle;

  const Custombutton({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    // Get the global State of the app and access all the elements of the store
    final appState = context.watch<ApplicationState>();

    // Function to be used for custom button

    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          // Increment the index and then move to the next screen
          onPressed: () => {appState.incrementOnboardingScreenIndex()},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blueAccent),
          ),
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "poppins",
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
