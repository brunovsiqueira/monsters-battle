import 'package:monsters_battle/models/monster.dart';

abstract class MonstersRemoteDatasource {
  Future<List<MonsterModel>> getMonsters();
}
