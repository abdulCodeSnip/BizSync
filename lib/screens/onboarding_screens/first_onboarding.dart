import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Icon to contain other Icons
        Positioned.fill(
          child: Icon(
            CupertinoIcons.chat_bubble,
            size: 120,
            color: Colors.blue,
          ),
        ),

        // icon inside the main icon to show more creative styling
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 140,
          right: MediaQuery.of(context).size.width / 2 - 50,
          child: Transform.rotate(
            angle: 17 * (math.pi / 180),
            child: Icon(Icons.bolt_rounded, size: 80, color: Colors.blue),
          ),
        ),

        // Title and a small description of application
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 10,
                children: [
                  // Title of Onboarding Screen
                  const Text(
                    "Auto Reply to Customers",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: "PoppinsBold",
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // A Small description of first onboarding
                  const Text(
                    "Never miss a message. Your WhatsApp replies automatically, 24/7.",
                    style: TextStyle(
                      fontFamily: "poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
