import 'dart:convert';

import 'package:web_scraper/web_scraper.dart';

import 'package:track/models/attr_model.dart';

class ArtistModel {
  String? streamable;
  String? mbid;
  String? url;
  String? playcount;
  RankAttr? attr;
  String? name;
  String? imageUrl;

  ArtistModel(
    this.streamable,
    this.mbid,
    this.url,
    this.playcount,
    this.attr,
    this.name,
    this.imageUrl,
  );

  ArtistModel copyWith({
    String? streamable,
    String? mbid,
    String? url,
    String? playcount,
    RankAttr? attr,
    String? name,
    String? imageUrl,
  }) {
    return ArtistModel(
      streamable ?? this.streamable,
      mbid ?? this.mbid,
      url ?? this.url,
      playcount ?? this.playcount,
      attr ?? this.attr,
      name ?? this.name,
      imageUrl ?? this.imageUrl,
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
      'imageUrl': imageUrl,
    };
  }

  ArtistModel.fromMap(Map<String, dynamic> map) {
    streamable = map['streamable'] ?? '';
    mbid = map['mbid'] != null ? map['mbid'] : null;
    url = map['url'] != null ? map['url'] : null;
    playcount = map['playcount'] != null ? map['playcount'] : null;
    attr = map['attr'] != null ? RankAttr.fromMap(map['attr']) : null;
    name = map['name'] != null ? map['name'] : null;
  }
  Future fetchImageUrl(url) async {
    var rawUrl = url;
    final webScraper = WebScraper('https://www.last.fm');
    final endpoint = rawUrl.replaceAll(r'https://www.last.fm', '');
    if (await webScraper.loadWebPage(endpoint)) {
      var elements = webScraper.getElement(
          '.sidebar-image-list > .sidebar-image-list-item > a > img', ['src']);
      return elements[0]['attributes']['src'];
    }
  }

  String toJson() => json.encode(toMap());

  factory ArtistModel.fromJson(String source) =>
      ArtistModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArtistModel(streamable: $streamable, mbid: $mbid, url: $url, playcount: $playcount, attr: $attr, name: $name, imageUrl: $imageUrl)';
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
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return streamable.hashCode ^
        mbid.hashCode ^
        url.hashCode ^
        playcount.hashCode ^
        attr.hashCode ^
        name.hashCode ^
        imageUrl.hashCode;
  }
}
