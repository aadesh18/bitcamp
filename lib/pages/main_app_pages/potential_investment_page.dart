import 'package:bitcamp/data/property.dart';
import 'package:bitcamp/data/recProperty.dart';
import 'package:bitcamp/pages/main_app_pages/card_page.dart';
import 'package:bitcamp/pages/main_app_pages/components/information_card.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PotentialInvestmentPage extends StatelessWidget {
  RecProperty recProperty;
  PotentialInvestmentPage({super.key, required this.recProperty});

  @override
  Widget build(BuildContext context) {
    Widget getAppbar() {
      return AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 32,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Potential Investment",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: getAppbar(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(recProperty.img),
                      ),
                    )
                    //
                    )),
            InformationCard(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowInformation(
                  false,
                  field: "Address: ",
                  data: recProperty.location.substring(
                      0, recProperty.location.indexOf("Washington") - 2),
                ),
                RowInformation(false,
                    field: "State: ", data: "Washington D.C."),
                RowInformation(false,
                    field: "Bedrooms: ", data: recProperty.bed),
                RowInformation(false,
                    field: "Bathrooms: ", data: recProperty.bath),
                RowInformation(false,
                    field: "Square feet: ", data: recProperty.sqft),
                RowInformation(false,
                    field: "Price: ", data: "\$${recProperty.price}")
              ],
            )),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              height: 180,
              width: screenWidth! - 30,
              decoration: BoxDecoration(
                color: informationCardColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Analysis: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RowInformation(true,
                      field: "Break-Even Point: ",
                      data: "${recProperty.breakEven} Years"),
                  const SizedBox(
                    height: 10,
                  ),
                  RowInformation(true,
                      field: "Percentage Increase: ",
                      data:
                          "${double.parse(recProperty.perInc).toStringAsFixed(2)} %"),
                  const SizedBox(
                    height: 10,
                  ),
                  RowInformation(true,
                      field: "Rental Income: ",
                      data: "\$${recProperty.rent.toString()}"),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
