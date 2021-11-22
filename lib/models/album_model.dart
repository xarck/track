import 'dart:convert';

import 'package:track/models/artist_model.dart';
import 'package:track/models/attr_model.dart';

class AlbumModel {
  final ArtistModel artist;
  final String mbid;
  final String url;
  final String playcount;
  final RankAttr attr;
  final String name;

  AlbumModel(
    this.artist,
    this.mbid,
    this.url,
    this.playcount,
    this.attr,
    this.name,
  );

  AlbumModel copyWith({
    ArtistModel? artist,
    String? mbid,
    String? url,
    String? playcount,
    RankAttr? attr,
    String? name,
  }) {
    return AlbumModel(
      artist ?? this.artist,
      mbid ?? this.mbid,
      url ?? this.url,
      playcount ?? this.playcount,
      attr ?? this.attr,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'artist': artist.toMap(),
      'mbid': mbid,
      'url': url,
      'playcount': playcount,
      'attr': attr.toMap(),
      'name': name,
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      ArtistModel.fromMap(map['artist']),
      map['mbid'],
      map['url'],
      map['playcount'],
      RankAttr.fromMap(map['attr']),
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) =>
      AlbumModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AlbumModel(artist: $artist, mbid: $mbid, url: $url, playcount: $playcount, attr: $attr, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumModel &&
        other.artist == artist &&
        other.mbid == mbid &&
        other.url == url &&
        other.playcount == playcount &&
        other.attr == attr &&
        other.name == name;
  }

  @override
  int get hashCode {
    return artist.hashCode ^
        mbid.hashCode ^
        url.hashCode ^
        playcount.hashCode ^
        attr.hashCode ^
        name.hashCode;
  }
}
