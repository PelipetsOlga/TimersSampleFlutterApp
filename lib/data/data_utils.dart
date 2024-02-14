import 'dart:math';

int generateId() {
  var rng = Random();
  var generatedId = rng.nextInt(9000) + 1000;
  return generatedId;
}
