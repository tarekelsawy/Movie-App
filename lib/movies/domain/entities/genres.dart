
import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final int id;
  final String name;
 const Genres({
    required this.id,
    required this.name,
  });
  

  @override
  List<Object> get props => [id, name];


  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }


}
