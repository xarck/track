import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:track/models/album_model.dart';
import 'package:track/models/artist_model.dart';
import 'package:track/models/track_model.dart';

class HomeController extends GetxController {
  var topTracks;
  var topAlbums = ''.obs;
  var topArtists = ''.obs;
  void fetchUserdata(username) async {
    var artistUrl = Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopartists&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json');
    var albumUrl = Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettopalbums&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json');
    var trackUrl = Uri.parse(
        'http://ws.audioscrobbler.com/2.0/?method=user.gettoptracks&user=$username&api_key=36b538790ba372126b3fc9447f1120c3&format=json');
    var artistResponse = await http.get(artistUrl);
    var albumResponse = await http.get(albumUrl);
    var trackResponse = await http.get(trackUrl);
    topTracks = TopTracks.fromJson(
        json.encode(json.decode(trackResponse.body)['toptracks']));
    print(topTracks);
  }
}
