import 'package:defy/features/send/domain/models/nft_model.dart';
import 'package:defy/features/send/domain/models/selectable_item_model.dart';
import 'package:defy/features/send/presentation/providers/send_provider.dart';
import 'package:defy/features/send/presentation/screens/send_nft_page.dart';
import 'package:defy/features/send/presentation/widgets/send/send_nft_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SendAssetSelectionNFTsTab<T extends SelectableItem>
    extends ConsumerWidget {
  final List<NFT> nfts;
  final List<T> selectedToItems;

  const SendAssetSelectionNFTsTab({
    required this.nfts,
    required this.selectedToItems,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendAssetController =
        ref.watch(sendAssetSelectionScreenProvider.notifier);
    final sendAssetState = ref.watch(sendAssetSelectionScreenProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/nft-5.png',
                  height: 20,
                ),
              ),
              const Gap(10),
              const Text(
                'Aptos Monkeys',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                nfts.length.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const Gap(10),
              const Icon(
                PhosphorIconsRegular.caretUp,
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemCount: nfts.length,
              itemBuilder: (context, index) {
                final nft = nfts[index];
                final isChecked = index < sendAssetState.tileSelected.length
                    ? sendAssetState.tileSelected[index]
                    : false;

                return GestureDetector(
                  onTap: () {
                    if (sendAssetState.isSelectionMode) {
                      sendAssetController.selectTile(index, nft);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SendNFTPage(
                              selectedToItems: selectedToItems,
                              selectedNfts: [nft],
                              isMulti: false,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: SendNftTile(
                    isSelectionMode: sendAssetState.isSelectionMode,
                    assetPath: nft.assetPath,
                    isChecked: isChecked,
                    onTap: () {
                      sendAssetController.selectTile(index, nft);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
