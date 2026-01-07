import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

import 'package:whatsapp_automation/utils/AppColors.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),

      margin: EdgeInsets.only(bottom: 40),
      child: Stack(
        children: [
          // Centered Circle to hold other child icons
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
          // Chat Icon that is a parent icon to hold the "bolt" icon
          Positioned.fill(
            child: Center(
              child: Icon(
                CupertinoIcons.chat_bubble_fill,
                size: 130,
                color: const Color(0xFF003C7B),
              ),
            ),
          ),

          // Flash Icon inside the icon and circle to attract eye
          Positioned.fill(
            child: Transform.rotate(
              angle: 14.5 * (math.pi / 100),
              child: Icon(Icons.bolt, size: 185, color: Color(0xFF86E2FF)),
            ),
          ),

          // Title and a small description of application
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(8),
                width: (MediaQuery.of(context).size.width),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  spacing: 10,
                  children: [
                    // Title of Onboarding Screen
                    const Text(
                      "Automate WhatsApp Conversations",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        fontFamily: "PoppinsBold",
                        color: Appcolors.headingTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    // A Small description of first onboarding
                    const Text(
                      "Respond instantly to customers, even when you're offline.",
                      style: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Appcolors.bodyTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
