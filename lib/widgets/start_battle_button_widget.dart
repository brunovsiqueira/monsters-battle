import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/providers/providers.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';
import 'package:flutter/material.dart';

class StartBattleButtonWidget extends ConsumerStatefulWidget {
  const StartBattleButtonWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<StartBattleButtonWidget> createState() =>
      _StartBattleButtonWidgetState();
}

class _StartBattleButtonWidgetState
    extends ConsumerState<StartBattleButtonWidget> {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterBattleViewModel monsterBattleViewModel =
        ref.watch(monsterBattleViewModelProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SizedBox(
        width: size.width * 0.85,
        height: 56,
        child: ElevatedButton(
          style: monsterBattleViewModel.isPlayerAndMonsterSelected
              ? _enableButtonStyle
              : _disabledButtonStyle,
          onPressed: () async {
            // if (isGameFinished) {
            //   //TODO: create a different button to restart
            //   setState(() {
            //     monsterBattleViewModel.computer = null;
            //     monsterBattleViewModel.player = null;
            //     isGameFinished = false;
            //   });
            //   return;
            // }

            var result = await monsterBattleViewModel.startBattle();
            result.fold((failure) {
              showSnackBar(failure.message);
            }, (battleResponse) {
              if (battleResponse.tie) {
                showSnackBar("It's a tie!");
                // setState(() {
                //   isGameFinished = true;
                // });

                return;
              }
              showSnackBar(
                  "${battleResponse.winner?.name} wins."); //TODO: indicate if it is player or computer
              // setState(() {
              //   isGameFinished = true;
              // });
            });
          },
          child: const Text("Start battle"),
        ),
      ),
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
