// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/states/application_state.dart';

class BusinessTypeCard extends StatelessWidget {
  final String business_type_icon;
  final String business_name;
  final VoidCallback? onClickBusinessIcon;

  // Get the details from other components to fulfill this card requirements and to be used
  const BusinessTypeCard({
    super.key,
    required this.business_type_icon,
    required this.business_name,
    required this.onClickBusinessIcon,
  });

  // A custom widget that will take three arguments, 1.Business name, 2. Image Path of icon, 3. Function for Clicking on an icon
  @override
  Widget build(BuildContext context) {
    // Get the Global State of the Application for better interactivity
    final appState = context.watch<ApplicationState>();

    return GestureDetector(
      onTap: onClickBusinessIcon,
      child: Container(
        width: 110,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 233, 233, 233),
              offset: Offset(0, 0),
              spreadRadius: 2,
              blurRadius: 1,
            ),
          ],

          // If a particular business card is clicked then, a border will be added to show more interactivity
          border: appState.business_type == business_name
              ? Border.all(color: Colors.blue, width: 2)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              business_type_icon,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            Text(
              business_name,
              style: TextStyle(
                fontSize: 13,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
