import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/ui_provider.g.dart';

@riverpod
class TokenSelection extends _$TokenSelection {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class BalanceFilterVisibility extends _$BalanceFilterVisibility {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@Riverpod(keepAlive: true)
class BalanceFilter extends _$BalanceFilter {
  @override
  int build() {
    return 1;
  }

  void toggle(int filterIndex) {
    state = filterIndex;
  }
}