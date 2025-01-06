import 'dart:ui';
import 'package:defy/features/browser/provider/browser_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BrowserView extends ConsumerStatefulWidget {
  const BrowserView({Key? key}) : super(key: key);

  @override
  ConsumerState<BrowserView> createState() => _BrowserViewState();
}

class _BrowserViewState extends ConsumerState<BrowserView> {
  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(browserViewProviderProvider);
    state.urlFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    final state = ref.read(browserViewProviderProvider);
    state.urlController.dispose();
    state.urlFocusNode.removeListener(_onFocusChange);
    state.urlFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(browserViewProviderProvider);
    final controller = ref.watch(browserViewProviderProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: _buildUrlBar(state, controller),
        actions: [_buildActions(state, controller)],
      ),
      body: _buildWebView(state, controller),
    );
  }

  Widget _buildUrlBar(state, controller) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: state.urlFocusNode.hasFocus
                ? Border.all(color: Colors.black, width: 1)
                : null,
          ),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: state.urlController,
                  focusNode: state.urlFocusNode,
                  cursorColor: Colors.black,
                  onSubmitted: (url) =>
                      controller.onUrlSubmitted(url, webViewController),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search or type URL',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActions(state, controller) {
    return state.urlFocusNode.hasFocus
        ? TextButton(
            onPressed: () {
              state.urlController.clear();
              state.urlFocusNode.unfocus();
            },
            child: const Text('Cancel',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
          )
        : IconButton(
            icon: Icon(state.bookmarks.contains(state.currentUrl)
                ? PhosphorIconsFill.bookmark
                : PhosphorIconsRegular.bookmark),
            onPressed: () => controller.onBookmarkPressed(context),
          );
  }

  Widget _buildWebView(state, controller) {
    print("Building WebView"); // Add this debug print
    return Column(
      children: [
        Expanded(
          child: InAppWebView(
            initialUrlRequest:
                URLRequest(url: WebUri("https://vibrantx.finance")),
            onWebViewCreated: (controller) {
              print("WebView created"); // Add this debug print
              _onWebViewCreated(controller);
            },
            shouldOverrideUrlLoading: _shouldOverrideUrlLoading,
            onLoadStop: (controller, url) {
              print("WebView loaded: $url"); // Add this debug print
              _onLoadStop(state, url);
            },
            onLoadError: (controller, url, code, message) {
              print("WebView error: $code - $message"); // Add this debug print
            },
          ),
        ),
        _buildNavigationBar(),
      ],
    );
  }

  void _onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
    setupWalletHandlers(controller);
  }

  Future<NavigationActionPolicy> _shouldOverrideUrlLoading(
      InAppWebViewController controller,
      NavigationAction navigationAction) async {
    final uri = navigationAction.request.url;
    if (uri != null &&
        uri.host == "chrome.google.com" &&
        uri.path.contains("webstore")) {
      return NavigationActionPolicy.CANCEL;
    }
    return NavigationActionPolicy.ALLOW;
  }

  void _onLoadStop(state, WebUri? url) {
    if (url != null) {
      setState(() {
        state.currentUrl = url.toString();
        state.urlController.text = state.currentUrl;
      });
    }
  }

  Widget _buildNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => webViewController?.goBack()),
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => webViewController?.reload()),
          IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => webViewController?.goForward()),
        ],
      ),
    );
  }

  void setupWalletHandlers(InAppWebViewController controller) {
    final handlers = {
      'connectWalletHandler': (args) => _handleWalletAction('connect', args),
      'disconnectWalletHandler': (args) =>
          _handleWalletAction('disconnect', args),
      'getAccountHandler': (args) => _handleWalletAction('getAccount', args),
      'getNetworkHandler': (args) => _handleWalletAction('getNetwork', args),
      'signTransactionHandler': (args) =>
          _handleWalletAction('signTransaction', args),
      'signMessageHandler': (args) => _handleWalletAction('signMessage', args),
      'onAccountChangeHandler': (args) =>
          _handleWalletAction('onAccountChange', args),
      'onNetworkChangeHandler': (args) =>
          _handleWalletAction('onNetworkChange', args),
      'signAndSubmitTransactionHandler': (args) =>
          _handleWalletAction('signAndSubmitTransaction', args),
      'changeNetworkHandler': (args) =>
          _handleWalletAction('changeNetwork', args),
    };

    handlers.forEach((name, handler) {
      controller.addJavaScriptHandler(handlerName: name, callback: handler);
    });

    controller.evaluateJavascript(source: _getWalletJavaScript());
  }

  dynamic _handleWalletAction(String action, List<dynamic> args) {
    print("aptos:$action called with args: $args");
    // Implement actual wallet logic here
    return {'status': 'success', 'message': '$action completed'};
  }

  String _getWalletJavaScript() {
    return """
      window.petra = {
        connect: (silent = false, networkInfo = {}) => window.flutter_inappwebview.callHandler('connectWalletHandler', {silent, networkInfo}),
        disconnect: () => window.flutter_inappwebview.callHandler('disconnectWalletHandler'),
        getAccount: () => window.flutter_inappwebview.callHandler('getAccountHandler'),
        getNetwork: () => window.flutter_inappwebview.callHandler('getNetworkHandler'),
        signTransaction: (transaction) => window.flutter_inappwebview.callHandler('signTransactionHandler', transaction),
        signMessage: (message) => window.flutter_inappwebview.callHandler('signMessageHandler', {message}),
        onAccountChange: (newAccount) => window.flutter_inappwebview.callHandler('onAccountChangeHandler', newAccount),
        onNetworkChange: (newNetwork) => window.flutter_inappwebview.callHandler('onNetworkChangeHandler', newNetwork),
        signAndSubmitTransaction: (transactionDetails) => window.flutter_inappwebview.callHandler('signAndSubmitTransactionHandler', transactionDetails),
        changeNetwork: (networkInfo) => window.flutter_inappwebview.callHandler('changeNetworkHandler', networkInfo)
      };
    """;
  }
}
