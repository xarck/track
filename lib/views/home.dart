import 'package:flutter/material.dart';
import 'package:getxfire/getxfire.dart';
import 'package:track/controller/home_controller.dart';
import 'package:track/views/top_library.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final homeController = Get.put(HomeController());
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    homeController.fetchUserdata('iamashking123');
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Library"),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: "Tracks"),
              Tab(text: "Albums"),
              Tab(text: "Artists")
            ],
          ),
        ),
        body: GetBuilder<HomeController>(
          builder: (homeController) => TabBarView(
            controller: _tabController,
            children: [
              TopLibrary(type: "Tracks", data: homeController.topTracks),
              TopLibrary(type: "Albums", data: homeController.topAlbums),
              TopLibrary(type: "Artists", data: homeController.topArtists),
            ],
          ),
        ),
      ),
    );
  }
}
