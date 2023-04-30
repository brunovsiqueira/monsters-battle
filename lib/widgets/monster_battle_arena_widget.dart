import 'package:monsters_battle/services/monster_service.dart';
import 'package:monsters_battle/utils/player_type_enum.dart';
import 'package:flutter/material.dart';

import 'monster_battle_item_widget.dart';
import 'package:provider/provider.dart';

class MonsterBattleArenaWidget extends StatelessWidget {
  const MonsterBattleArenaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MonsterService monsterService = context.watch<MonsterService>();
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.55,
        width: 373,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            MonsterBattleItemWidget(
              playerType: PlayerTypeEnum.player,
              monster: monsterService.player,
            ),
            MonsterBattleItemWidget(
              playerType: PlayerTypeEnum.computer,
              monster: monsterService.computer,
            )
          ],
        ));
  }
}
