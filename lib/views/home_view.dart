import 'package:flutter/material.dart';
import 'package:timer_game/views/game_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
          ),
          Text(
            "타이밍 게임",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            height: 200,
          ),
          ElevatedButton(
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GameView(),
                ),
              );
            },
            child: Text(
              "게임 시작",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              ),
            ),
            onPressed: () {},
            child: Text(
              "통계",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Container(
            height: 50,
          )
        ],
      ),
    );
  }
}
