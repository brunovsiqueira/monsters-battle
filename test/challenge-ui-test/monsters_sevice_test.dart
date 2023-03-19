import 'dart:convert';

import 'package:assessment_cc_flutter_sr_01/models/monster.dart';
import 'package:assessment_cc_flutter_sr_01/services/monster_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMonsterServices extends MonsterService implements Mock {}

void main() {
  Monster tMonster1 = Monster("asdsa", "asdsad", 1, 2, 1, 3, "123123");
  Monster tMonster2 = Monster("asdsad", "asdsad", 1, 6, 1, 3, "3423423");
  Monster tMonster3 = Monster("asdsa", "asdsad", 1, 5, 1, 3, "234324");
  MockMonsterServices mockMonsterServices =
      MockMonsterServices([tMonster1, tMonster2, tMonster3]);

  mockMonsterServices.player = tMonster1;

  group("generateCPUMonster", () {
    test("assigns a Monster comptuer different than players monster", () {
      mockMonsterServices.generateCPUMonster(tMonster1);
      expect(mockMonsterServices.computer, isNot(equals(tMonster1)));
    });
  });
}
