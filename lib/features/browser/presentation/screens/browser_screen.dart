import 'dart:async';
import 'dart:collection';
import 'dart:convert';
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
    _loadWalletScript = rootBundle.loadString('assets/js/wallet.js');
  }

  void _setupJavaScriptHandlers(InAppWebViewController controller) {
    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..addJavaScriptHandler(
        handlerName: 'getConfig',
        callback: (List args) async {
          final ByteData imageData =
              await rootBundle.load('assets/icons/app-icon.png');
          final Uint8List bytes = imageData.buffer.asUint8List();
          final String base64Icon =
              'data:image/png;base64,${base64Encode(bytes)}';

          return <String, Object>{
            'url': 'https://avex.id/defy',
            'name': 'Defy',
            'icon': base64Icon,
            'chains': <String>[
              'aptos:devnet',
              'aptos:testnet',
              'aptos:localnet',
              'aptos:mainnet',
            ],
          };
        },
      );

    // // Handler for getting account info
    // ..addJavaScriptHandler(
    //   handlerName: 'getAccount',
    //   callback: (List args) async {
    //     // Implement your account fetching logic here
    //     return <String, Object>{
    //       'accountAddress': 'your_account_address',
    //       'publicKey': 'your_public_key',
    //       'chains': <String>['chain1'],
    //       'features': <String>['feature1'],
    //       'signingScheme': 'ed25519',
    //       'label': 'Account 1',
    //       'icon': 'your_base64_icon',
    //     };
    //   },
    // );

    // // // Handler for connecting wallet
    // ..addJavaScriptHandler(
    //   handlerName: 'connect',
    //   callback: (List args) async {
    //     try {
    //       return <String, String>{
    //         'accountAddress': 'connected_address',
    //         'publicKey': 'public_key',
    //       };
    //     } catch (e) {
    //       throw Exception('Connection failed: $e');
    //     }
    //   },
    // );

    // // Handler for getting network info
    // controller.addJavaScriptHandler(
    //   handlerName: 'getNetwork',
    //   callback: (List args) async => <String, String>{
    //       'name': 'mainnet',
    //       'chainId': '1',
    //       // ... other network properties
    //     },
    // );

    // // Handler for disconnect
    // controller.addJavaScriptHandler(
    //   handlerName: 'disconnect',
    //   callback: (List args) async {
    //     // Implement your disconnect logic here
    //   },
    // );

    // // Handler for signing transactions
    // controller.addJavaScriptHandler(
    //   handlerName: 'signTransaction',
    //   callback: (List args) async {
    //     final transaction = args[0]['transaction'];
    //     final asFeePayer = args[0]['asFeePayer'] ?? false;
    //     // Implement your transaction signing logic here
    //     return <String, String>{
    //       'signature': 'signed_transaction_data',
    //       // ... other signature properties
    //     };
    //   },
    // );

    // // Handler for signing messages
    // controller.addJavaScriptHandler(
    //   handlerName: 'signMessage',
    //   callback: (List args) async {
    //     final message = args[0];
    //     // Implement your message signing logic here
    //     return <String, String>{
    //       'signature': 'signed_message_data',
    //       // ... other signature properties
    //     };
    //   },
    // );

    // // Handler for network changes
    // controller.addJavaScriptHandler(
    //   handlerName: 'onNetworkChange',
    //   callback: (List args) async {
    //     // Implement your network change logic here
    //   },
    // );

    // // Handler for account changes
    // controller.addJavaScriptHandler(
    //   handlerName: 'onAccountChange',
    //   callback: (List args) async {
    //     // Implement your account change logic here
    //   },
    // );

    // // Handler for changing network
    // controller.addJavaScriptHandler(
    //   handlerName: 'changeNetwork',
    //   callback: (List args) async {
    //     // Implement your network change logic here
    //     return <String, String>{
    //       'name': 'new_network',
    //       'chainId': 'new_chain_id',
    //     };
    //   },
    // );

    // // Handler for signing and submitting transactions
    // controller.addJavaScriptHandler(
    //   handlerName: 'signAndSubmitTransaction',
    //   callback: (List args) async {
    //     final transaction = args[0];
    //     // Implement your sign and submit logic here
    //     return <String, String>{
    //       'hash': 'transaction_hash',
    //       // ... other transaction properties
    //     };
    //   },
    // );
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
                      'https://avex-id.github.io/aptos-wallet-adapter/',
                    ),
                  ),
                  initialUserScripts:
                      UnmodifiableListView<UserScript>(<UserScript>[
                    UserScript(
                      source: snapshot.data!,
                      injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
                    ),
                  ]),
                  onWebViewCreated: (InAppWebViewController controller) {
                    _controller = controller;
                    _setupJavaScriptHandlers(controller);
                  },
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
