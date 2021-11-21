class ArtistModel {
  String? streamable;
  List<Image>? image;
  String? mbid;
  String? url;
  String? playcount;
  Attr? attr;
  String? name;

  ArtistModel(this.streamable, this.image, this.mbid, this.url, this.playcount,
      this.attr, this.name);

  ArtistModel.fromJson(Map<String, dynamic> json) {
    streamable = json['streamable'];
    if (json['image'] != null) {
      image = [];
      json['image'].forEach((v) {
        image?.add(Image.fromJson(v));
      });
    }
    mbid = json['mbid'];
    url = json['url'];
    playcount = json['playcount'];
    attr = json['@attr'] != null ? Attr.fromJson(json['@attr']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['streamable'] = streamable;
    if (image != null) {
      data['image'] = image?.map((v) => v.toJson()).toList();
    }
    data['mbid'] = mbid;
    data['url'] = url;
    data['playcount'] = playcount;
    if (attr != null) {
      data['@attr'] = attr?.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class Image {
  String? size;
  String? text;

  Image.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    text = json['#text'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['size'] = size;
    data['#text'] = text;
    return data;
  }
}

class Attr {
  String? rank;
  Attr({this.rank});

  Attr.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['rank'] = rank;
    return data;
  }
}
