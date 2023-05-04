import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:monsters_battle/errors/base_exceptions.dart';

class Failure extends Equatable {
  final String message;

  final dynamic exception;
  final Level logLevel;
  final StackTrace stackTrace;

  const Failure(
      {required this.message,
      this.exception,
      this.logLevel = Level.INFO,
      this.stackTrace = StackTrace.empty});

  @override
  List<Object?> get props => [message, exception, logLevel, stackTrace];
}

class UnknownFailure extends Failure {
  static const String defaultMessage = "An unexpected error has occurred.";

  const UnknownFailure(
      {dynamic exception, StackTrace stackTrace = StackTrace.empty})
      : super(
            message: defaultMessage,
            exception: exception,
            stackTrace: stackTrace,
            logLevel: Level.SEVERE);
}

class ServerFailure extends Failure {
  static const String defaultMessage = "Server communication failure.";

  ServerFailure(
      {String? customMessage,
      ServerException? exception,
      StackTrace stackTrace = StackTrace.empty,
      Level logLevel = Level.WARNING})
      : super(
            message: exception?.message ?? customMessage ?? defaultMessage,
            exception: exception,
            stackTrace: stackTrace,
            logLevel: exception?.logLevel ?? logLevel);
}
