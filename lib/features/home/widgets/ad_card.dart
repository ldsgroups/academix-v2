import 'package:academix/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdCard extends ConsumerWidget {
  const AdCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 110,
      child: Card(
        elevation: 3,
        shape: roundedShape(),
        color: colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Que voulez-vous apprendre aujourd'hui ?",
                style: TextStyle(color: colorScheme.onPrimary),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    colorScheme.primaryContainer,
                  ),
                ),
                child: Text(
                  'Continuons',
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
