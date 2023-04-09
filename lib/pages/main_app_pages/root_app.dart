import 'package:bitcamp/data/property.dart';
import 'package:bitcamp/pages/main_app_pages/home_page.dart';
import 'package:bitcamp/pages/main_app_pages/join_group_page.dart';
import 'package:bitcamp/pages/main_app_pages/settings_page.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootApp extends StatefulWidget {
  RootApp({
    super.key,
  });

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    for (List i in rawPropList) {
      propertyList.add(Property(
          id: i[0],
          img: i[1],
          price: i[2],
          bed: i[3],
          bath: i[4],
          sqft: i[5],
          location: i[6]));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: IndexedStack(
        index: currIndex,
        children: const [HomePage(), JoinGroupPage(), SettingsPage()],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 8, right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: backgroundColor),
        child: SalomonBottomBar(
          currentIndex: currIndex,
          onTap: (i) => setState(() => currIndex = i),
          items: [
            /// Map
            SalomonBottomBarItem(
              icon: Icon(
                appIcon,
                color: Colors.black,
              ),
              title: const Text("Home"),
              selectedColor: Colors.black,
            ),

            /// Annoucements
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_3_outlined),
              title: const Text("Group"),
              selectedColor: Colors.black,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text("Settings"),
              selectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
