import 'package:academix/models/back_and_fore_color.dart';
import 'package:flutter/material.dart';

BackAndForeColor getColor({
  required BuildContext context,
  required String colorName,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  switch (colorName) {
    case 'blue':
      return BackAndForeColor(
        backgroundColor: Colors.blue.shade100,
        foregroundColor: Colors.blue,
      );
    case 'red':
      return BackAndForeColor(
        backgroundColor: Colors.red.shade100,
        foregroundColor: Colors.red,
      );
    case 'green':
      return BackAndForeColor(
        backgroundColor: Colors.green.shade100,
        foregroundColor: Colors.green,
      );
    case 'yellow':
      return BackAndForeColor(
        backgroundColor: Colors.yellow.shade100,
        foregroundColor: Colors.yellow,
      );
    case 'purple':
      return BackAndForeColor(
        backgroundColor: Colors.purple.shade100,
        foregroundColor: Colors.purple,
      );
    case 'orange':
      return BackAndForeColor(
        backgroundColor: Colors.orange.shade100,
        foregroundColor: Colors.orange,
      );
    case 'pink':
      return BackAndForeColor(
        backgroundColor: Colors.pink.shade100,
        foregroundColor: Colors.pink,
      );
    case 'brown':
      return BackAndForeColor(
        backgroundColor: Colors.brown.shade100,
        foregroundColor: Colors.brown,
      );
    case 'gray':
      return BackAndForeColor(
        backgroundColor: Colors.grey.shade100,
        foregroundColor: Colors.grey,
      );
    case 'cyan':
      return BackAndForeColor(
        backgroundColor: Colors.cyan.shade100,
        foregroundColor: Colors.cyan,
      );
    default:
      return BackAndForeColor(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      );
  }
}
