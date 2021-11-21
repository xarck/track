import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:track/controller/home_controller.dart';

class TopLibrary extends StatefulWidget {
  String? type;
  String? data;
  TopLibrary({Key? key, type, data}) : super(key: key);

  @override
  _TopLibraryState createState() => _TopLibraryState();
}

class _TopLibraryState extends State<TopLibrary> {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (homeController) {
        print(homeController.topTracks);
        return Container(
          child: homeController.topTracks.isNotEmpty
              ? Text("Day")
              : Text(
                  "Hey",
                ),
        );
      },
    );
  }
}
