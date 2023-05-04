import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monsters_battle/view_models/monster_battle_view_model.dart';
import 'package:monsters_battle/widgets/monster_header_widget.dart';
import 'package:flutter/material.dart';

import '../models/monster.dart';

class MonsterListWidget extends ConsumerStatefulWidget {
  const MonsterListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MonsterListWidget> createState() => _MonsterListWidgetState();
}

class _MonsterListWidgetState extends State<MonsterListWidget> {
  List<MonsterModel>? _monsters;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139,
      child: _monsters != null
          ? ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _monsters?.length,
              itemBuilder: (context, index) =>
                  MonsterHeaderCard(monster: _monsters![index]),
            )
          : const Center(
              child: Text("No Monsters"),
            ),
    );
  }
}
