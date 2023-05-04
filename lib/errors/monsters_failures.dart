import 'package:monsters_battle/errors/base_failures.dart';

class GetMonstersFailure extends ServerFailure {
  static const String defaultMessage =
      "Error getting list of monsters. Try again later.";
  GetMonstersFailure({required exception, required StackTrace stackTrace})
      : super(
          customMessage: defaultMessage,
          exception: exception,
          stackTrace: stackTrace,
        );
}

class PostMonstersBattleFailure extends ServerFailure {
  static const String defaultMessage =
      "Error proccessing battle request. Try again later.";
  PostMonstersBattleFailure(
      {required exception, required StackTrace stackTrace})
      : super(
          customMessage: defaultMessage,
          exception: exception,
          stackTrace: stackTrace,
        );
}

class PostMonstersBattleInvalidIdFailure extends ServerFailure {
  static const String defaultMessage = "Invalid monster Id.";
  PostMonstersBattleInvalidIdFailure(
      {required exception, required StackTrace stackTrace})
      : super(
          customMessage: defaultMessage,
          exception: exception,
          stackTrace: stackTrace,
        );
}
