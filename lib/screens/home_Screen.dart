import 'package:flutter/material.dart';
import 'package:music_ui/widget/widget_feature.dart';
import 'package:music_ui/widget/widget_horizontal_image_bar.dart';
import 'package:music_ui/widget/widget_horizontal_list_bar.dart';
import 'package:music_ui/widget/widget_notification_switch.dart';
import 'package:music_ui/widget/widget_people_search_screen.dart';
import '../widget/widget_collapse_container.dart';
import '../widget/widget_container.dart';
import '../widget/widget_expanded_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 270.0,
              collapsedHeight: 70.0,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 36,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    title: top < 100.0 ? const WidgetCollapseContainer() : null,
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          'images/weekend_image.jpeg',
                          fit: BoxFit.cover,
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: WidgetContainer(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const WidgetExpandableText(
                          maxLines: 3,
                        ),
                        const SizedBox(height: 15),
                        const WidgetHorizontalListBar(),
                        const SizedBox(height: 35),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Media, docs and links",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 28,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const WidgetHorizontalImageBar(),
                        const SizedBox(height: 10),
                        WidgetNotificationSwitch(),
                        const SizedBox(height: 10),
                        const WidgetFeature(),
                        const SizedBox(
                          height: 10,
                        ),
                        const WidgetPeopleSearchScreen()
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
