// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'generated/aptos_network.freezed.dart';

// @freezed
// sealed class AptosNetwork with _$AptosNetwork {
//   factory AptosNetwork.fromCaipChainId(String caipChainId) {
//     final List<String> parts = caipChainId.split(':');
//     if (parts.length != 2) {
//       throw ArgumentError.value(
//         caipChainId,
//         'caipChainId',
//         'Invalid CAIP chain ID',
//       );
//     }
//     final String namespace = parts[0];
//     final String reference = parts[1];

//     if (namespace != 'aptos') {
//       throw ArgumentError.value(namespace, 'namespace', 'Invalid namespace');
//     }

//     return switch (reference) {
//       'mainnet' => const AptosNetwork.mainnet(),
//       'testnet' => const AptosNetwork.testnet(),
//       'devnet' => const AptosNetwork.devnet(),
//       _ =>
//         throw ArgumentError.value(reference, 'reference', 'Invalid reference'),
//     };
//   }

//   const AptosNetwork._();
//   const factory AptosNetwork.mainnet() = AptosMainnet;
//   const factory AptosNetwork.testnet() = AptosTestnet;
//   const factory AptosNetwork.devnet() = AptosDevnet;

//   String get namespace => 'aptos';

//   String get reference => switch (this) {
//         AptosMainnet() => 'mainnet',
//         AptosTestnet() => 'testnet',
//         AptosDevnet() => 'devnet',
//       };

//   String get displayName => switch (this) {
//         AptosMainnet() => 'Mainnet',
//         AptosTestnet() => 'Testnet',
//         AptosDevnet() => 'Devnet',
//       };

//   String toCaipChainId() => '$namespace:$reference';

//   @override
//   String toString() => 'AptosNetwork(${toCaipChainId()})';
// }
