import 'package:equatable/equatable.dart';

class TvGenresDetails extends Equatable {
  final String name;

  const TvGenresDetails({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
