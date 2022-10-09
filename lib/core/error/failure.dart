// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);


  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure{
  const ServerFailure(super.message);
}
//todo:local server
class LocalServer extends Failure{
  const LocalServer(super.message);
}

