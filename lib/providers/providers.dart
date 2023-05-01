import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';

final monsterBattleViewModelProvider =
    ChangeNotifierProvider<MonsterBattleViewModel>((ref) {
  return MonsterBattleViewModel();
});
