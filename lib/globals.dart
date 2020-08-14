import 'dart:math' as math;

double thresholdHeight = 900;

String getDms(double location) {
  String result = '';

  double degree = location.toInt().toDouble();

  double minute = (location.toInt().toDouble() - location) * 60;

  minute = minute.toInt().toDouble();

  return result;
}
