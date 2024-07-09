import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_state_notifier.g.dart';

@riverpod
class UserStateNotifier extends _$UserStateNotifier {
  @override
  AsyncValue<String?> build() => const AsyncValue.data(null);
}
