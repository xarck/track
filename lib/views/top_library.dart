import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Container(
      child: Text("Hello world"),
    );
  }
}
