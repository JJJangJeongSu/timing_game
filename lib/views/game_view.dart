import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer_game/models/score_model.dart';
import 'package:timer_game/utils/time_calculator.dart';
import 'package:timer_game/widgets/guess_result.dart';
import 'package:timer_game/widgets/life_widget.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  bool _isRunning = false;
  bool _initialState = true;
  int? _displayedSecond;
  Duration? _targetTime;
  Duration? _elapsedTime;
  DateTime? _startTime;
  int? _vaildTimeRange;
  ScoreModel scoreModel = ScoreModel();

  @override
  void initState() {
    super.initState();
    scoreModel.reset();
  }

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });
    if (_initialState) _initialState = false;

    if (!_isRunning) {
      setState(() {
        _vaildTimeRange = scoreModel.validTimeRange;
        _elapsedTime =
            TimeCalculator().calDuration(DateTime.now(), _startTime!);
      });

      if ((_targetTime! - _elapsedTime!).abs().inMilliseconds <=
          scoreModel.timeRange) {
        print("성공");
        scoreModel.updateStage();
      } else {
        setState(() {
          scoreModel.loseLife();
        });

        if (scoreModel.life == 0) {
          _showResult();
        }
      }
    } else {
      _startTime = DateTime.now();
      _generateRandomDuration();
    }
  }

  void _generateRandomDuration() {
    double targetDuration = Random().nextDouble() * 3 + 4;

    _targetTime = Duration(seconds: targetDuration.toInt());

    setState(() {
      _displayedSecond = _targetTime!.inSeconds;
    });
  }

  void _showResult() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("결과"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("점수: ${scoreModel.score}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName("/"));
            },
            child: Text("홈 화면"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                scoreModel.reset();
                _initialState = true;
                _isRunning = false;
              });
            },
            child: Text("다시 하기"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName("/"));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "점수: ${scoreModel.score}",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
          ),
          Text(
            "맞추기",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Container(
            height: 100,
            width: 200,
            child: !_initialState ? Text("$_displayedSecond초 맞춰봐") : null,
          ),
          if (!_initialState && !_isRunning)
            GuessResult(
              targetTime: _targetTime!,
              userGuess: _elapsedTime!,
              availableTime: _vaildTimeRange!,
            ),
          LifeWidget(lifeCount: scoreModel.life),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            ),
            onPressed: () {
              _toggleTimer();
            },
            child: Text(
              !_isRunning ? "Start" : "Stop",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Container(
            height: 50,
          ),
        ],
      ),
    );
  }
}
