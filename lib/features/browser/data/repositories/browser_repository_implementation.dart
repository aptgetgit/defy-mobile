import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../domain/entities/browser_state.dart';

class BrowserRepositoryImpl implements IBrowserRepository {
  final InAppWebViewController controller;
  
  BrowserRepositoryImpl(this.controller);

  @override
  Future<void> loadUrl(String url) async {
    await controller.loadUrl(
      urlRequest: URLRequest(url: WebUri(url))
    );
  }

  @override
  Future<void> goBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
    }
  }

  @override
  Future<void> goForward() async {
    if (await controller.canGoForward()) {
      await controller.goForward();
    }
  }

  @override
  Future<void> reload() async {
    await controller.reload();
  }
}
