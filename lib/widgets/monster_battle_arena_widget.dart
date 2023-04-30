import 'package:monsters_battle/utils/player_type_enum.dart';
import 'package:flutter/material.dart';

import 'monster_battle_item_widget.dart';

class MonsterBattleArenaWidget extends StatelessWidget {
  final List<MonsterBattleItemWidget> monsters = const [
    MonsterBattleItemWidget(type: PlayerType.player),
    MonsterBattleItemWidget(type: PlayerType.computer)
  ];

  const MonsterBattleArenaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.55,
      width: 373,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: monsters.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 28),
                child: monsters[index],
              )),
    );
  }
}
