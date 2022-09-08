import 'dart:collection';
import 'dart:convert';

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

  Future<BattleResponse?> startBattle() async {
    //TODO: Implement call
    return null;
  }

  set player(Monster? currentPlayer) {
    _player = currentPlayer;
    notifyListeners();
  }

  Monster? get player => _player;

  BattleResponse? get battleResponse => _battleResponse;

  Monster? get computer => _computer;

  void generateCPUMonster() {
    //TODO: Assign CPU monster
  }
}
