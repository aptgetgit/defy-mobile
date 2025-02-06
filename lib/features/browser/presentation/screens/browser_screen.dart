import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entities/browser_state.dart';
import '../providers/browser_notifier_provider.dart';

class BrowserScreen extends ConsumerStatefulWidget {
  const BrowserScreen({super.key});

  @override
  ConsumerState<BrowserScreen> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends ConsumerState<BrowserScreen> {
  InAppWebViewController? _controller;
  late final Future<String> _loadWalletScript;

  @override
  void initState() {
    super.initState();
    _loadWalletScript = rootBundle.loadString('assets/scripts/wallet.js').then(
          (String walletScript) => '''
     $walletScript

     (function() {
       if (typeof window === "undefined") return;
       const myWallet = new Wallet.DefyWallet();
       Wallet.registerWallet(myWallet);
     })();
   ''',
        );
  }

  @override
  Widget build(BuildContext context) {
    final BrowserState state = ref.watch(browserNotifierProvider);

    return FutureBuilder<String>(
      future: _loadWalletScript,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Browser')),
          body: Column(
            children: <Widget>[
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(
                        'https://avex-id.github.io/aptos-wallet-adapter/'),
                  ),
                  initialUserScripts:
                      UnmodifiableListView<UserScript>(<UserScript>[
                    UserScript(
                      source: snapshot.data!,
                      injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
                    ),
                  ]),
                  onWebViewCreated: (InAppWebViewController controller) =>
                      _controller = controller,
                  onLoadStart:
                      (InAppWebViewController controller, WebUri? url) {
                    if (url != null) {
                      ref
                          .read(browserNotifierProvider.notifier)
                          .updateUrl(url.toString());
                    }
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    ref
                        .read(browserNotifierProvider.notifier)
                        .updateProgress(progress / 100);
                  },
                ),
              ),
              if (state.progress < 1.0)
                LinearProgressIndicator(value: state.progress),
              OverflowBar(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => unawaited(_controller?.goBack()),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () => unawaited(_controller?.reload()),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
