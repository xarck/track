import 'package:track/models/artist_model.dart';

class TrackModel {
  final String image;
  final String name;
  final ArtistModel artist;
  final String url;
  final int duration;
  final int playcounts;
  final int rank;

  TrackModel(this.image, this.name, this.artist, this.url, this.duration,
      this.playcounts, this.rank);
}
