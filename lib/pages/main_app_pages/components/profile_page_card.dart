import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';

class ProfilePageCard extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const ProfilePageCard(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenHeight! / 16,
        width: screenWidth! / 1.2,
        decoration: BoxDecoration(
            color: informationCardColor,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
