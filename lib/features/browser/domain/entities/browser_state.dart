class BrowserState {
  final String currentUrl;
  final double progress;

  BrowserState({
    required this.currentUrl,
    this.progress = 0,
  });
}

// domain/i_browser_repository.dart
abstract class IBrowserRepository {
  Future<void> loadUrl(String url);
  Future<void> goBack();
  Future<void> goForward();
  Future<void> reload();
}
