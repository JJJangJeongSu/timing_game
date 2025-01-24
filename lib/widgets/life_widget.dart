import 'package:flutter/material.dart';

class LifeWidget extends StatelessWidget {
  LifeWidget({super.key, required this.lifeCount});
  int lifeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          3 - lifeCount,
          (int idx) => const Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
        ),
        ...List.generate(
          lifeCount,
          (int idx) => const Icon(
            Icons.favorite,
            color: Colors.pink,
          ),
        )
      ],
    );
  }
}
