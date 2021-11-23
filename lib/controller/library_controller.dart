import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:track/models/album_model.dart';
import 'package:track/models/artist_model.dart';
import 'package:track/models/track_model.dart';

class LibraryController extends GetxController {
  List<TrackModel> topTracks = <TrackModel>[].obs;
  List<AlbumModel> topAlbums = <AlbumModel>[].obs;
  List<ArtistModel> topArtists = <ArtistModel>[].obs;

  // Weekly Chart Data
  List<TrackModel> weeklyTracks = <TrackModel>[].obs;
  List<AlbumModel> weeklyAlbums = <AlbumModel>[].obs;
  List<ArtistModel> weeklyArtists = <ArtistModel>[].obs;

  // Home Data Members
  List<TrackModel> recentTracks = <TrackModel>[].obs;

  void fetchUserdata(username) async {
    var artistResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var albumResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var trackResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));

    topAlbums = [];
    topTracks = [];
    topArtists = [];

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
    update();
  }

  // Weekly Data
  void fetchUserWeeklydata(username) async {
    var artistResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.getweeklyartistchart&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var albumResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.getweeklyalbumchart&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    var trackResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.getweeklytrackchart&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));

    weeklyAlbums = [];
    weeklyTracks = [];
    weeklyArtists = [];

    //Retrieving Tracks
    var tracks = json.decode(trackResponse.body)['weeklytrackchart']['track'];
    tracks.forEach((track) {
      weeklyTracks.add(TrackModel.fromMap(track));
    });

    //Retrieving Albums
    var albums = json.decode(albumResponse.body)['weeklyalbumchart']['album'];
    albums.forEach((album) {
      weeklyAlbums.add(AlbumModel.fromMap(album));
    });

    // Retrieving Artists
    var artists =
        json.decode(artistResponse.body)['weeklyartistchart']['artist'];
    artists.forEach((artist) {
      weeklyArtists.add(ArtistModel.fromMap(artist));
    });
    update();
  }

  // Home Member Functions
  fetchRecentTracks(username) async {
    var recentTrackResponse = await http.get(Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json'));
    recentTracks = [];
    var tracks = json.decode(recentTrackResponse.body)['recenttracks']['track'];
    tracks.forEach((track) {
      recentTracks.add(TrackModel.fromMap(track));
    });
    update();
  }
}
