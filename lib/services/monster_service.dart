import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:assessment_cc_flutter_sr_01/models/battle_request.dart';
import 'package:assessment_cc_flutter_sr_01/models/battle_response.dart';
import 'package:assessment_cc_flutter_sr_01/models/monster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MonsterService extends ChangeNotifier {
  List<Monster> _monsters = [];
  Monster? _player;
  Monster? _computer;

  BattleResponse? _battleResponse;

  UnmodifiableListView<Monster> get monsters => UnmodifiableListView(_monsters);

  Future<List<Monster>> getMonsters() async {
    final response =
        await http.get(Uri.parse('${dotenv.env["API_URL"]}/monsters'));
    if (response.statusCode == 200) {
      late Iterable it;
      if (response.body is List<dynamic>) {
        Map<String, dynamic> results = json.decode(response.body);
        it = results['monsters'] as Iterable;
      } else {
        it = jsonDecode(response.body);
      }
      _monsters =
          List<Monster>.from(it.map((monster) => Monster.fromJson(monster)));
      notifyListeners();
      return _monsters;
    } else {
      throw Exception('Failed to load monsters');
    }
  }

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

  void selectMonster(Monster monster) {
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

  set player(Monster? currentPlayer) {
    _player = currentPlayer;
    notifyListeners();
  }

  set computer(Monster? computerPlayer) {
    _computer = computerPlayer;
    notifyListeners();
  }

  Monster? get player => _player;

  Monster? get computer => _computer;
  BattleResponse? get battleResponse => _battleResponse;

  void generateCPUMonster(Monster playerMonster) {
    List<Monster> computerList = List.from(_monsters);
    computerList.remove(playerMonster);
    int monsterIndex = Random().nextInt(computerList.length - 1);
    _computer = computerList[monsterIndex];
  }
}
