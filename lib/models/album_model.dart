import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:track/models/artist_model.dart';
import 'package:track/models/attr_model.dart';

import 'image_model.dart';

class TopAlbums {
  final List<AlbumModel> albums;
  final Attr attr;

  TopAlbums(
    this.albums,
    this.attr,
  );

  TopAlbums copyWith({
    List<AlbumModel>? albums,
    Attr? attr,
  }) {
    return TopAlbums(
      albums ?? this.albums,
      attr ?? this.attr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albums': albums.map((x) => x.toMap()).toList(),
      'attr': attr.toMap(),
    };
  }

  factory TopAlbums.fromMap(Map<String, dynamic> map) {
    return TopAlbums(
      List<AlbumModel>.from(map['albums']?.map((x) => AlbumModel.fromMap(x))),
      Attr.fromMap(map['attr']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TopAlbums.fromJson(String source) =>
      TopAlbums.fromMap(json.decode(source));

  @override
  String toString() => 'TopAlbums(albums: $albums, attr: $attr)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopAlbums &&
        listEquals(other.albums, albums) &&
        other.attr == attr;
  }

  @override
  int get hashCode => albums.hashCode ^ attr.hashCode;
}

class AlbumModel {
  final ArtistModel artist;
  final List<Image> images;
  final String mbid;
  final String url;
  final int playcount;
  final RankAttr attr;
  final String name;

  AlbumModel(
    this.artist,
    this.images,
    this.mbid,
    this.url,
    this.playcount,
    this.attr,
    this.name,
  );

  AlbumModel copyWith({
    ArtistModel? artist,
    List<Image>? images,
    String? mbid,
    String? url,
    int? playcount,
    RankAttr? attr,
    String? name,
  }) {
    return AlbumModel(
      artist ?? this.artist,
      images ?? this.images,
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
      'images': images.map((x) => x.toMap()).toList(),
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
      List<Image>.from(map['images']?.map((x) => Image.fromMap(x))),
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
    return 'AlbumModel(artist: $artist, images: $images, mbid: $mbid, url: $url, playcount: $playcount, attr: $attr, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumModel &&
        other.artist == artist &&
        listEquals(other.images, images) &&
        other.mbid == mbid &&
        other.url == url &&
        other.playcount == playcount &&
        other.attr == attr &&
        other.name == name;
  }

  @override
  int get hashCode {
    return artist.hashCode ^
        images.hashCode ^
        mbid.hashCode ^
        url.hashCode ^
        playcount.hashCode ^
        attr.hashCode ^
        name.hashCode;
  }
}
