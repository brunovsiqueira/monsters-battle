import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/enums/view_model_status_enum.dart';
import 'package:monsters_battle/providers/providers.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';
import 'package:monsters_battle/widgets/monster_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/monster.dart';

class MonsterListWidget extends ConsumerStatefulWidget {
  const MonsterListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MonsterListWidget> createState() => _MonsterListWidgetState();
}

class _MonsterListWidgetState extends ConsumerState<MonsterListWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(monsterBattleViewModelProvider).getMonsters();
  }

  @override
  Widget build(BuildContext context) {
    ViewModelStatusEnum status = ref
        .watch(monsterBattleViewModelProvider.select((value) => value.status));
    MonsterBattleViewModel monsterBattleViewModel =
        ref.read(monsterBattleViewModelProvider);

    if (status == ViewModelStatusEnum.loading) {
      return const LoadingMonstersWidget();
    }
    if (status == ViewModelStatusEnum.error) {
      return Center(
        child: Text(monsterBattleViewModel.failure!.message),
      );
    }

    List<MonsterModel> monsters = monsterBattleViewModel.monsters;

    return monsters.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: monsters.length,
            itemBuilder: (context, index) =>
                MonsterHeaderCard(monster: monsters[index]),
          )
        : const NoMonsterWidget();
  }
}

class LoadingMonstersWidget extends StatelessWidget {
  const LoadingMonstersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, __) {
          return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.black,
              child: const SizedBox(
                height: 140,
                width: 150,
              ));
        });
  }
}

class NoMonsterWidget extends StatelessWidget {
  const NoMonsterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("No Monsters"),
    );
  }
}
