class ScoreModel {
  int totalScore;
  int life;
  int validTimeRange;

  ScoreModel({this.totalScore = 0, this.life = 0, this.validTimeRange = 2000});

  int get score => totalScore;
  int get curLife => life;
  int get timeRange => validTimeRange;

  void reset() {
    totalScore = 0;
    life = 3;
    validTimeRange = 2000;
  }

  void addScore(int score) {
    totalScore += score;
  }

  void loseLife() {
    life--;
  }

  void updateStage() {
    validTimeRange = validTimeRange * 7 ~/ 10;
    addScore(1);
  }
}
