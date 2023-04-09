import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bitcamp/pages/introduction_pages/onboarding_screen.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Setting the constants present in the constants file for the screen size
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Column(
        children: const [
          Text("Shared Spaces",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          SizedBox(
            height: 10,
          ),
          Text("Real estate made social")
        ],
      ),
      backgroundColor: backgroundColor,
      nextScreen: const OnBoardingScreen(),
    );
  }
}
