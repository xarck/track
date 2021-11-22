import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:track/models/artist_model.dart';
import 'package:track/models/image_model.dart';

import 'attr_model.dart';

class TopTracks {
  final List<TrackModel> track;
  final Attr attr;

  TopTracks(
    this.track,
    this.attr,
  );

  TopTracks copyWith({
    List<TrackModel>? track,
    Attr? attr,
  }) {
    return TopTracks(
      track ?? this.track,
      attr ?? this.attr,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'track': track.map((x) => x.toMap()).toList(),
      'attr': attr.toMap(),
    };
  }

  factory TopTracks.fromMap(Map<String, dynamic> map) {
    return TopTracks(
      List<TrackModel>.from(map['track']?.map((x) => TrackModel.fromMap(x))),
      Attr.fromMap(map['@attr']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TopTracks.fromJson(String source) =>
      TopTracks.fromMap(json.decode(source));

  @override
  String toString() => 'TopTracks(track: $track, attr: $attr)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopTracks &&
        listEquals(other.track, track) &&
        other.attr == attr;
  }

  @override
  int get hashCode => track.hashCode ^ attr.hashCode;
}

class TrackModel {
  final String mbid;
  final String name;
  final List<Image> image;
  final ArtistModel artist;
  final String url;
  final String duration;
  final RankAttr attr;
  final String playcount;

  TrackModel(
    this.mbid,
    this.name,
    this.image,
    this.artist,
    this.url,
    this.duration,
    this.attr,
    this.playcount,
  );

  TrackModel copyWith({
    String? mbid,
    String? name,
    List<Image>? image,
    ArtistModel? artist,
    String? url,
    String? duration,
    RankAttr? attr,
    String? playcount,
  }) {
    return TrackModel(
      mbid ?? this.mbid,
      name ?? this.name,
      image ?? this.image,
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
      'image': image.map((x) => x.toMap()).toList(),
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
      List<Image>.from(map['image']?.map((x) => Image.fromMap(x))),
      ArtistModel.fromMap(map['artist']),
      map['url'],
      map['duration'],
      RankAttr.fromMap(map['attr']),
      map['playcount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackModel.fromJson(String source) =>
      TrackModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TrackModel(mbid: $mbid, name: $name, image: $image, artist: $artist, url: $url, duration: $duration, attr: $attr, playcount: $playcount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrackModel &&
        other.mbid == mbid &&
        other.name == name &&
        listEquals(other.image, image) &&
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
        image.hashCode ^
        artist.hashCode ^
        url.hashCode ^
        duration.hashCode ^
        attr.hashCode ^
        playcount.hashCode;
  }
}
