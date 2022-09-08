import 'package:assessment_cc_flutter_sr_01/services/monster_service.dart';
import 'package:assessment_cc_flutter_sr_01/utils/player_type_enum.dart';
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

  Widget _currentMonsterWidget(Monster? monster) {
    //TODO: Create monster widgets
    return Center(
      child: Text(monster!.name),
    );
  }

  Widget _buildCurrentWidget(MonsterService monsterService) {
    Size size = MediaQuery.of(context).size;
    late Widget currentWidget;
    switch (widget.type) {
      case PlayerType.player:
        currentWidget = monsterService.player != null
            ? _currentMonsterWidget(monsterService.player)
            : _defaultContent(context);
        break;
      case PlayerType.computer:
        currentWidget = monsterService.computer != null
            ? _currentMonsterWidget(monsterService.computer)
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
