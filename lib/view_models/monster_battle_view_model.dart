import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:monsters_battle/errors/base_failures.dart';
import 'package:monsters_battle/models/battle_request_model.dart';
import 'package:monsters_battle/models/battle_response_model.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:flutter/material.dart';
import 'package:monsters_battle/services/monsters_service.dart';

class MonsterBattleViewModel extends ChangeNotifier {
  final MonstersService _monstersService;
  late final List<MonsterModel> _monsters;
  MonsterModel? _player;
  MonsterModel? _computer;

  BattleResponseModel? _battleResponse;

  MonsterBattleViewModel(this._monstersService);

  Future<Either<Failure, BattleResponseModel>> startBattle(
      BattleRequestModel battleRequestModel) async {
    return await _monstersService.postMonstersBattle(battleRequestModel);
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
    notifyListeners();
  }

  set player(MonsterModel? currentPlayer) {
    _player = currentPlayer;
    notifyListeners();
  }

  set computer(MonsterModel? computerPlayer) {
    _computer = computerPlayer;
    notifyListeners();
  }

  MonsterModel? get player => _player;

  MonsterModel? get computer => _computer;
  BattleResponseModel? get battleResponse => _battleResponse;

  void _generateCPUMonster(MonsterModel playerMonster) {
    List<MonsterModel> computerList = List.from(_monsters);
    computerList.remove(playerMonster);
    int monsterIndex = Random().nextInt(computerList.length - 1);
    _computer = computerList[monsterIndex];
  }
}
