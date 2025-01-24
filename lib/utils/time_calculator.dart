class TimeCalculator {
  Duration calDuration(DateTime endTime, DateTime startTime) {
    return endTime.difference(startTime);
  }

  Duration calDurDiff(Duration targetTime, Duration userGuess) {
    return (userGuess - targetTime).abs();
  }
}
