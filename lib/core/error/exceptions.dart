import 'package:movie_app_with_clean_architecture/core/network/error_message_model.dart';

class ServerException implements Exception {
  final MovieErrorMessageModel movieErrorMessageModel;
  ServerException(this.movieErrorMessageModel);
}

class LocalException implements Exception {
  final String message;
  LocalException(this.message);
}
