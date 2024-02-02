class Validator {
  static String? required(
    dynamic value,
    String message, {
    String? fieldName,
  }) {
    if (value is String || value == null) {
      if (value.toString() == "null") return message;
      if (value.isEmpty) return message;
    }
    return null;
  }
}
