enum SourceType {
  network('network'),
  asset('asset');

  const SourceType(this.key);
  final String key;
}

class SourceTypeHelper {
  // Helper function to convert enum to String
  static String sourceTypeToString(SourceType type) {
    return type.key;
  }

  // Helper function to convert String to enum
  static SourceType stringToSourceType(String type) {
    return SourceType.values.firstWhere((e) => sourceTypeToString(e) == type);
  }
}
