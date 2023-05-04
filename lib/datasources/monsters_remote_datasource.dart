import 'package:monsters_battle/models/battle_request_model.dart';
import 'package:monsters_battle/models/battle_response_model.dart';
import 'package:monsters_battle/models/monster.dart';

abstract class MonstersRemoteDatasource {
  Future<List<MonsterModel>> getMonsters();
  Future<BattleResponseModel> postMonstersBattle(
      BattleRequestModel battleRequestModel);
}
