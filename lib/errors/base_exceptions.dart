import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

class ServerException extends Equatable implements Exception {
  final DioError dioError;
  final String? message;
  final Level? logLevel;

  const ServerException({required this.dioError, this.message, this.logLevel});

  @override
  List<Object?> get props => [dioError, message, logLevel];
}
