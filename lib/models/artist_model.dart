import 'dart:convert';

import 'package:track/models/attr_model.dart';

class ArtistModel {
  String? streamable;
  String? mbid;
  String? url;
  String? playcount;
  RankAttr? attr;
  String? name;

  ArtistModel(
    this.streamable,
    this.mbid,
    this.url,
    this.playcount,
    this.attr,
    this.name,
  );

  ArtistModel copyWith({
    String? streamable,
    String? mbid,
    String? url,
    String? playcount,
    RankAttr? attr,
    String? name,
  }) {
    return ArtistModel(
      streamable ?? this.streamable,
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
      'mbid': mbid,
      'url': url,
      'playcount': playcount,
      'attr': attr?.toMap(),
      'name': name,
    };
  }

  factory ArtistModel.fromMap(Map<String, dynamic> map) {
    return ArtistModel(
      map['streamable'] != null ? map['streamable'] : null,
      map['mbid'] != null ? map['mbid'] : null,
      map['url'] != null ? map['url'] : null,
      map['playcount'] != null ? map['playcount'] : null,
      map['attr'] != null ? RankAttr.fromMap(map['attr']) : null,
      map['name'] != null ? map['name'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtistModel.fromJson(String source) =>
      ArtistModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArtistModel(streamable: $streamable, mbid: $mbid, url: $url, playcount: $playcount, attr: $attr, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArtistModel &&
        other.streamable == streamable &&
        other.mbid == mbid &&
        other.url == url &&
        other.playcount == playcount &&
        other.attr == attr &&
        other.name == name;
  }

  @override
  int get hashCode {
    return streamable.hashCode ^
        mbid.hashCode ^
        url.hashCode ^
        playcount.hashCode ^
        attr.hashCode ^
        name.hashCode;
  }
}
