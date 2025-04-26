import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../domain/models/nft_model.dart';
import '../../domain/models/selectable_item_model.dart';
import '../../domain/models/token_model.dart';
import '../../domain/models/user_model.dart';
import '../components/send_asset_selection_nfts_tab.dart';
import '../components/send_asset_selection_tab_bar.dart';
import '../components/send_asset_selection_tokens_tab.dart';

class SendAssetSelection<T extends SelectableItem>
    extends ConsumerStatefulWidget {
  const SendAssetSelection({
    required this.selectedToItems,
    super.key,
  });
  final List<T> selectedToItems;

  @override
  @override
  SendAssetSelectionState<T> createState() => SendAssetSelectionState<T>();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<T>('selectedToItems', selectedToItems));
  }
}

class SendAssetSelectionState<T extends SelectableItem>
    extends ConsumerState<SendAssetSelection<T>>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Token> tokens = <Token>[
      Token(
        tokenImage: 'assets/images/aptos.png',
        tokenName: 'Aptos',
        tokenBalance: '7 Aptos',
        tokenPrice: '22.12',
        tokenSymbol: 'APT',
      ),
      Token(
        tokenImage: 'assets/images/ethereum.png',
        tokenName: 'Ethereum',
        tokenBalance: '0.023 ETH',
        tokenPrice: '672',
        tokenSymbol: 'ETH',
      ),
      Token(
        tokenImage: 'assets/images/polygon.png',
        tokenName: 'Polygon',
        tokenBalance: '8 Matic',
        tokenPrice: '54.09',
        tokenSymbol: 'MATIC',
      ),
      Token(
        tokenImage: 'assets/images/dai.png',
        tokenName: 'Dai',
        tokenBalance: '12 DAI',
        tokenPrice: '21',
        tokenSymbol: 'DAI',
      ),
      Token(
        tokenImage: 'assets/images/usdc.png',
        tokenName: 'USDC',
        tokenBalance: '91 USDC',
        tokenPrice: '90.21',
        tokenSymbol: 'USDC',
      ),
    ];

    final List<NFT> nfts = <NFT>[
      NFT(
        assetPath: 'assets/images/nft.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  const Text(
                    'Send',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox.shrink(),
                ],
              ),
              const Gap(20),
              _buildToField(),
              const Gap(18),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SendAssetSelectionTabBar(
                      controller: _tabController,
                      isMulti: false,
                      isSelectionMode: false,
                      onTap: () {},
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          SendAssetSelectionTokensTab<SelectableItem>(
                            tokens: tokens,
                            selectedToItems: widget.selectedToItems,
                            isSelectionMode: false,
                          ),
                          SendAssetSelectionNFTsTab<SelectableItem>(
                            nfts: nfts,
                            selectedToItems: widget.selectedToItems,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToField() => Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Center(
          child: Row(
            children: <Widget>[
              const Gap(16),
              const Text(
                'To',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(20),
              RowSuper(
                innerDistance: -24,
                children: <Widget?>[
                  ...widget.selectedToItems.map((T selectableItem) {
                    if (selectableItem is UserModel) {
                      return Image(
                        height: 32,
                        width: 32,
                        image: AssetImage(selectableItem.asset),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                ],
              ),
              const Gap(4),
              if (widget.selectedToItems.isNotEmpty)
                Text(
                  _buildSelectedText()!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.greyLight,
                  ),
                ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(11),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Icon(
                      PhosphorIcons.plus(PhosphorIconsStyle.bold),
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  String? _buildSelectedText() {
    final T firstItem = widget.selectedToItems.first;

    if (firstItem is UserModel) {
      return widget.selectedToItems.length > 1
          ? '${firstItem.userName} +${widget.selectedToItems.length - 1} others'
          : firstItem.userName;
    } else {
      return '';
    }
  }
}
