import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/explore_ui_provider.g.dart';

@riverpod
class CoinsAnimationIndex extends _$CoinsAnimationIndex {
  late Timer _timer;

  @override
  int build() {
    _startTimer();
    return 0;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 650), (timer) {
      state = (state + 1) % 4; 
    });
  }
}