// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:html';

import 'package:collection/collection.dart';

class MovieEntity {
  int id;
  String title;
  String backDropPath;
  String overview;
  double voteAverage;
  List genreIds;
  MovieEntity({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
  });

  @override
  bool operator ==(covariant MovieEntity other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.id == id &&
      other.title == title &&
      other.backDropPath == backDropPath &&
      other.overview == overview &&
      other.voteAverage == voteAverage &&
      listEquals(other.genreIds, genreIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      backDropPath.hashCode ^
      overview.hashCode ^
      voteAverage.hashCode ^
      genreIds.hashCode;
  }
}
