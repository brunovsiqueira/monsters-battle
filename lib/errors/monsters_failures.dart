import 'package:monsters_battle/errors/base_failures.dart';

class GetMonstersFailure extends ServerFailure {
  static const String defaultMessage = "Error getting list of monsters.";
  GetMonstersFailure({required exception, required StackTrace stackTrace})
      : super(
          customMessage: defaultMessage,
          exception: exception,
          stackTrace: stackTrace,
        );
}
