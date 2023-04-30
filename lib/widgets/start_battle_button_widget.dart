import 'package:monsters_battle/models/battle_response.dart';
import 'package:monsters_battle/services/monster_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class StartBattleButton extends StatefulWidget {
  const StartBattleButton({Key? key}) : super(key: key);

  @override
  State<StartBattleButton> createState() => _StartBattleButtonState();
}

class _StartBattleButtonState extends State<StartBattleButton> {
  final ButtonStyle _enableButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      const Color(0xFF10782E),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  );
  final ButtonStyle _disabledButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      const Color(0xFF799A82),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  );

  String buttonText = "Start Battle";
  bool isGameFinished = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterService monsterService =
        Provider.of<MonsterService>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: SizedBox(
        width: size.width * 0.85,
        height: 56,
        child: ElevatedButton(
          style:
              monsterService.player != null && monsterService.computer != null
                  ? _enableButtonStyle
                  : _disabledButtonStyle,
          onPressed: () async {
            if (isGameFinished) {
              setState(() {
                buttonText = "Start battle";
                monsterService.computer = null;
                monsterService.player = null;
                isGameFinished = false;
              });
              return;
            }
            if (monsterService.player == null) {
              setState(() {
                buttonText = "You must select a monster first!";
              });
              return;
            }
            BattleResponse battleResponse = await monsterService.startBattle();
            if (battleResponse.tie) {
              setState(() {
                buttonText = "Tie! Tap to restart.";
                isGameFinished = true;
              });

              return;
            }
            setState(() {
              buttonText =
                  "${battleResponse.winner?.name} wins. Tap to restart";
              isGameFinished = true;
            });
          },
          child: Text(buttonText),
        ),
      ),
    );
  }
}
