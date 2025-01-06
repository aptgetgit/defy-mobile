import 'package:defy/features/browser/domain/browser_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/browser_view_provider.g.dart';

@Riverpod(keepAlive: true)
class BrowserViewProvider extends _$BrowserViewProvider {
  @override
  BrowserStateModel build() {
    return BrowserStateModel(
        urlController: TextEditingController(),
        urlFocusNode: FocusNode(),
        currentUrl: '',
        bookmarks: []);
  }

  void updateUrlController(TextEditingController urlController) {
    state = state.copyWith(urlController: urlController);
  }

  void onUrlSubmitted(String url, InAppWebViewController webViewController) {
    final formattedUrl = _formatUrl(url);
    webViewController?.loadUrl(
        urlRequest: URLRequest(url: WebUri(formattedUrl)));
  }

  String _formatUrl(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return 'https://$url';
    }
    return url;
  }

  void onBookmarkPressed(BuildContext context) {
    final String currentUrl = state.currentUrl;
    final bool isBookmarked = state.bookmarks.contains(currentUrl);

    if (!isBookmarked) {
      state.bookmarks.add(currentUrl);
      _showBookmarkDialog(
        context,
        'Bookmark Added',
        'The URL has been bookmarked.',
      );
    } else {
      _showBookmarkDialog(
        context,
        'Already Bookmarked',
        'This URL is already in your bookmarks.',
      );
    }
  }

  void _showBookmarkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
