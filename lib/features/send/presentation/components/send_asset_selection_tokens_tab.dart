// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/models/selectable_item_model.dart';
import '../../domain/models/token_model.dart';
import '../providers/send_provider.dart';
import '../screens/send_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:defy/features/send/presentation/widgets/send/send_token_tile.dart';

import '../../domain/models/selectable_item_model.dart';
import '../widgets/send/send_token_tile.dart';

class SendAssetSelectionTokensTab<T extends SelectableItem>
    extends ConsumerWidget {
  final bool isSelectionMode;
  final List<T> selectedToItems;
  final List<Token> tokens;

  const SendAssetSelectionTokensTab({
    required this.tokens,
    required this.selectedToItems,
    super.key,
    required this.isSelectionMode,
 
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendAssetController =
        ref.watch(sendAssetSelectionScreenProvider.notifier);
    final sendAssetState = ref.watch(sendAssetSelectionScreenProvider);

    return ListView(
      children: [
        const Gap(20),
        ...tokens.asMap().entries.map((entry) {
          final index = entry.key;
          final token = entry.value;

          return GestureDetector(
            onTap: () {
              if (isSelectionMode) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendToken(
                      selectedToItems: selectedToItems,
                      selectedToken: token,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendToken(
                      selectedToItems: selectedToItems,
                      selectedToken: token,
                    ),
                  ),
                );
              }
            },
            child: SendTokenTile(
                asset: token.tokenImage,
                heading: token.tokenName!,
                subHeading: token.tokenBalance!,
                isSelectionMode: isSelectionMode,
                tileSelected: sendAssetState.tileSelected.length > index
                    ? sendAssetState.tileSelected[index]
                    : false,
                value: "\$${token.tokenPrice!}",
                selectTile: () => sendAssetController.selectTile(index, token)),
          );
        }),
      ],
    );
  }
}
