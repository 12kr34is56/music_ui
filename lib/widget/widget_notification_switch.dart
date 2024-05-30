import 'package:flutter/material.dart';

class WidgetNotificationSwitch extends StatefulWidget {
  @override
  _WidgetNotificationSwitchState createState() => _WidgetNotificationSwitchState();
}

class _WidgetNotificationSwitchState extends State<WidgetNotificationSwitch> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Mute notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        Switch(
          value: _isSwitched,
          onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
          },
          activeColor: Colors.red,
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey[300],

        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Notification Switch")),
      body: Center(child: WidgetNotificationSwitch()),
    ),
  ));
}
