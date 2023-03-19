import 'package:assessment_cc_flutter_sr_01/services/monster_service.dart';
import 'package:assessment_cc_flutter_sr_01/utils/player_type_enum.dart';
import 'package:assessment_cc_flutter_sr_01/widgets/monster_power_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/monster.dart';

class MonsterItem extends StatefulWidget {
  final PlayerType type;

  const MonsterItem({Key? key, required this.type}) : super(key: key);

  @override
  State<MonsterItem> createState() => _MonsterItemState();
}

class _MonsterItemState extends State<MonsterItem> {
  Widget _defaultContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Text(
        widget.type.playerName,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _currentMonsterWidget(Monster monster) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Image.network(monster.imageUrl),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              monster.name,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
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
            const SizedBox(
              height: 25,
            ),
          ],
        ));
  }

  Widget _buildCurrentWidget(MonsterService monsterService) {
    Size size = MediaQuery.of(context).size;
    late Widget currentWidget;
    switch (widget.type) {
      case PlayerType.player:
        currentWidget = monsterService.player != null
            ? _currentMonsterWidget(monsterService.player!)
            : _defaultContent(context);
        break;
      case PlayerType.computer:
        currentWidget = monsterService.computer != null
            ? _currentMonsterWidget(monsterService.computer!)
            : _defaultContent(context);
        break;
      default:
        currentWidget = _defaultContent(context);
    }

    return Container(
      width: size.width,
      height: size.height,
      child: Card(elevation: 8, child: currentWidget),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterService monsterService =
        Provider.of<MonsterService>(context, listen: true);

    return Container(
      width: size.width * 0.70,
      child: _buildCurrentWidget(monsterService),
    );
  }
}
