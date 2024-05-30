import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetFeature extends StatelessWidget {
  const WidgetFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0,bottom: 10),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.delete,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Clear chat",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.0,bottom: 10),
          child: Row(
            children: [
              Icon(
                CupertinoIcons.lock,
                color: Colors.black,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Encryption",
                style: TextStyle(color: Colors.black,fontSize: 17),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.0,bottom: 10),
          child: Row(
            children: [
              Icon(
                Icons.exit_to_app,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Exit community",
                style: TextStyle(color: Colors.red,fontSize: 17),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.0,bottom: 10),
          child: Row(
            children: [
              Icon(
                Icons.thumb_down_alt_outlined,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Report",
                style: TextStyle(color: Colors.red,fontSize: 17),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
