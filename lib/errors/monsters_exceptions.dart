import 'package:dio/dio.dart';
import 'package:monsters_battle/errors/base_exceptions.dart';

class PostMonstersBattleInvalidIdException extends ServerException {
  const PostMonstersBattleInvalidIdException({required DioError dioError})
      : super(dioError: dioError);
}
