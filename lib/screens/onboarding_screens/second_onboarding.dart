import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_automation/utils/AppColors.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 40),
      child: Stack(
        children: [
          /* Centered Circle to hold other icons, 
        => As its the first child inside the Stack it will be placed behind the other icons in the center of the screen*/
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Appcolors.parentBodyBGColor,
                borderRadius: BorderRadius.circular(200),
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

          // Centered Calender Icon that will hold differen small icons to acheive the UI that is more compact
          Positioned.fill(
            child: Center(
              child: Icon(
                Icons.calendar_month_sharp,
                size: 130,
                color: Appcolors.iconsAndBtnsColor,
              ),
            ),
          ),

          // Chat Icon that is on top of the calender icon in the center of the screen
          Positioned(
            right: 55,
            bottom: 0,
            top: -114,
            child: Icon(
              CupertinoIcons.chat_bubble_2_fill,
              size: 100,
              color: Appcolors.iconsAndBtnsColor,
            ),
          ),

          // Dollar Currency Icon inside the chat icon to be placed at the right corner of the Calender Icon in the center
          Positioned(
            top: -125,
            bottom: 0,
            right: 87,
            child: Icon(
              Icons.attach_money_outlined,
              size: 50,
              color: Appcolors.parentBodyBGColor,
            ),
          ),

          // Description and a title at the end of the screen
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
                    "Turn Chats into Bookings",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 28,
                      color: Appcolors.headingTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Let customers book appointments directly from WhatsApp chats.",
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
