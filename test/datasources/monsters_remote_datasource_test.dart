import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monsters_battle/datasources/monsters_remote_datasource_impl.dart';
import 'package:monsters_battle/errors/base_exceptions.dart';
import 'package:monsters_battle/models/monster.dart';
import 'package:monsters_battle/services/api.dart';

import '../fixtures/fixture_reader.dart';

class MockAPI extends Mock implements API {}

void main() {
  late MockAPI mockAPI;
  late MonstersRemoteDatasourceImpl datasource;

  const baseURL = "http://localhost:8000/";

  setUp(() {
    mockAPI = MockAPI();
    datasource = MonstersRemoteDatasourceImpl(mockAPI, baseURL);
  });

  group('getMonsters', () {
    const tEndpoint = '$baseURL/monsters';
    final List json = jsonDecode(fixture('monsters.json'));

    final tRequestOptions = RequestOptions(path: tEndpoint);

    void setupSuccessfulAPICall() {
      when(
        () => mockAPI.httpGet(tEndpoint),
      ).thenAnswer(
          (_) async => Response(requestOptions: tRequestOptions, data: json));
    }

    test(
        'should perform a GET request on the URL: '
        '/monsters', () async {
      //arrange
      setupSuccessfulAPICall();

      //act
      await datasource.getMonsters();

      //assert
      verify(() => mockAPI.httpGet(tEndpoint)).called(1);
    });

    test(
        'should return a List<MonsterModel> when the call '
        'to the API is successful ', () async {
      //arrange
      setupSuccessfulAPICall();

      //act
      final result = await datasource.getMonsters();

      //assert
      final List<MonsterModel> tExpectedMonsters =
          json.map((e) => MonsterModel.fromJson(e)).toList();
      expect(result, tExpectedMonsters);
    });

    test(
        'should throw a ServerException when the call '
        'to the API is unsuccessful ', () async {
      //arrange
      when(() => mockAPI.httpGet(any()))
          .thenThrow(DioError(requestOptions: tRequestOptions));

      //act
      final call = datasource.getMonsters;

      //assert

      expect(
        () async => await call(),
        throwsA(const TypeMatcher<ServerException>()),
      );
    });
  });
}
