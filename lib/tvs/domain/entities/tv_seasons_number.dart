import 'package:equatable/equatable.dart';

// ignore: camel_case_types
class TvSeasonsNumber extends Equatable {
  final int seasonNumber;

  const TvSeasonsNumber({required this.seasonNumber});

  @override
  List<Object> get props => [seasonNumber];
}
