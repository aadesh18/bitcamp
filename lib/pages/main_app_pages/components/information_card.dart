import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final Widget child;
  const InformationCard({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        height: 200,
        width: screenWidth! - 30,
        decoration: BoxDecoration(
          color: informationCardColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: child);
  }
}
