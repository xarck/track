import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/library_controller.dart';
import 'package:track/utils/basic.dart';
import 'package:track/utils/dimension.dart';

class TrackView extends StatefulWidget {
  const TrackView({Key? key}) : super(key: key);

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  final LibraryController libraryController = Get.find<LibraryController>();
  @override
  Widget build(BuildContext context) {
    List items = libraryController.topTracks;

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
                      Text(
                        '#${index + 1} ',
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: getSize(context).width / 1.8,
                        child: Column(
                          children: [
                            title(
                              text: '${items[index].name}',
                              limit: 20,
                            ),
                            title(
                              text: "${items[index].artist.name}",
                            ),
                          ],
                        ),
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
