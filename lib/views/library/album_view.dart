import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/home_controller.dart';

class AlbumView extends StatefulWidget {
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    List items = homeController.topAlbums;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  '#${index + 1} ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${items[index].name}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${items[index].artist.name}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
