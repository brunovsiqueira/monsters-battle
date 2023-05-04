import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

class ServerException extends Equatable implements Exception {
  final DioError dioError;
  final String? customMessage;
  final Level? customLevel;

  const ServerException(
      {required this.dioError, this.customMessage, this.customLevel});

  @override
  List<Object?> get props => [dioError, customMessage, customLevel];
}
