// import 'package:defy/features/dashboard/presentation/utils/enums.dart';
// import 'package:defy/features/shared/domain/entities/user_wallet_token.dart';
// import 'package:defy/features/shared/presentation/providers/token_metadata_notifier_provider.dart';
// import 'package:defy/features/shared/presentation/providers/user_wallet_tokens_notifier_provider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'generated/token_provider.g.dart';

// @riverpod
// class Token extends _$Token {
//   List<UserWalletToken>? build() {
//     final userWalletTokens = ref.watch(userWalletTokensProvider).value;
//     final filter = ref.watch(tokenFilterProvider);

//     if(userWalletTokens == null || userWalletTokens.isEmpty) return null;

//     switch (filter) {
//       case Filter.balance:
//         final filteredTokens = 
//         break;
//       default:
//     }
//   }

//   void filterByBalance(List<UserWalletToken> userWalletTokens) {
//     final tokensMetaData = userWalletTokens.map((token) {
//       final metaData = ref.read(tokenMetaDataProvider(token.assetType));
//       return metaData.value;
//     }).toList();
//     final filteredMetaData = 
//   }
// }

// @riverpod
// class TokenFilter extends _$TokenFilter {
//   Filter build() {
//     return Filter.balance;
//   }

//   void setFilter(Filter filter) {
//     state = filter;
//   }
// }