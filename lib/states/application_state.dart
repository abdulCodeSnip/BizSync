// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ApplicationState with ChangeNotifier {
  // First Onboarding Screen Values e.g business name, type and working_hours

  String business_name = "";
  String business_type = "";
  String business_working_hours = "";

  // Updated First Onboarding Screen values, if business name is entered or working hours are selected

  // Business name would be updated through this function
  void setBusinessName(String value) {
    business_name = value;
    notifyListeners();
  }

  // Business Type will be modified with this function
  void setBusinessType(String value) {
    business_type = value;
    notifyListeners();
  }

  // If working hours are selected then it will be updated via this function
  void setBusinessWorkingHours(String value) {
    business_working_hours = value;
    notifyListeners();
  }

  // Variable that will hold the index of the onboarding screen to be shown. if its zero (0) then first screen will be shown otherwise more screens in the queue will be shown on the screen
  int current_onboarding_screen_index = 0;

  // Move user to the next page if clicked on the Next Button
  void incrementOnboardingScreenIndex() {
    if (current_onboarding_screen_index < 5) {
      current_onboarding_screen_index++;
      notifyListeners();
    }
  }

  // Move user back to the previous screen in the queue of onboarding
  void decrementOnboardingScreenIndex() {
    if (current_onboarding_screen_index > 0) {
      current_onboarding_screen_index--;
      notifyListeners();
    }
  }
}
