import 'package:bitcamp/pages/introduction_pages/splash_page.dart';
import 'package:bitcamp/pages/main_app_pages/root_app.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply();
    return MaterialApp(
      // To-do - Add Permitted orientations
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.montserratSubrayadaTextTheme(textTheme).apply(
              bodyColor: Colors.black,
              fontFamily:
                  GoogleFonts.montserrat(color: Colors.black).fontFamily)),
      home: const SplashPage(),
    );
  }
}
