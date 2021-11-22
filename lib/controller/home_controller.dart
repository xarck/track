import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:track/models/album_model.dart';
import 'package:track/models/artist_model.dart';
import 'package:track/models/track_model.dart';

class HomeController extends GetxController {
  List<TrackModel> topTracks = <TrackModel>[].obs;
  List<AlbumModel> topAlbums = <AlbumModel>[].obs;
  List<ArtistModel> topArtists = <ArtistModel>[].obs;
  void fetchUserdata(username) async {
    var artistResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var albumResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var trackResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    print(json.decode(trackResponse.body)['toptracks']['track']);
    json.decode(trackResponse.body)['toptracks']['track'].map((track) {
      topTracks.add(TrackModel.fromMap(track));
      print('2');
    });
    print(topTracks.length);
  }
}
