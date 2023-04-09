import 'package:bitcamp/pages/main_app_pages/components/group_card.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              children: [
                Icon(
                  appIcon,
                  color: Colors.black,
                ),
                const Text(
                  " Shared Spaces",
                  style: TextStyle(color: Colors.black),
                )
              ],
            )),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            PostCard(
              title: "College Park Rangers",
              profit: true,
              names: pot1.nameList,
              prices: pot1.priceList,
              recProps: group1Rec,
              total: pot1.total,
            ),
            PostCard(
              title: "Smith Family",
              profit: false,
              names: pot2.nameList,
              prices: pot2.priceList,
              recProps: group2Rec,
              total: pot2.total,
            ),
            PostCard(
              title: "Guitar Rockers",
              profit: true,
              names: pot1.nameList,
              prices: pot1.priceList,
              recProps: group1Rec,
              total: pot1.total,
            ),
            PostCard(
              title: "Easton Buddies",
              profit: true,
              names: pot2.nameList,
              prices: pot2.priceList,
              recProps: group2Rec,
              total: pot2.total,
            ),
          ],
        ),
      )),
    );
  }
}
