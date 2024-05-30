import 'package:flutter/material.dart';

class WidgetHorizontalImageBar extends StatelessWidget {
  const WidgetHorizontalImageBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'images/weekend_image.jpeg',
                  fit: BoxFit.cover,
                  width: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
