// Add these providers to your providers file

// Provider for controlling search icon visibility
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchIconVisibilityProvider = StateProvider<bool>((ref) => false);

// Provider for triggering scroll to top
final scrollToTopProvider = StateNotifierProvider<ScrollToTopNotifier, bool>((ref) => ScrollToTopNotifier());

class ScrollToTopNotifier extends StateNotifier<bool> {
  ScrollToTopNotifier() : super(false);

  void scrollToTop() {
    state = true;
    // Reset the state after a short delay
    Future<void>.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        state = false;
      }
    });
  }
}
