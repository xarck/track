import 'dart:convert';

class RankAttr {
  final String rank;

  RankAttr(
    this.rank,
  );

  RankAttr copyWith({
    String? rank,
  }) {
    return RankAttr(
      rank ?? this.rank,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rank': rank,
    };
  }

  factory RankAttr.fromMap(Map<String, dynamic> map) {
    return RankAttr(
      map['rank'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RankAttr.fromJson(String source) =>
      RankAttr.fromMap(json.decode(source));

  @override
  String toString() => 'RankAttr(rank: $rank)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RankAttr && other.rank == rank;
  }

  @override
  int get hashCode => rank.hashCode;
}

class Attr {
  final String user;
  final String totalPages;
  final String page;
  final String perPage;
  final String total;

  Attr(
    this.user,
    this.totalPages,
    this.page,
    this.perPage,
    this.total,
  );

  Attr copyWith({
    String? user,
    String? totalPages,
    String? page,
    String? perPage,
    String? total,
  }) {
    return Attr(
      user ?? this.user,
      totalPages ?? this.totalPages,
      page ?? this.page,
      perPage ?? this.perPage,
      total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'totalPages': totalPages,
      'page': page,
      'perPage': perPage,
      'total': total,
    };
  }

  factory Attr.fromMap(Map<String, dynamic> map) {
    return Attr(
      map['user'],
      map['totalPages'],
      map['page'],
      map['perPage'],
      map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Attr.fromJson(String source) => Attr.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Attr(user: $user, totalPages: $totalPages, page: $page, perPage: $perPage, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Attr &&
        other.user == user &&
        other.totalPages == totalPages &&
        other.page == page &&
        other.perPage == perPage &&
        other.total == total;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        totalPages.hashCode ^
        page.hashCode ^
        perPage.hashCode ^
        total.hashCode;
  }
}
