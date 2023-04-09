import 'dart:ui';

import 'package:bitcamp/animated_btn.dart';
import 'package:bitcamp/data/property.dart';
import 'package:bitcamp/data/data.dart';
import 'package:bitcamp/pages/introduction_pages/sign_in_form.dart';
import 'package:bitcamp/theme/asset_location.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool success = false;

  bool onLastPage = false;

  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation("active", autoplay: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: screenWidth! * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset(backgroundSpline),
          ),
          Positioned(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10))),
          RiveAnimation.asset(riveAnimation),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30,
              sigmaY: 30,
            ),
            child: const SizedBox(),
          )),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 260,
                    child: Text("Shared Spaces",
                        style: GoogleFonts.poppins(
                            fontSize: 60,
                            height: 1.2,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                      "Shared Spaces is an innovative platform designed to foster communal engagement and cooperation, with the goal of mitigating the need for individual investment in the realm of real estate."),
                  const Spacer(
                    flex: 2,
                  ),
                  AnimatedBtn(
                    btnAnimationController: _btnAnimationController,
                    press: () async {
                      try {
                        final responsePot1 = await http.get(
                          Uri.parse('http://192.168.38.240:5000/pot1/'),
                        );
                        final responsePot2 = await http.get(
                          Uri.parse('http://192.168.38.240:5000/pot2/'),
                        );
                        final responseGroup1 = await http.get(
                          Uri.parse('http://192.168.38.240:5000/group1_rec/'),
                        );
                        final responseGroup2 = await http.get(
                          Uri.parse('http://192.168.38.240:5000/group2_rec/'),
                        );

                        if (responsePot1.statusCode == 200) {
                          List<String> nameList = [];
                          List<int> priceList = [];
                          jsonDecode(responsePot1.body)["pot1"]
                              .forEach((key, value) {
                            nameList.add(key.toString());
                            priceList.add(int.parse(value.toString()));
                          });
                          pot1 = Pot(
                              nameList: nameList,
                              priceList: priceList,
                              total: jsonDecode(responsePot1.body)["pot1"]
                                  ["total"]);
                        }
                        if (responsePot2.statusCode == 200) {
                          List<String> nameList = [];
                          List<int> priceList = [];
                          jsonDecode(responsePot2.body)["pot2"]
                              .forEach((key, value) {
                            nameList.add(key.toString());
                            priceList.add(int.parse(value.toString()));
                          });
                          pot2 = Pot(
                              nameList: nameList,
                              priceList: priceList,
                              total: jsonDecode(responsePot2.body)["pot2"]
                                  ["total"]);
                        }
                        if (responseGroup1.statusCode == 200) {
                          jsonDecode(responseGroup1.body)["key"]
                              .forEach((key, value) {
                            group1Rec.add(RecProperty(
                                breakEven: value['break_even_time'].toString(),
                                perInc: value['percentage_increase'].toString(),
                                rent: value['rental_income'].toString(),
                                id: key.toString(),
                                img: value['image_link'].toString(),
                                price: value['price'].toString(),
                                bed: value['beds'].toString(),
                                bath: value['baths'].toString(),
                                sqft: value['area'].toString(),
                                location: value['address'].toString()));
                          });
                        }
                        if (responseGroup2.statusCode == 200) {
                          jsonDecode(responseGroup2.body)["key"]
                              .forEach((key, value) {
                            group2Rec.add(RecProperty(
                                breakEven: value['break_even_time'].toString(),
                                perInc: value['percentage_increase'].toString(),
                                rent: value['rental_income'].toString(),
                                id: key.toString(),
                                img: value['image_link'].toString(),
                                price: value['price'].toString(),
                                bed: value['beds'].toString(),
                                bath: value['baths'].toString(),
                                sqft: value['area'].toString(),
                                location: value['address'].toString()));
                          });
                        }
                      } catch (e) {
                        print(e);
                      }

                      _btnAnimationController.isActive = true;
                      showGeneralDialog(
                          barrierDismissible: true,
                          barrierLabel: "Sign In",
                          context: context,
                          pageBuilder: (context, _, __) => Container(
                                height: 700,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 64),
                                decoration: const BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                child: Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Column(
                                    children: [
                                      Text(
                                        "Sign in",
                                        style: GoogleFonts.poppins(
                                            fontSize: 34,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.0, horizontal: 8),
                                        child: Text(
                                          "Sign in and begin your real estate investing journey!",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SignInForm()
                                    ],
                                  ),
                                ),
                              ));
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
