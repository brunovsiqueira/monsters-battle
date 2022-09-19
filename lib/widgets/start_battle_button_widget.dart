import 'package:assessment_cc_flutter_sr_01/services/monster_service.dart';
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterService monsterService =
        Provider.of<MonsterService>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        width: size.width * 0.85,
        height: 56,
        child: ElevatedButton(
          style:
              monsterService.player != null && monsterService.computer != null
                  ? _enableButtonStyle
                  : _disabledButtonStyle,
          onPressed: null, //TODO: Implement call
          child: const Text("Start Battle"),
        ),
      ),
    );
  }
}
