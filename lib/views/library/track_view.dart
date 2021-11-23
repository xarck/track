import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:track/controller/library_controller.dart';
import 'package:track/widgets/widget.dart';
import 'package:track/utils/dimension.dart';

class TrackView extends StatefulWidget {
  const TrackView({Key? key}) : super(key: key);

  @override
  _TrackViewState createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  final LibraryController libraryController = Get.find<LibraryController>();
  bool defaultSet = true;
  @override
  Widget build(BuildContext context) {
    List items = defaultSet
        ? libraryController.topTracks
        : libraryController.weeklyTracks;

    return items.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
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
            ],
          );
  }
}
