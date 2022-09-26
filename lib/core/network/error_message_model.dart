// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;
  const MovieErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });
  
  @override
  List<Object?> get props => [statusCode,statusMessage,success];

  

  

  factory MovieErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return MovieErrorMessageModel(
      statusCode: json['statusCode'] as int,
      statusMessage: json['statusMessage'] as String,
      success: json['success'] as bool,
    );
  }

  }
