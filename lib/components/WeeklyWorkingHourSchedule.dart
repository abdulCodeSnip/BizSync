/* 
This component will be used to get the business working hours from the business owner,
-> Default Presets that will return the starting & ending time, day. 
-> Inside the dropdown, when the "Custom Scheduled is pressed, 
   -> then another dialog will be opened to allow user for fully customizable, 
   working day, and working hours, 
   there would also be an option for adding break time using a checkbox"
*/

import 'package:flutter/material.dart';
import 'package:whatsapp_automation/utils/AppColors.dart';

class WeeklyWorkingHourSchedule extends StatefulWidget {
  const WeeklyWorkingHourSchedule({super.key});

  @override
  State<WeeklyWorkingHourSchedule> createState() =>
      _WeeklyWorkingHourScheduleState();
}

class _WeeklyWorkingHourScheduleState extends State<WeeklyWorkingHourSchedule> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          // function to be called when pressed on the button
          onPressed: () => {print("Dropdown is Opened")},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xD4F5FCFF),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
              side: BorderSide(color: Appcolors.iconsAndBtnsColor, width: 2),
            ),
            shadowColor: Appcolors.appsBodyBGColor,
            elevation: 0,
          ),
          child: Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*
          first child of the icon, to show the hint text of the "Button", 
           -> when any of the presets is changed or the custom working hours are selected, 
           -> then this text will change immediately based on different conditions
          */
              Text(
                "Set working hours",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  color: Appcolors.bodyTextColor,
                ),
              ),

              /*
          Second child of the button, to show the dropdown icon
           -> this icon will be changed by opening and closing the dropdown menu
          */
              Icon(
                Icons.arrow_drop_down,
                color: Appcolors.bodyTextColor,
                size: 25,
              ),
            ],
          ),
        ),
        CustomWorkingHours(),
      ],
    );
  }
}

/*
 ## Custom Dropdown using Stack and Column Layouts ##
    => this will show default presets and also custom working days and working hours selection
*/

class CustomWorkingHours extends StatelessWidget {
  const CustomWorkingHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: (MediaQuery.of(context).size.width) - 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 3),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
