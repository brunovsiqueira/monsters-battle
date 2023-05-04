import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/datasources/monsters_remote_datasource_impl.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:monsters_battle/services/api.dart';
import 'package:monsters_battle/services/api_impl.dart';
import 'package:monsters_battle/services/monster_service_impl.dart';
import 'package:monsters_battle/services/monsters_service.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';

final apiProvider = Provider<API>((ref) {
  return APIImpl(headersBuilders: {}, dio: Dio());
});

final monsterServiceProvider = Provider<MonstersService>((ref) {
  return MonstersServiceImpl(MonstersRemoteDatasourceImpl(
      ref.read(apiProvider), dotenv.env["API_URL"]!));
});
final monsterBattleViewModelProvider =
    ChangeNotifierProvider<MonsterBattleViewModel>((ref) {
  return MonsterBattleViewModel(ref.read(monsterServiceProvider));
});

final monsterListProvider = FutureProvider<List<MonsterModel>>((ref) async {
  return ref.read(monsterServiceProvider).getMonsters();
});
