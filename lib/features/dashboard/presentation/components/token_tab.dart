import 'package:defy/features/dashboard/presentation/widgets/token_tab/token_tile.dart';
import 'package:defy/features/shared/presentation/providers/user_wallet_tokens_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenTab extends ConsumerStatefulWidget {
  const TokenTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TokenTabState();
}

class _TokenTabState extends ConsumerState<TokenTab> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userWalletTokens = ref.watch(userWalletTokensProvider);
    return userWalletTokens.when(
      data: (tokens) {
        if (tokens == null) {
          return const Center(child: Text('null values'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: tokens.length,
          itemBuilder: (ctx, index) {
            return TokenTile(token : tokens[index]);
          },
        );
      },
      error: (e, st) {
        return const Center(
          child: Text('Error'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
