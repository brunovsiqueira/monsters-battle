import 'package:flutter/material.dart';

class MonsterPowerBarChartWidget extends StatelessWidget {
  final String monsterAttributeName;
  final int monsterAttributeValue;
  const MonsterPowerBarChartWidget({
    required this.monsterAttributeName,
    required this.monsterAttributeValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double width = 360;
    const double height = 10;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          monsterAttributeName,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 4,
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 2.0),
                        color: Color.fromRGBO(0, 0, 0, 0.25))
                  ],
                  color: const Color.fromRGBO(217, 217, 217, 1)),
            ),
            Container(
              width: (monsterAttributeValue / 100) * width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: const Color.fromRGBO(0, 255, 0, 1)),
            )
          ],
        )
      ],
    );
  }
}
