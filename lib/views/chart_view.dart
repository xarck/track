import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track/controller/chart_controller.dart';

class ChartView extends StatefulWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  final chartController = Get.put(ChartController());
  List items = [];
  bool defaultSet = true;
  @override
  void initState() {
    super.initState();
    chartController.fetchChartData();
    items = chartController.topTracks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Charts"),
            Spacer(),
            Text(
              defaultSet ? "Tracks" : "Artists",
            )
          ],
        ),
      ),
      body: GetBuilder<ChartController>(
        builder: (chartController) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text("#${index + 1}  ${items[index].name}"));
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          items = chartController.topTracks;
                          defaultSet = true;
                          setState(() {});
                        },
                        child: Text(
                          "Tracks",
                          style: TextStyle(
                            color: defaultSet ? Colors.red : Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          items = chartController.topArtist;
                          defaultSet = false;
                          setState(() {});
                        },
                        child: Text(
                          "Artists",
                          style: TextStyle(
                            color: defaultSet ? Colors.white : Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
