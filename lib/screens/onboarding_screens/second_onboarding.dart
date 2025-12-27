import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:whatsapp_automation/components/custom_icon_for_onboarding.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 70),
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 60,
                    spreadRadius: 20,
                    color: const Color(0xFFD3EBFF),
                  ),
                ],
              ),

              // Icons in the center of white container to polishing UI.
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.chevron_right, size: 30, color: Colors.blue),
                  Text(
                    "_",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Icon(Icons.chevron_left, size: 30, color: Colors.blue),
                ],
              ),
            ),
          ),
        ),

        // Flash Icon
        CustomIconForOnboarding(
          icon: Icons.bolt,
          icon_horizontal_pos: 50,
          icon_vertical_pos: 160,
          size_of_icon: 32,
          color_of_icon: Colors.blue,
          height_of_container: 42,
          width_of_container: 42,
          color_of_parent_box: Colors.white,
          border_radius_of_parent: 100,
          useTop: true,
          useRight: true,
        ),

        // Sparkles icon
        CustomIconForOnboarding(
          icon: IonIcons.sparkles,
          icon_horizontal_pos: 60,
          icon_vertical_pos: 265,
          size_of_icon: 34,
          color_of_icon: Colors.blue,
          height_of_container: 55,
          width_of_container: 55,
          color_of_parent_box: Colors.white,
          border_radius_of_parent: 10,
          useTop: false,
          useRight: true,
        ),

        // Addition Icon
        CustomIconForOnboarding(
          icon: Icons.add,
          icon_horizontal_pos: 70,
          icon_vertical_pos: 260,
          size_of_icon: 20,
          color_of_icon: Colors.blue,
          height_of_container: 30,
          width_of_container: 30,
          color_of_parent_box: Colors.white,
          border_radius_of_parent: 10,
          useTop: false,
          useRight: false,
        ),

        // Message Icon
        CustomIconForOnboarding(
          icon: Icons.chat_bubble_rounded,
          icon_horizontal_pos: 50,
          icon_vertical_pos: 160,
          size_of_icon: 30,
          color_of_icon: Colors.blue,
          height_of_container: 50,
          width_of_container: 50,
          color_of_parent_box: Colors.white,
          border_radius_of_parent: 10,
          useTop: true,
          useRight: false,
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Smart AI Replies",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Respond to customers instantly with AI-powered personalized messages",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xFF808080),
                    ),
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
