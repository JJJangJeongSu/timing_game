import 'package:flutter/material.dart';

class GuessResult extends StatelessWidget {
  GuessResult({
    super.key,
    required this.targetTime,
    required this.userGuess,
    required this.availableTime,
  });

  Duration targetTime;
  Duration userGuess;
  int availableTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("사용자 예측: ${userGuess.inMilliseconds}"),
        Text("차이: ${(targetTime - userGuess).inMilliseconds}"),
        Text("허용 차이: $availableTime"),
      ],
    );
  }
}
