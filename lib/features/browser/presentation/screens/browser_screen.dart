import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/logging/app_logger.dart';
import '../../../../shared/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/account/presentation/providers/active_account_provider.dart';
import '../../../../shared/account/presentation/providers/usecase_provider.dart';
import '../../../../shared/network/domain/entities/aptos_network.dart';
import '../../../../shared/network/domain/entities/network_config.dart';
import '../../../../shared/network/presentation/providers/active_network_provider.dart';
import '../../../../shared/network/presentation/providers/network_config_sync_provider.dart';

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
  bool _bridgeInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeBridge();
    _loadWalletScript = rootBundle.loadString('assets/js/wallet.js');
  }

  Future<void> _initializeBridge() async {
    try {
      await InAppWebViewController.setJavaScriptBridgeName('defy');
      setState(() {
        _bridgeInitialized = true;
      });
    } on Exception catch (e) {
      AppLogger.error('Failed to initialize JavaScript bridge: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final BrowserState state = ref.watch(browserNotifierProvider);

    return FutureBuilder<String>(
      future: _loadWalletScript,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!_bridgeInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Failed to load wallet: ${snapshot.error}'),
          );
        }

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
                      'https://explorer.aptoslabs.com/',
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

  void _setupJavaScriptHandlers(InAppWebViewController controller) {
    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..addJavaScriptHandler(
        handlerName: 'getConfig',
        callback: (JavaScriptHandlerFunctionData data) async {
          final ByteData imageData =
              await rootBundle.load('assets/icons/app-icon.png');
          final Uint8List bytes = imageData.buffer.asUint8List();
          final String base64Icon =
              'data:image/png;base64,${base64Encode(bytes)}';
          final AptosAccountWithMetadata? activeAccountAsync =
              await ref.read(activeAccountProvider.future);
          if (activeAccountAsync == null) {
            throw Exception('No account connected');
          }
          final Uint8List accountAddress =
              activeAccountAsync.accountAddress.toBytes();
          final Uint8List publicKey = await ref
              .read(getAccountPrivateKeyUseCaseProvider)
              .call(accountAddress: activeAccountAsync.accountAddress);

          return <String, Object>{
            'url': 'https://avex.id/defy',
            'name': 'Defy',
            'icon': base64Icon,
            'chains': <String>[
              const AptosNetwork.mainnet().toCaipChainId(),
              const AptosNetwork.testnet().toCaipChainId(),
              const AptosNetwork.devnet().toCaipChainId(),
            ],
            'accounts': [
              {
                'accountAddress': accountAddress.toList(),
                'publicKey': publicKey.toList(),
                'chains': <String>[
                  const AptosNetwork.mainnet().toCaipChainId(),
                  const AptosNetwork.testnet().toCaipChainId(),
                  const AptosNetwork.devnet().toCaipChainId(),
                ],
                'features': [
                  'aptos:connect',
                  'aptos:network',
                  'aptos:account',
                  'aptos:disconnect',
                  'aptos:changeNetwork',
                  'aptos:onNetworkChange',
                  'aptos:onAccountChange',
                ],
                'signingScheme': 0,
                'label': activeAccountAsync.label,
                'icon': base64Icon,
              }
            ],
          };
        },
      )

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
      ..addJavaScriptHandler(
        handlerName: 'connect',
        callback: (JavaScriptHandlerFunctionData data) async {
          try {
            final AptosAccountWithMetadata? activeAccountAsync =
                await ref.read(activeAccountProvider.future);
            if (activeAccountAsync == null) {
              throw Exception('No account connected');
            }
            final Uint8List publicKey = await ref
                .read(getAccountPrivateKeyUseCaseProvider)
                .call(accountAddress: activeAccountAsync.accountAddress);
            return <String, Object>{
              'approved': true,
              'data': {
                'accountAddress':
                    activeAccountAsync.accountAddress.toBytes().toList(),
                'publicKey': publicKey.toList(),
              }
            };
          } catch (e) {
            throw Exception('Connection failed: $e');
          }
        },
      )

      // // Handler for getting network info
      ..addJavaScriptHandler(
        handlerName: 'network',
        callback: (JavaScriptHandlerFunctionData data) async {
          final AptosNetwork currentNetwork =
              await ref.read(activeNetworkProvider.future);

          final List<NetworkConfig> networkConfigs =
              await ref.read(networkConfigSyncProvider.future);

          final String rpcUrl = networkConfigs
              .firstWhere(
                (NetworkConfig element) =>
                    element.caipChainId == currentNetwork.toCaipChainId(),
              )
              .rpcUrl
              .toString();
          return <String, Object>{
            'name': currentNetwork.reference,
            'chainId': 1,
            'url': rpcUrl,
          };
        },
      )

      // // // Handler for changing network
      ..addJavaScriptHandler(
        handlerName: 'changeNetwork',
        callback: (JavaScriptHandlerFunctionData data) async {
          AppLogger.fatal("Change network Called");
          final ActiveNetwork activeNetworkNotifier =
              ref.read(activeNetworkProvider.notifier);
          AppLogger.error("data.args.first.name: ${data.args.first.name}");
          final AptosNetwork newNetwork =
              AptosNetwork.fromCaipChainId('aptos:${data.args.first.name}');
          await activeNetworkNotifier.setActiveNetwork(newNetwork);
          // final List<NetworkConfig> networkConfigs =
          //     await ref.read(networkConfigSyncProvider.future);

          // final String rpcUrl = networkConfigs
          //     .firstWhere(
          //       (NetworkConfig element) =>
          //           element.caipChainId == newNetwork.toCaipChainId(),
          //     )
          //     .rpcUrl
          //     .toString();
          return <String, Object>{
            'approved': true,
            'data': {
              'success': true,
            }
          };
        },
      )

      // // Handler for disconnect
      ..addJavaScriptHandler(
        handlerName: 'disconnect',
        callback: (JavaScriptHandlerFunctionData data) async {
          return;
        },
      );

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
    // ..addJavaScriptHandler(
    //   handlerName: 'onNetworkChange',
    //   callback: (List args) async {
    //     final ActiveNetwork activeNetworkNotifier =
    //         ref.read(activeNetworkProvider.notifier);
    //     final AptosNetwork newNetwork =
    //         AptosNetwork.fromCaipChainId('aptos:${args.first.name}');
    //     await activeNetworkNotifier.setActiveNetwork(newNetwork);
    //   },
    // );

    // // Handler for account changes
    // controller.addJavaScriptHandler(
    //   handlerName: 'onAccountChange',
    //   callback: (List args) async {
    //     // Implement your account change logic here
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
}
