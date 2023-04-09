import 'package:bitcamp/pages/main_app_pages/components/top_card.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/material.dart';

class JoinGroupPage extends StatelessWidget {
  const JoinGroupPage({super.key});

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
                  Icons.account_circle_outlined,
                  size: 30,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 500,
                  width: screenWidth! - 40,
                  decoration: BoxDecoration(
                    color: informationCardColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TopNeuCard(
                    balance: "1983.23",
                    income: "2342",
                    expense: "3432",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(backgroundColor)),
                    onPressed: () {},
                    child: Container(
                      height: 70,
                      width: screenWidth! - 10,
                      decoration: BoxDecoration(
                          color: informationCardColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const Text(
                            "  Connected with Capital One Account ",
                            style: TextStyle(color: Colors.black),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.check_sharp,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
