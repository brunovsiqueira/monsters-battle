import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/providers/providers.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';
import 'package:monsters_battle/utils/player_type_enum.dart';
import 'package:flutter/material.dart';

import 'monster_battle_item_widget.dart';

class MonsterBattleArenaWidget extends ConsumerWidget {
  const MonsterBattleArenaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MonsterBattleViewModel monsterService =
        ref.watch(monsterBattleViewModelProvider);

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
