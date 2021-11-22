import 'dart:convert';

class Image {
  String? size;
  String? text;
  Image({
    this.size,
    this.text,
  });

  Image copyWith({
    String? size,
    String? text,
  }) {
    return Image(
      size: size ?? this.size,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'size': size,
      'text': text,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      size: map['size'] ?? '',
      text: map['#text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() => 'Image(size: $size, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Image && other.size == size && other.text == text;
  }

  @override
  int get hashCode => size.hashCode ^ text.hashCode;
}
