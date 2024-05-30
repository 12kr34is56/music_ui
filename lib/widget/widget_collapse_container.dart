import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_ui/widget/widget_bottom_sheet.dart';

class WidgetCollapseContainer extends StatelessWidget {
  const WidgetCollapseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFD2302C),
      child: Padding(
        padding: const EdgeInsets.only(left: 65.0, right: 10, top: 5,bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "images/weekend_image.jpeg",
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "The Weeknd",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      "Community · +11K Members",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                showBottomSheet(context: context, builder: (context) => WidgetBottomSheetContent());
              },
              child: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
