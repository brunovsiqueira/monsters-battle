import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';

final monsterBattleViewModelProvider =
    ChangeNotifierProvider<MonsterBattleViewModel>((ref) {
  return MonsterBattleViewModel();
});

final monsterListProvider = FutureProvider<List<MonsterModel>>((ref) async {
  List<MonsterModel> monsters = [];
  final response = await Dio().get('${dotenv.env["API_URL"]}/monsters');
  if (response.statusCode == 200) {
    late Iterable it;
    if (response is List<dynamic>) {
      Map<String, dynamic> results = json.decode(response.data);
      it = results['monsters'] as Iterable;
    } else {
      it = jsonDecode(response.data);
    }
    monsters = List<MonsterModel>.from(
        it.map((monster) => MonsterModel.fromJson(monster)));

    return monsters;
  } else {
    throw Exception('Failed to load monsters');
  }
});
