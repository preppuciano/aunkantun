enum DeckType {
  base('base'),
  community('community');

  const DeckType(this.key);
  final String key;
}

class DeckTypeHelper {
  // Helper function to convert enum to String
  static String deckTypeToString(DeckType type) {
    return type.key;
  }

  // Helper function to convert String to enum
  static DeckType stringToDeckType(String type) {
    return DeckType.values.firstWhere((e) => deckTypeToString(e) == type);
  }
}
