import 'package:flutter/material.dart';
 // Import the bottom sheet content

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD2302C),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Weeknd",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Community · +11K Members",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ],
            ),
            const Icon(
              Icons.share,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
