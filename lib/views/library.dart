import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track/controller/library_controller.dart';
import 'package:track/views/library/album_view.dart';
import 'package:track/views/library/artist_view.dart';
import 'package:track/views/library/track_view.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  final libraryController = Get.put(LibraryController());
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    libraryController.fetchUserdata('iamashking123');
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Library"),
          actions: [
            IconButton(
              onPressed: () {
                libraryController.fetchUserdata('iamashking123');
              },
              icon: Icon(Icons.refresh),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "Tracks"),
              Tab(text: "Albums"),
              Tab(text: "Artists")
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            TrackView(),
            AlbumView(),
            ArtistView(),
          ],
        ),
      ),
    );
  }
}
