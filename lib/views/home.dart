import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track/controller/library_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final libraryController = Get.put(LibraryController());
  @override
  void initState() {
    super.initState();
    libraryController.fetchRecentTracks('iamashking123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: GetBuilder<LibraryController>(
        builder: (libraryController) {
          List recentTracks = libraryController.recentTracks;
          return ListView.builder(
            itemCount: recentTracks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(recentTracks[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
