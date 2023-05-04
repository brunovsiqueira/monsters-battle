import 'package:monsters_battle/models/monster.dart';

abstract class MonsterRemoteDatasource {
  Future<List<MonsterModel>> getMonsters();
}
