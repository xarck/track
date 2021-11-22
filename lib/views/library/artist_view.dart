import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/library_controller.dart';

class ArtistView extends StatefulWidget {
  const ArtistView({Key? key}) : super(key: key);

  @override
  _ArtistViewState createState() => _ArtistViewState();
}

class _ArtistViewState extends State<ArtistView> {
  final LibraryController libraryController = Get.find<LibraryController>();
  @override
  Widget build(BuildContext context) {
    List items = libraryController.topArtists;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListTile(
              title: Text(
                '#${index + 1} ${items[index].name}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
