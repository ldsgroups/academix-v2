import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreferenceInfo extends HookConsumerWidget {
  const PreferenceInfo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('PreferenceInfo'));
  }
}
