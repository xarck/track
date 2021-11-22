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

    //Retrieving Tracks
    var tracks = json.decode(trackResponse.body)['toptracks']['track'];
    tracks.forEach((track) {
      topTracks.add(TrackModel.fromMap(track));
    });

    //Retrieving Albums
    var albums = json.decode(albumResponse.body)['topalbums']['album'];
    albums.forEach((album) {
      topAlbums.add(AlbumModel.fromMap(album));
    });

    // Retrieving Artists
    var artists = json.decode(artistResponse.body)['topartists']['artist'];
    artists.forEach((artist) {
      topArtists.add(ArtistModel.fromMap(artist));
    });
  }
}
