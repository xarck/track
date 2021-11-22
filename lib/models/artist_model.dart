import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:track/models/attr_model.dart';

import 'image_model.dart';

class ArtistModel {
  String? streamable;
  List<Image>? image;
  String? mbid;
  String? url;
  String? playcount;
  RankAttr? attr;
  String? name;

  ArtistModel(
    this.streamable,
    this.image,
    this.mbid,
    this.url,
    this.playcount,
    this.attr,
    this.name,
  );

  ArtistModel copyWith({
    String? streamable,
    List<Image>? image,
    String? mbid,
    String? url,
    String? playcount,
    RankAttr? attr,
    String? name,
  }) {
    return ArtistModel(
      streamable ?? this.streamable,
      image ?? this.image,
      mbid ?? this.mbid,
      url ?? this.url,
      playcount ?? this.playcount,
      attr ?? this.attr,
      name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'streamable': streamable,
      'image': image?.map((x) => x.toMap()).toList(),
      'mbid': mbid,
      'url': url,
      'playcount': playcount,
      'attr': attr?.toMap(),
      'name': name,
    };
  }

  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      map['streamable'],
      List<Image>.from([]),
      map['mbid'],
      map['url'],
      map['playcount'],
      RankAttr.fromMap(map['@attr']),
      map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistModel.fromJson(String source) =>
      ArtistModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArtistModel(streamable: $streamable, image: $image, mbid: $mbid, url: $url, playcount: $playcount, attr: $attr, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArtistModel &&
        other.streamable == streamable &&
        listEquals(other.image, image) &&
        other.mbid == mbid &&
        other.url == url &&
        other.playcount == playcount &&
        other.attr == attr &&
        other.name == name;
  }

  @override
  int get hashCode {
    return streamable.hashCode ^
        image.hashCode ^
        mbid.hashCode ^
        url.hashCode ^
        playcount.hashCode ^
        attr.hashCode ^
        name.hashCode;
  }
}
