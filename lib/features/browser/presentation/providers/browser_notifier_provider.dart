import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/browser_state.dart';
part 'generated/browser_notifier_provider.g.dart';
@riverpod
class BrowserNotifier extends _$BrowserNotifier {
  @override
  BrowserState build() => BrowserState(currentUrl: '');

  void updateUrl(String url) {
    state = BrowserState(currentUrl: url, progress: state.progress);
  }

  void updateProgress(double progress) {
    state = BrowserState(currentUrl: state.currentUrl, progress: progress);
  }
}
