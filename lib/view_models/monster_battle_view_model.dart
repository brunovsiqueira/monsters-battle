import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:monsters_battle/models/battle_request.dart';
import 'package:monsters_battle/models/battle_response.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MonsterBattleViewModel extends ChangeNotifier {
  final List<MonsterModel> _monsters = [];
  MonsterModel? _player;
  MonsterModel? _computer;

  BattleResponse? _battleResponse;

  UnmodifiableListView<MonsterModel> get monsters =>
      UnmodifiableListView(_monsters);

  Future<BattleResponse> startBattle() async {
    final response = await http.post(
        Uri.parse('${dotenv.env["API_URL"]}/battle'),
        body: BattleRequest(_player!.id, _computer!.id).toJson());
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return BattleResponse.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to start battle');
    }
  }

  void selectMonster(MonsterModel monster) {
    if (_player != null && _player?.id == monster.id) {
      //If the same monster is selected so
      //the monster is deselected
      _player = null;
      _computer = null;
    } else {
      _player = monster;
      generateCPUMonster(_player!);
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
  BattleResponse? get battleResponse => _battleResponse;

  void generateCPUMonster(MonsterModel playerMonster) {
    List<MonsterModel> computerList = List.from(_monsters);
    computerList.remove(playerMonster);
    int monsterIndex = Random().nextInt(computerList.length - 1);
    _computer = computerList[monsterIndex];
  }
}
