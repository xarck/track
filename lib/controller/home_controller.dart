import 'package:get/get.dart';
import 'package:track/models/track_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  List<TrackModel> recentTracks = <TrackModel>[].obs;
  fetchRecentTracks(username) async {
    var recentTrackResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var tracks = json.decode(recentTrackResponse.body)['toptracks']['track'];
    tracks.forEach((track) {
      recentTracks.add(TrackModel.fromMap(track));
    });
    update();
  }
}
