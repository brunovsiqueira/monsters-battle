import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/models/battle_response.dart';
import 'package:monsters_battle/providers/providers.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';
import 'package:flutter/material.dart';

class StartBattleButton extends ConsumerStatefulWidget {
  const StartBattleButton({Key? key}) : super(key: key);

  @override
  ConsumerState<StartBattleButton> createState() => _StartBattleButtonState();
}

class _StartBattleButtonState extends ConsumerState<StartBattleButton> {
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
    MonsterBattleViewModel monsterService =
        ref.watch(monsterBattleViewModelProvider);
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("You must select a monster first!")));

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
