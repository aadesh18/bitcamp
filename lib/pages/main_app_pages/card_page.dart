import 'package:bitcamp/data/property.dart';
import 'package:bitcamp/pages/main_app_pages/components/information_card.dart';
import 'package:bitcamp/pages/main_app_pages/potential_investment_page.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final String groupName;
  final int total;
  List<String> namesList;
  List<int> percentageList;
  final List<RecProperty> recProps;
  CardPage(
      {super.key,
      required this.groupName,
      required this.total,
      required this.recProps,
      required this.namesList,
      required this.percentageList});

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
        title: Text(
          "  $groupName",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 23,
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
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "\$$total",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Current Property Details: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              InformationCard(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowInformation(
                    false,
                    field: "Address: ",
                    data: propertyList[0].location.substring(
                        0, propertyList[0].location.indexOf("Washington") - 2),
                  ),
                  RowInformation(false,
                      field: "State: ", data: "Washington D.C."),
                  RowInformation(false,
                      field: "Bedrooms: ", data: propertyList[1].bed),
                  RowInformation(false,
                      field: "Bathrooms: ", data: propertyList[0].bath),
                  RowInformation(false,
                      field: "Square feet: ", data: propertyList[0].sqft),
                  RowInformation(false,
                      field: "Price: ", data: propertyList[0].price)
                ],
              )),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Potential Investing Options: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: informationCardColor,
                    borderRadius: BorderRadius.circular(30)),
                height: 184,
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: recProps.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                      tileColor: informationCardColor,
                      title: Text(
                        recProps[position].location.substring(0, 15),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$${recProps[position].price}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 15),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PotentialInvestmentPage(
                              recProperty: recProps[position],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Stakeholders: ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              InformationCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                          namesList.length,
                          (index) => RowInformation(true,
                              field: "${index + 1}. ${namesList[index]}",
                              data: "${percentageList[index]} %"))))
            ],
          ),
        ),
      )),
    );
  }
}

class RowInformation extends StatelessWidget {
  final String field;
  final String data;
  bool space = false;
  RowInformation(
    this.space, {
    super.key,
    required this.field,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: [
          Text(
            field,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          space ? const Spacer() : const SizedBox(),
          Text(
            data,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
