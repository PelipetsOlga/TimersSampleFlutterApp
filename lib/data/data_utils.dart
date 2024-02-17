import 'dart:math';

import 'package:intl/intl.dart';

String generateId() {
  var rng = Random();
  var generatedId = rng.nextInt(9000) + 1000;
  return "$generatedId";
}

int mockDeadline(int day, int month, int year) {
  DateTime time = DateTime(year, month = month, day = day);
  return time.millisecondsSinceEpoch;
}

String getDate(int millis){
  var dt = DateTime.fromMillisecondsSinceEpoch(millis);

  var date = DateFormat('MM/dd/yyyy').format(dt);
  return date;
}
