import 'package:bitcamp/data/property.dart';
import 'package:bitcamp/pages/main_app_pages/card_page.dart';
import 'package:bitcamp/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class PostCard extends StatefulWidget {
  final String title;
  final bool profit;
  final List<String> names;
  final List<int> prices;
  final List<RecProperty> recProps;
  final int total;
  const PostCard({
    super.key,
    required this.title,
    required this.profit,
    required this.names,
    required this.prices,
    required this.recProps,
    required this.total,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late List<OwnerShipData> _chartData;
  late TooltipBehavior _toolTipBehaviour;

  List<OwnerShipData> getChartData() {
    List<OwnerShipData> chartData = [];
    for (int i = 0; i < widget.names.length; i++) {
      chartData.add(OwnerShipData(widget.names[i], widget.prices[i]));
    }
    return chartData;
  }

  final randomBoolean = Random().nextBool();

  @override
  void initState() {
    _chartData = getChartData();
    _toolTipBehaviour = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height / 2.9,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: const Offset(0, 1))
            ], borderRadius: BorderRadius.circular(20)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardPage(
                            groupName: widget.title,
                            recProps: widget.recProps,
                            total: widget.total,
                            percentageList: widget.prices,
                            namesList: widget.names,
                          )));
            },
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: MediaQuery.of(context).size.height / 2.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: informationCardColor),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 8, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 24),
                            ),
                            widget.profit
                                ? Icon(
                                    CupertinoIcons.arrow_up_circle_fill,
                                    color: Colors.green,
                                    size: 35,
                                  )
                                : const Icon(
                                    CupertinoIcons.arrow_down_circle_fill,
                                    color: Colors.red,
                                    size: 35,
                                  )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 230,
                              width: screenWidth! - 100,
                              child: SfCircularChart(
                                legend: Legend(
                                    isVisible: true,
                                    overflowMode: LegendItemOverflowMode.wrap),
                                tooltipBehavior: _toolTipBehaviour,
                                series: <CircularSeries>[
                                  DoughnutSeries<OwnerShipData, String>(
                                      dataSource: _chartData,
                                      xValueMapper: (OwnerShipData data, _) =>
                                          data.name,
                                      yValueMapper: (OwnerShipData data, _) =>
                                          data.percentage,
                                      dataLabelSettings:
                                          const DataLabelSettings(
                                              isVisible: true),
                                      enableTooltip: true)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class OwnerShipData {
  final String name;
  final int percentage;
  OwnerShipData(this.name, this.percentage);
}
