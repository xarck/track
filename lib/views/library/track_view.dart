import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/library_controller.dart';

class TrackView extends StatefulWidget {
  const TrackView({Key? key}) : super(key: key);

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    List items = homeController.topTracks;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListTile(
              title: Row(
                children: [
                  Text(
                    '#${index + 1} ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 20),
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
                  ),
                  Spacer(),
                  Text(items[index].playcount),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
