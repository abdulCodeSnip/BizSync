import 'package:flutter/material.dart';

// Parent component
class ThirdOnboarding extends StatelessWidget {
  const ThirdOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7EFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Schedule",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Poppins",
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.blue,
                            size: 25,
                          ),
                        ],
                      ),

                      // Custom cards that are placed inside the container to featurer UI
                      MessageCardForOnboarding(
                        isCardBlue: false,
                        cardIcon: Icons.cut,
                        cardTitle: "Haircut with Jane",
                      ),
                      MessageCardForOnboarding(
                        isCardBlue: false,
                        cardIcon: Icons.eco,
                        cardTitle: "Massage with Tom",
                      ),
                      MessageCardForOnboarding(
                        isCardBlue: true,
                        cardIcon: Icons.group,
                        cardTitle: "Meeting with John",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Text at the bottom of the screen
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  spacing: 10,
                  children: [
                    const Text(
                      "Manage All Your Services",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Keep track of services, timings, and customer bookings in one place",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Child Component
class MessageCardForOnboarding extends StatelessWidget {
  final bool isCardBlue;
  final String cardTitle;
  final dynamic cardIcon;
  const MessageCardForOnboarding({
    super.key,
    required this.isCardBlue,
    required this.cardTitle,
    required this.cardIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isCardBlue ? const Color(0xFFD3EBFF) : const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          width: isCardBlue ? 2 : 0,
          color: isCardBlue ? Colors.blue : Colors.grey,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        spacing: 4,
        children: [
          Icon(cardIcon, color: Colors.blue, size: 20),
          Text(
            cardTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isCardBlue ? FontWeight.w600 : FontWeight.w500,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
