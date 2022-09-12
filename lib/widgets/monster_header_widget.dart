import 'package:assessment_cc_flutter_sr_01/services/monster_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/monster.dart';

class MonsterHeaderCard extends StatelessWidget {
  final Monster monster;

  const MonsterHeaderCard({Key? key, required this.monster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterService monsterService = Provider.of<MonsterService>(context);
    return Container(
      width: 150,
      height: size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Card(
          elevation: 8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 6.0,
                  right: 6.0,
                  top: 7.0,
                ),
                child: Container(
                  width: 139,
                  child: GestureDetector(
                    onTap: () {
                      monsterService.selectMonster(monster);
                      //monsterService.player = monster;
                      //monsterService.generateCPUMonster();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image(
                        image: NetworkImage(monster.imageUrl),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, bottom: 8, top: 7),
                child: Container(
                  width: size.width,
                  child: Text(monster.name),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
