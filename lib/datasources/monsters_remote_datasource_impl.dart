import 'package:dio/dio.dart';
import 'package:monsters_battle/datasources/monsters_remote_datasource.dart';
import 'package:monsters_battle/errors/base_exceptions.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:monsters_battle/services/api.dart';

class MonstersRemoteDatasourceImpl implements MonstersRemoteDatasource {
  final API _api;
  final String _baseURL;

  MonstersRemoteDatasourceImpl(this._api, this._baseURL);
  @override
  Future<List<MonsterModel>> getMonsters() async {
    final url = '$_baseURL/monsters';
    try {
      final response = await _api.httpGet(url);
      List<MonsterModel> monsters = (response.data as List)
          .map((json) => MonsterModel.fromJson(json))
          .toList();
      return monsters;
    } on DioError catch (e) {
      throw ServerException(dioError: e);
    }
  }
}
