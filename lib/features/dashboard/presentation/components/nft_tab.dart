import 'package:defy/features/dashboard/presentation/widgets/nft_tab/nft_tile.dart';
import 'package:defy/features/shared/presentation/providers/user_wallet_nft_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NFTTab extends ConsumerStatefulWidget {
  const NFTTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NFTTabState();
}

class _NFTTabState extends ConsumerState<NFTTab> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userWalletNFTs = ref.watch(userWalletNFTListProvider);
    return userWalletNFTs.when(
      data: (nfts) {
        if (nfts == null) {
          return const Center(child: Text('null values'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: nfts.length,
          itemBuilder: (ctx, index) {
            return NftTile(nfts: nfts[index]);
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
