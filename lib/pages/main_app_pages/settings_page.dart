import 'package:bitcamp/pages/main_app_pages/components/profile_page_card.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
            title: Row(
              children: const [
                Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 80,
              ),
              ProfilePageCard(
                  title: "Upgrade to Share Spaces Premium", onPressed: () {}),
              const SizedBox(
                height: 40,
              ),
              ProfilePageCard(title: "Leave a review", onPressed: () {}),
              const SizedBox(
                height: 40,
              ),
              ProfilePageCard(title: "Get Help", onPressed: () {}),
              const SizedBox(
                height: 40,
              ),
              ProfilePageCard(title: "About Us", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
