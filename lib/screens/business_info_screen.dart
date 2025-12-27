import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/states/application_state.dart';

class BusinessInfoScreen extends StatelessWidget {
  const BusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<ApplicationState>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        spacing: 10,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: const Text(
              "Tell us about your business",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: const Text(
              "This information helps us customize your experience and set up your workspace",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),

          SizedBox(height: 5),

          // Get "Business Name" from the user via "input field"
          Align(
            alignment: Alignment.topLeft,
            child: TextField(
              decoration: InputDecoration(
                label: Text(
                  "BUSINESS NAME",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFFD6D6D6),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),

          // Get the type of the business from the user "e.g restaurant, clinic or salon"
          // A horizontal scroll bar to show different business tyypes
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topLeft,
            child: const Text(
              "Select business type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
              ),
            ),
          ),
          ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              overscroll: false,
              scrollbars: false,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  // Card for getting business type as "Clinic"
                  BusinessTypeCard(
                    cardIcon: Icons.health_and_safety,
                    businessTypeName: "Clinic",
                    isCardActive:
                        appState.business_name.toLowerCase() == "clinic"
                        ? true
                        : false,
                  ),

                  // Card for getting business type as "Restaurant"
                  BusinessTypeCard(
                    cardIcon: Icons.restaurant,
                    businessTypeName: "Restaurant",
                    isCardActive:
                        appState.business_name.toLowerCase() == "restaurant"
                        ? true
                        : false,
                  ),

                  // Card for getting business type as "Salon"
                  BusinessTypeCard(
                    cardIcon: Icons.cut,
                    businessTypeName: "Salon",
                    isCardActive:
                        appState.business_name.toLowerCase() == "salon"
                        ? true
                        : false,
                  ),

                  // Card for getting business type as "others"
                  BusinessTypeCard(
                    cardIcon: Icons.more_horiz,
                    businessTypeName: "Others",
                    isCardActive:
                        appState.business_name.toLowerCase() == "others"
                        ? true
                        : false,
                  ),
                ],
              ),
            ),
          ),

          // Get Working Days and working hours from the user via dropdown
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF1F1F1),
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}

// Child class that is responsible for a custom card with icon, "the business type", e.g Salon, Restaurant or Clinic
class BusinessTypeCard extends StatelessWidget {
  final dynamic cardIcon;
  final String businessTypeName;
  final bool isCardActive;

  const BusinessTypeCard({
    super.key,
    required this.cardIcon,
    required this.businessTypeName,
    required this.isCardActive,
  });

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<ApplicationState>();
    return TextButton(
      isSemanticButton: true,
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        fixedSize: Size(100, 120),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        side: BorderSide(
          color: isCardActive ? Colors.blue : const Color(0xFFECECEC),
          width: isCardActive ? 2 : 1.5,
        ),
      ),
      onPressed: () => appState.setBusinessName(businessTypeName),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(
                      cardIcon,
                      size: 30,
                      color: const Color(0xFF888888),
                    ),
                  ),
                ),
                Text(
                  businessTypeName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: isCardActive ? EdgeInsets.all(3) : null,
              decoration: isCardActive
                  ? BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    )
                  : null,
              child: Icon(
                isCardActive ? Icons.check : null,
                size: 11,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
