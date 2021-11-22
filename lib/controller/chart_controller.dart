import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:track/models/artist_model.dart';
import 'package:track/models/track_model.dart';

class ChartController extends GetxController {
  List<TrackModel> topTracks = <TrackModel>[].obs;
  List<ArtistModel> topArtist = <ArtistModel>[].obs;

  fetchChartData() async {
    // Fetch Top Tracks
    var topTrackResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var tracks = json.decode(topTrackResponse.body)['tracks']['track'];
    tracks.forEach((track) {
      topTracks.add(TrackModel.fromMap(track));
    });

    // Fetch Top Artists
    var topArtistResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var artists = json.decode(topArtistResponse.body)['artists']['artist'];
    artists.forEach((artist) {
      topArtist.add(ArtistModel.fromMap(artist));
    });

    update();
  }
}
