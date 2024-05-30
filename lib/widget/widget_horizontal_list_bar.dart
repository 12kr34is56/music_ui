import 'package:flutter/material.dart';

class WidgetHorizontalListBar extends StatefulWidget {
  const WidgetHorizontalListBar({Key? key}) : super(key: key);

  @override
  _WidgetHorizontalListBarState createState() => _WidgetHorizontalListBarState();
}

class _WidgetHorizontalListBarState extends State<WidgetHorizontalListBar> {
  bool showAll = false;
  List<GlobalKey> keys = List.generate(10, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {}); // Trigger a rebuild to calculate item widths
    });
  }

  double calculateTotalWidth() {
    double width = 0;
    for (var key in keys) {
      final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        width += renderBox.size.width + 4.5; // Adding margin width
      }
    }
    return width;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemCount = 10;
    final items = List.generate(itemCount, (index) => index);
    final totalWidth = calculateTotalWidth();

    final itemsToShow = (screenWidth / 74.5).floor();
    final remainingItems = itemCount - itemsToShow;

    return SizedBox(
      height: 25,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: showAll ? itemCount : (remainingItems > 0 ? itemsToShow : itemCount),
              itemBuilder: (BuildContext context, int index) {
                if (!showAll && remainingItems > 0 && index == itemsToShow - 1) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        showAll = true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 4.5),
                      width: 70,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '+$remainingItems',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return Container(
                  key: keys[index],
                  margin: const EdgeInsets.only(right: 4.5),
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Outdoor',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
