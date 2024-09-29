class OptionsDeckMap {
  final bool infiniteCards;
  final bool resetVisibility;
  final bool isCountedNextTurn;

  OptionsDeckMap({
    this.infiniteCards = false,
    this.resetVisibility = true,
    this.isCountedNextTurn = true,
  });

  factory OptionsDeckMap.init() {
    return OptionsDeckMap(
        infiniteCards: false, resetVisibility: true, isCountedNextTurn: true);
  }

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'infiniteCards': infiniteCards,
      'resetVisibility': resetVisibility,
      'isCountedNextTurn': isCountedNextTurn,
    };
  }

  // Create a Movie object from a Map object
  factory OptionsDeckMap.fromMap(Map<String, dynamic> map) {
    return OptionsDeckMap(
      infiniteCards: map['infiniteCards'] ?? false,
      resetVisibility: map['resetVisibility'] ?? false,
      isCountedNextTurn: map['isCountedNextTurn'] ?? true,
    );
  }
}
