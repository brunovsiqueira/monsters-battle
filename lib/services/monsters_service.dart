import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:monsters_battle/errors/base_failures.dart';
import 'package:monsters_battle/models/battle_response.dart';
import 'package:monsters_battle/models/monster.dart';

abstract class MonstersService {
  Future<Either<Failure, List<MonsterModel>>> getMonsters();
  Future<Either<Failure, BattleResponseModel>> postBattle();
}
