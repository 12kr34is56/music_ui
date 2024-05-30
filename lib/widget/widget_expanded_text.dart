import 'package:flutter/material.dart';

class WidgetExpandableText extends StatefulWidget {

  final int maxLines;

  const WidgetExpandableText({Key? key,  this.maxLines = 3})
      : super(key: key);

  @override
  _WidgetExpandableTextState createState() => _WidgetExpandableTextState();
}

class _WidgetExpandableTextState extends State<WidgetExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          maxLines: isExpanded ? null : widget.maxLines,
          overflow: TextOverflow.fade,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "Read Less" : "Read More",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
