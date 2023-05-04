import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/providers/providers.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';
import 'package:flutter/material.dart';

import '../models/monster.dart';

class MonsterHeaderCard extends ConsumerWidget {
  final MonsterModel monster;

  const MonsterHeaderCard({Key? key, required this.monster}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: 150,
      height: 140,
      child: GestureDetector(
        onTap: () {
          ref.read(monsterBattleViewModelProvider).selectMonster(monster);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 7, top: 6, right: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 136,
                    height: 99,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(monster.imageUrl),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: SizedBox(
                      width: size.width,
                      child: Text(monster.name),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
