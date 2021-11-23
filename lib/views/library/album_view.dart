import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/library_controller.dart';
import 'package:track/widgets/widget.dart';
import 'package:track/utils/dimension.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({Key? key}) : super(key: key);
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  final LibraryController libraryController = Get.find<LibraryController>();
  bool defaultSet = true;
  @override
  Widget build(BuildContext context) {
    List items = defaultSet
        ? libraryController.topAlbums
        : libraryController.weeklyAlbums;

    return items.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Stack(children: [
            Container(
              margin: EdgeInsets.only(bottom: 28),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            '#${index + 1} ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: getSize(context).width / 1.8,
                            child: Column(
                              children: [
                                title(
                                  text: '${items[index].name}',
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
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        defaultSet = false;
                        setState(() {});
                      },
                      child: Text(
                        "Weekly",
                        style: TextStyle(
                          color: defaultSet ? Colors.white : Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        defaultSet = true;
                        setState(() {});
                      },
                      child: Text(
                        "All Time",
                        style: TextStyle(
                          color: defaultSet ? Colors.red : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]);
  }
}
