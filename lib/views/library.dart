import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track/controller/library_controller.dart';
import 'package:track/views/library/album_view.dart';
import 'package:track/views/library/artist_view.dart';
import 'package:track/views/library/track_view.dart';

class Library extends StatefulWidget {
  Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
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
              TrackView(),
              AlbumView(),
              ArtistView(),
            ],
          ),
        ),
      ),
    );
  }
}
