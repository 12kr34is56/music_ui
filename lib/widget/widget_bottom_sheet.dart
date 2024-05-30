import 'package:flutter/material.dart';

class WidgetBottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        const Divider(
          color: Colors.grey,
          thickness: 3,
          indent: 120,
          endIndent: 120,
        ),
        ListTile(
          leading: const Icon(Icons.link),
          title: const Text('Invite Member'),
          onTap: () {
            // Handle invite member action
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_add_alt_1_outlined),
          title: const Text('Add Member'),
          onTap: () {
            // Handle add member action
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.group_add_outlined),
          title: const Text('Group'),
          onTap: () {
            // Handle group action
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
