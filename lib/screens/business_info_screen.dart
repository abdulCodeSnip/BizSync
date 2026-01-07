import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_automation/components/WeeklyWorkingHourSchedule.dart';
import 'package:whatsapp_automation/utils/AppColors.dart';
import "../states/application_state.dart";
class BusinessInfoScreen extends StatelessWidget {
  const BusinessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
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
              ],
            ),
          ),
          SizedBox(height: 20),
          // input for getting the business name from the user using "TextField" widget
          TextField(
            decoration: InputDecoration(
              labelText: "Business Name",
              hintText: "Business Name",
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
          BusinessTypeCards(),

          // Get the working hours from the Business using different presets
          WeeklyWorkingHourSchedule(),
        ],
      ),
    );
  }
}

// business type card icon that can be clicked and the type of business would be selected e.g "clinic", "restaurant", "salon"
class BusinessTypeCards extends StatelessWidget {
  BusinessTypeCards({super.key});

  final List<Map<String, dynamic>> businessCardsList = [
    {"_id": 1, "card_text": "Clinic", "card_icon": Icons.local_hospital},
    {"_id": 2, "card_text": "Restaurant", "card_icon": Icons.restaurant},
    {"_id": 3, "card_text": "Salon", "card_icon": Icons.content_cut},
    {"_id": 4, "card_text": "Institute", "card_icon": Icons.school},
    {"_id": 5, "card_text": "Others", "card_icon": Icons.category},
  ];

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<ApplicationState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Select your business type",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              color: Appcolors.headingTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: businessCardsList.map((businessCard) {
                bool isCardClicked =
                    businessCard["card_text"].toString().toLowerCase() ==
                    appState.business_type.toString().toLowerCase();

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 110),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      side: BorderSide(
                        width: 1,
                        color: isCardClicked
                            ? Appcolors.iconsAndBtnsColor
                            : const Color.fromARGB(255, 207, 207, 207),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      appState.setBusinessType(
                        businessCard["card_text"].toString(),
                      );
                    },
                    child: Stack(
                      children: [
                        /// Card content, with type of business and an Icon in the center
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                businessCard["card_icon"],
                                size: 30,
                                color: isCardClicked
                                    ? Appcolors.iconsAndBtnsColor
                                    : const Color(0xFF797979),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                businessCard["card_text"],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: "Poppins",
                                  fontWeight: isCardClicked
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                  color: isCardClicked
                                      ? Appcolors.headingTextColor
                                      : Appcolors.bodyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// ✔ Tick icon, if the card has been clicked
                        if (isCardClicked)
                          const Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.check_circle,
                              size: 18,
                              color: Appcolors.iconsAndBtnsColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

/*
    Custom Dropdown for getting business working hours from the user
     1. Will include pre-default presets
     2. Custom Working hours to get starting and ending time of business during the day
     3. Custom Days Selector to select days from Monday to Sunday.
     4. Allowing user to include break time as well "break => starting time => ending time"
*/
