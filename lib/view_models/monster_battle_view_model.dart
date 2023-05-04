// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:monsters_battle/enums/view_model_status_enum.dart';
import 'package:monsters_battle/errors/base_failures.dart';
import 'package:monsters_battle/errors/monsters_failures.dart';
import 'package:monsters_battle/models/battle_request_model.dart';
import 'package:monsters_battle/models/battle_response_model.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:monsters_battle/services/monsters_service.dart';
import 'package:monsters_battle/view_models/base_view_model.dart';

class MonsterBattleViewModel extends BaseViewModel {
  final MonstersService _monstersService;
  List<MonsterModel> monsters = [];
  Failure? failure;

  MonsterModel? _player;
  MonsterModel? _computer;

  MonsterBattleViewModel(this._monstersService);

  MonsterModel? get player => _player;
  MonsterModel? get computer => _computer;

  bool get isPlayerAndMonsterSelected => player != null && computer != null;

  set player(MonsterModel? currentPlayer) {
    _player = currentPlayer;
    notify();
  }

  set computer(MonsterModel? computerPlayer) {
    _computer = computerPlayer;
    notify();
  }

  Future<Either<Failure, BattleResponseModel>> startBattle() async {
    if (!isPlayerAndMonsterSelected) {
      return const Left(MonstersNotSelectedFailure());
    }
    return await _monstersService.postMonstersBattle(
        BattleRequestModel(monster1Id: _player!.id, monster2Id: _computer!.id));
  }

  Future<void> getMonsters() async {
    status = ViewModelStatusEnum.loading;
    var result = await _monstersService.getMonsters();
    result.fold((_failure) {
      failure = _failure;
      status = ViewModelStatusEnum.error;
    }, (_monsterList) {
      monsters = _monsterList;
      status = ViewModelStatusEnum.error;
    });
    notify();
  }

  void selectMonster(MonsterModel monster) {
    if (_player != null && _player?.id == monster.id) {
      //If the same monster is selected so
      //the monster is deselected
      _player = null;
      _computer = null;
    } else {
      _player = monster;
      _generateCPUMonster(_player!);
    }
    notify();
  }

  void _generateCPUMonster(MonsterModel playerMonster) {
    List<MonsterModel> computerList = List.from(monsters);
    computerList.remove(playerMonster);
    int monsterIndex = Random().nextInt(computerList.length - 1);
    _computer = computerList[monsterIndex];
  }
}
