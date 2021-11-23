import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/library_controller.dart';
import 'package:track/utils/basic.dart';

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

    return items.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Row(
                    children: [
                      title(
                        text: '#${index + 1}   ${items[index].name}',
                      ),
                      Spacer(),
                      Text(items[index].playcount),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
