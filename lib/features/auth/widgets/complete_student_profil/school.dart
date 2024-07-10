import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SchoolInfo extends HookConsumerWidget {
  const SchoolInfo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('SchoolInfo'));
  }
}
