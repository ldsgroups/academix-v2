import 'package:academix/core/utils/rounded_shape.dart';
import 'package:flutter/material.dart';

class CsButton extends StatelessWidget {
  const CsButton({
    super.key,
    required this.text,
    required this.onPress,
    this.icon,
    this.isDisabled = false,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPress;
  final Widget? icon;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton.icon(
      onPressed: isDisabled ? null : onPress,
      label: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
              strokeAlign: BorderSide.strokeAlignInside,
              strokeWidth: 2,
              semanticsValue: 'Loading',
              semanticsLabel: 'Loading',
              strokeCap: StrokeCap.butt,
            )
          : Text(text, style: const TextStyle(fontSize: 16)),
      icon: icon,
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 48)),
        shape: WidgetStatePropertyAll(roundedShape()),
        backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
        foregroundColor: WidgetStatePropertyAll(colorScheme.onPrimary),
      ),
    );
  }
}
