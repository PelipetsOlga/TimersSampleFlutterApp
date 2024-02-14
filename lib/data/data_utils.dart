import 'dart:math';

String generateId() {
  var rng = Random();
  var generatedId = rng.nextInt(9000) + 1000;
  return "$generatedId";
}

int mockDeadline(int day, int month, int year) {
  DateTime time = DateTime(year, month = month, day = day);
  return time.millisecondsSinceEpoch;
}
