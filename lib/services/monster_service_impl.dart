import 'package:monsters_battle/datasources/monsters_remote_datasource.dart';
import 'package:monsters_battle/errors/base_exceptions.dart';
import 'package:monsters_battle/errors/monsters_exceptions.dart';
import 'package:monsters_battle/errors/monsters_failures.dart';
import 'package:monsters_battle/models/battle_request_model.dart';
import 'package:monsters_battle/models/battle_response_model.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:monsters_battle/errors/base_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:monsters_battle/services/monsters_service.dart';

class MonstersServiceImpl implements MonstersService {
  final MonstersRemoteDatasource _monstersRemoteDatasource;

  MonstersServiceImpl(this._monstersRemoteDatasource);

  @override
  Future<Either<Failure, List<MonsterModel>>> getMonsters() async {
    Failure? failure;
    try {
      List<MonsterModel> monsters =
          await _monstersRemoteDatasource.getMonsters();
      return Right(monsters);
    } on ServerException catch (e, stackTrace) {
      failure = GetMonstersFailure(exception: e, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      failure = UnknownFailure(exception: e, stackTrace: stackTrace);
    }
    return Left(failure);
  }

  @override
  Future<Either<Failure, BattleResponseModel>> postMonstersBattle(
      BattleRequestModel battleRequestModel) async {
    Failure? failure;
    try {
      BattleResponseModel battleResponse = await _monstersRemoteDatasource
          .postMonstersBattle(battleRequestModel);
      return Right(battleResponse);
    } on PostMonstersBattleInvalidIdException catch (e, stackTrace) {
      failure = PostMonstersBattleInvalidIdFailure(
          exception: e, stackTrace: stackTrace);
    } on ServerException catch (e, stackTrace) {
      failure = PostMonstersBattleFailure(exception: e, stackTrace: stackTrace);
    } catch (e, stackTrace) {
      failure = UnknownFailure(exception: e, stackTrace: stackTrace);
    }
    return Left(failure);
  }
}
