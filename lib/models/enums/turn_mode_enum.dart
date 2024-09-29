enum TurnMode {
  normal('normal'),
  none('none');

  const TurnMode(this.key);
  final String key;
}

class TurnModeHelper {
  // Helper function to convert enum to String
  static String turnModeToString(TurnMode type) {
    return type.key;
  }

  // Helper function to convert String to enum
  static TurnMode stringToTurnMode(String type) {
    return TurnMode.values.firstWhere((e) => turnModeToString(e) == type);
  }
}
