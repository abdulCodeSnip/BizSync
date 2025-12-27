import 'package:flutter/material.dart';

class NotificationCardForOnboarding extends StatelessWidget {
  final bool isCardBlue;
  const NotificationCardForOnboarding({super.key, required this.isCardBlue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isCardBlue ? const Color(0xFFC9DDFF) : const Color(0xFFE6E6E6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 33,
            height: 33,
            decoration: BoxDecoration(
              color: isCardBlue
                  ? const Color(0xFFA2C4FF)
                  : const Color(0xFFBCBCBC),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Expanded(
            child: Container(
              height: 13,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: isCardBlue
                    ? const Color(0xFFA2C4FF)
                    : const Color(0xFFBCBCBC),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
