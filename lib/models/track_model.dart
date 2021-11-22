import 'dart:convert';

import 'package:track/models/artist_model.dart';

import 'attr_model.dart';

class TrackModel {
  final String mbid;
  final String name;
  final ArtistModel artist;
  final String url;
  final String duration;
  final RankAttr attr;
  final String playcount;

  TrackModel(
    this.mbid,
    this.name,
    this.artist,
    this.url,
    this.duration,
    this.attr,
    this.playcount,
  );

  TrackModel copyWith({
    String? mbid,
    String? name,
    ArtistModel? artist,
    String? url,
    String? duration,
    RankAttr? attr,
    String? playcount,
  }) {
    return TrackModel(
      mbid ?? this.mbid,
      name ?? this.name,
      artist ?? this.artist,
      url ?? this.url,
      duration ?? this.duration,
      attr ?? this.attr,
      playcount ?? this.playcount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mbid': mbid,
      'name': name,
      'artist': artist.toMap(),
      'url': url,
      'duration': duration,
      'attr': attr.toMap(),
      'playcount': playcount,
    };
  }

  factory TrackModel.fromMap(Map<String, dynamic> map) {
    return TrackModel(
      map['mbid'],
      map['name'],
      ArtistModel.fromMap(map['artist']),
      map['url'],
      map['duration'] ?? '',
      RankAttr.fromMap(map['attr']),
      map['playcount'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackModel.fromJson(String source) =>
      TrackModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrackModel(mbid: $mbid, name: $name, artist: $artist, url: $url, duration: $duration, attr: $attr, playcount: $playcount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackModel &&
        other.mbid == mbid &&
        other.name == name &&
        other.artist == artist &&
        other.url == url &&
        other.duration == duration &&
        other.attr == attr &&
        other.playcount == playcount;
  }

  @override
  int get hashCode {
    return mbid.hashCode ^
        name.hashCode ^
        artist.hashCode ^
        url.hashCode ^
        duration.hashCode ^
        attr.hashCode ^
        playcount.hashCode;
  }
}
