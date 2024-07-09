import 'dart:convert';

extension StringValidator on String {
  // Validation methods
  bool isEmail() {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  bool matchesRegex(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  bool isUrl() {
    return RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    ).hasMatch(this);
  }

  bool isAlpha() {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  bool isAlphaNumeric() {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  bool hasMinLength(int length) {
    return this.length >= length;
  }

  bool hasMaxLength(int length) {
    return this.length <= length;
  }

  bool hasFixedLength(int length) {
    return this.length == length;
  }

  bool isConfirmed(String confirmation) {
    return this == confirmation;
  }

  bool endsWith(String suffix) {
    return this.endsWith(suffix);
  }

  bool startsWith(String prefix) {
    return this.startsWith(prefix);
  }

  bool isSameAs(String other) {
    return this == other;
  }

  bool isNotSameAs(String other) {
    return this != other;
  }

  bool isIn(List<String> list) {
    return list.contains(this);
  }

  bool isNotIn(List<String> list) {
    return !list.contains(this);
  }

  bool isIpAddress() {
    return RegExp(r'^(\d{1,3}\.){3}\d{1,3}$').hasMatch(this);
  }

  bool isUuid() {
    return RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    ).hasMatch(this);
  }

  bool isAscii() {
    return codeUnits.every((c) => c >= 0 && c <= 127);
  }

  bool isCreditCard() {
    return RegExp(
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$',
    ).hasMatch(this);
  }

  bool isHexCode() {
    return RegExp(r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$').hasMatch(this);
  }

  bool isIban() {
    return RegExp(
      r'^([A-Z]{2}[ \-]?[0-9]{2})(?=(?:[ \-]?[A-Z0-9]){9,30}$)((?:[ \-]?[A-Z0-9]{3,5}){2,7})([ \-]?[A-Z0-9]{1,3})?$',
    ).hasMatch(this);
  }

  bool isJwt() {
    return RegExp(r'^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.?[A-Za-z0-9-_.+/=]*$')
        .hasMatch(this);
  }

  bool isCoordinates() {
    return RegExp(
      r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$',
    ).hasMatch(this);
  }

  bool isMobile() {
    return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(this);
  }

  bool isPassport() {
    return RegExp(r'^[A-PR-WY][1-9]\d\s?\d{4}[1-9]$').hasMatch(this);
  }

  bool isPostalCode() {
    // This is a basic postal code regex, you might want to adjust it based on your specific country requirements
    return RegExp(r'^\d{5}(?:[-\s]\d{4})?$').hasMatch(this);
  }

  // Mutation methods
  String trim() {
    return this.trim();
  }

  String normalizeEmail() {
    return this.toLowerCase().trim();
  }

  String normalizeUrl() {
    var normalized = this.toLowerCase().trim();
    if (!normalized.startsWith('http://') &&
        !normalized.startsWith('https://')) {
      normalized = 'https://$normalized';
    }
    return normalized;
  }

  String escape() {
    return htmlEscape.convert(this);
  }

  String toUpperCase() {
    return this.toUpperCase();
  }

  String toCamelCase() {
    final words = split(RegExp('[^a-zA-Z0-9]+'));
    final result = StringBuffer();
    result.write(words[0].toLowerCase());
    for (var i = 1; i < words.length; i++) {
      result.write(
        words[i][0].toUpperCase() + words[i].substring(1).toLowerCase(),
      );
    }
    return result.toString();
  }

  String toLowerCase() {
    return this.toLowerCase();
  }
}
