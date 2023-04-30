import 'package:monsters_battle/styling/spacing.dart';
import 'package:monsters_battle/utils/player_type_enum.dart';
import 'package:monsters_battle/widgets/monster_power_bar_chart_widget.dart';
import 'package:flutter/material.dart';

import '../models/monster.dart';

class MonsterBattleItemWidget extends StatefulWidget {
  final PlayerTypeEnum playerType;
  final MonsterModel? monster;

  const MonsterBattleItemWidget(
      {Key? key, required this.playerType, required this.monster})
      : super(key: key);

  @override
  State<MonsterBattleItemWidget> createState() =>
      _MonsterBattleItemWidgetState();
}

class _MonsterBattleItemWidgetState extends State<MonsterBattleItemWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterModel? monster = widget.monster;

    return SizedBox(
      width: size.width * 0.70,
      child: Card(
        elevation: 8,
        child: monster == null
            ? Center(
                child: Text(
                  widget.playerType.playerName,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spacingInlineXS,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Image.network(monster.imageUrl),
                    ),
                    spacingInlineS,
                    Text(
                      '${monster.name} (${widget.playerType.playerName})',
                      style: const TextStyle(fontSize: 22),
                    ),
                    spacingInlineXXS,
                    const Divider(
                      height: 1,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MonsterPowerBarChartWidget(
                            monsterAttributeName: "HP",
                            monsterAttributeValue: monster.hp,
                          ),
                          MonsterPowerBarChartWidget(
                            monsterAttributeName: "Attack",
                            monsterAttributeValue: monster.attack,
                          ),
                          MonsterPowerBarChartWidget(
                            monsterAttributeName: "Deffense",
                            monsterAttributeValue: monster.defense,
                          ),
                          MonsterPowerBarChartWidget(
                            monsterAttributeName: "Speed",
                            monsterAttributeValue: monster.speed,
                          ),
                        ],
                      ),
                    ),
                    spacingInlineXL
                  ],
                )),
      ),
    );
  }
}

class MonsterBattleItemHeaderWidget extends StatelessWidget {
  final PlayerTypeEnum playerType;
  const MonsterBattleItemHeaderWidget({super.key, required this.playerType});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(playerType.playerName));
  }
}
