import 'package:flutter/services.dart';

/// A [TextInputFormatter] that dynamically formats phone numbers.
///
/// This formatter allows you to specify a custom formatting pattern using
/// the "#" character as a placeholder for digits.
///
/// Example:
///
/// To format North American phone numbers (e.g., "(123) 456-7890"), use:
///
/// ```dart
/// PhoneNumberTextInputFormatter('(###) ###-####')
/// ```
///
/// To format European phone numbers (e.g., "123 456 78 90"), use:
///
/// ```dart
/// PhoneNumberTextInputFormatter('### ### ## ##')
/// ```
class PhoneNumberTextInputFormatter extends TextInputFormatter {
  PhoneNumberTextInputFormatter(this.format);

  final String format;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text;
    final newTextLength = newText.length;
    final buffer = StringBuffer();

    int formatIndex = 0;
    int textIndex = 0;

    while (textIndex < newTextLength) {
      if (formatIndex < format.length && format[formatIndex] != '#') {
        buffer.write(format[formatIndex]);
        formatIndex++;
      } else if (formatIndex < format.length &&
          newText[textIndex].runes.single.isDigit && // Correct usage here
          format[formatIndex] == '#') {
        buffer.write(newText[textIndex]);
        formatIndex++;
        textIndex++;
      } else {
        // Skip non-numeric characters or format characters that are out of bounds
        textIndex++;
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

extension on int {
  bool get isDigit => this >= 48 && this <= 57;
}
