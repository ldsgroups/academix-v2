import 'package:academix/core/core.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  final colorScheme = Theme.of(context).colorScheme;

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.secondaryContainer,
        behavior: SnackBarBehavior.floating,
        shape: roundedShape(),
        content: Text(
          content,
          style: TextStyle(color: colorScheme.onSecondaryContainer),
        ),
      ),
    );
}
