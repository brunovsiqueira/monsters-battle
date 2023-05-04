import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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

            var result = await monsterService.startBattle();
            result.fold((failure) {
              showSnackBar(failure.message);
            }, (battleResponse) {
              if (battleResponse.tie) {
                showSnackBar("It's a tie!");
                setState(() {
                  isGameFinished = true;
                });

                return;
              }
              showSnackBar(
                  "${battleResponse.winner?.name} wins."); //TODO: indicate if it is player or computer
              setState(() {
                isGameFinished = true;
              });
            });
          },
          child: Text(buttonText),
        ),
      ),
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
