enum MimeType {
  jpeg('image/jpeg'),
  png('image/png'),
  svg('image/svg+xml');

  const MimeType(this.key);
  final String key;
}

class MimeTypeHelper {
  // Helper function to convert enum to String
  static String mimeTypeToString(MimeType type) {
    return type.key;
  }

  // Helper function to convert String to enum
  static MimeType stringToMimeType(String type) {
    return MimeType.values.firstWhere((e) => mimeTypeToString(e) == type);
  }
}
