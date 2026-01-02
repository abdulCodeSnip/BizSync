import 'package:flutter/material.dart';
import 'package:whatsapp_automation/utils/AppColors.dart';

class BusinessInfoScreen extends StatelessWidget {
  const BusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Stack(
        children: [
          // first child of the stack would be the title and the description of the screen
          Container(
            margin: EdgeInsets.only(top: 14),
            padding: EdgeInsets.all(5),
            child: Column(
              spacing: 7,
              children: [
                Text(
                  "Tell us about your Business",
                  style: TextStyle(
                    fontFamily: "PoppinsBold",
                    fontSize: 24,
                    color: Appcolors.headingTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "This information will help us customize your experience and set up your workspace",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    color: Appcolors.bodyTextColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120,
            left: 8,
            right: 8,
            child: Column(
              children: [
                // input for getting the business name from the user using "TextField" widget
                TextField(
                  decoration: InputDecoration(
                    labelText: "Business Name",
                    hintText: "Buiness Name e.g John Warehouse",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Appcolors.parentBodyBGColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Appcolors.iconsAndBtnsColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// business type card icon that can be clicked and the type of business would be selected e.g "clinic", "restaurant", "salon"
class BusinessTypeCard extends StatelessWidget {
  const BusinessTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
