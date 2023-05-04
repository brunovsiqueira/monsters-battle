import 'package:monsters_battle/widgets/monster_list_widget.dart';
import 'package:monsters_battle/widgets/start_battle_button_widget.dart';
import 'package:flutter/material.dart';

import '../styling/spacing.dart';
import '../widgets/monster_battle_arena_widget.dart';

class MonstersBattleHomePage extends StatelessWidget {
  const MonstersBattleHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 49, left: 22),
                child: Text(
                  "Battle of Monsters",
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 27, left: 20),
                child: Text(
                  "Select your monster",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              spacingInlineD,
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: MonsterList(),
              ),
              spacingInlineL,
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: MonsterBattleArenaWidget(),
              ),
              spacingInlineL,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StartBattleButtonWidget(),
    );
  }
}
