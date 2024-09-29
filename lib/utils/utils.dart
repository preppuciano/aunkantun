import 'dart:math';

int getRandomNumber(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min + 1);
}

String getRandomString(int length) {
  final random = Random();
  const chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
}
