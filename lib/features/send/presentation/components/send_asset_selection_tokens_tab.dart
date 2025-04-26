
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/models/selectable_item_model.dart';
import '../../domain/models/token_model.dart';
import '../providers/send_provider.dart';
import '../screens/send_token.dart';
import '../state/send_asset_selection_screen_state_model.dart';
import '../widgets/send/send_token_tile.dart';

class SendAssetSelectionTokensTab<T extends SelectableItem>
    extends ConsumerWidget {

  const SendAssetSelectionTokensTab({
    required this.tokens,
    required this.selectedToItems,
    required this.isSelectionMode, super.key,
  });
  final bool isSelectionMode;
  final List<T> selectedToItems;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SendAssetSelectionScreen sendAssetController =
        ref.watch(sendAssetSelectionScreenProvider.notifier);
    final SendAssetSelectionScreenState<SelectableItem> sendAssetState = ref.watch(sendAssetSelectionScreenProvider);

    return ListView(
      children: <Widget>[
        ...tokens.asMap().entries.map((MapEntry<int, Token> entry) {
          final int index = entry.key;
          final Token token = entry.value;

          return GestureDetector(
            onTap: () async {
              if (isSelectionMode) {
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SendToken<SelectableItem>(
                      selectedToItems: selectedToItems,
                      selectedToken: token,
                    ),
                  ),
                );
              } else {
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => SendToken<SelectableItem>(
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
                  tileSelected: index < sendAssetState.tileSelected.length &&
                      sendAssetState.tileSelected[index],
                  value: '\$${token.tokenPrice!}',
                  selectTile: () => sendAssetController.selectTile(index, token),
                ),
          );
        }),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty<bool>('isSelectionMode', isSelectionMode))
    ..add(IterableProperty<T>('selectedToItems', selectedToItems))
    ..add(IterableProperty<Token>('tokens', tokens));
  }
}
