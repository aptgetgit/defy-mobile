import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/features/send/domain/models/nft_model.dart';
import 'package:defy/features/send/domain/models/selectable_item_model.dart';
import 'package:defy/features/send/domain/models/token_model.dart';
import 'package:defy/features/send/domain/models/user_model.dart';
import 'package:defy/features/send/presentation/providers/send_provider.dart';
import 'package:defy/features/send/presentation/screens/multi_send_token_screen.dart';
import 'package:defy/features/send/presentation/screens/send_nft_page.dart';
import 'package:defy/features//send/presentation/widgets/send/multi_select_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../components/send_asset_selection_nfts_tab.dart';
import '../components/send_asset_selection_tab_bar.dart';
import '../components/send_asset_selection_tokens_tab.dart';

class SendAssetSelection<T extends SelectableItem>
    extends ConsumerStatefulWidget {
  final List<T> selectedToItems;
  final bool isMulti;

  const SendAssetSelection({
    required this.selectedToItems,
    required this.isMulti,
    super.key,
  });

  @override
  _SendAssetSelectionState createState() => _SendAssetSelectionState<T>();
}

class _SendAssetSelectionState<T extends SelectableItem>
    extends ConsumerState<SendAssetSelection<T>>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    final assetState = ref.read(sendAssetSelectionScreenProvider);
    final assetController = ref.read(sendAssetSelectionScreenProvider.notifier);

    if (_tabController.indexIsChanging && assetState.isSelectionMode) {
      assetController.resetSelection();
    }
  }

  @override
  Widget build(BuildContext context) {
    final assetState = ref.watch(sendAssetSelectionScreenProvider);
    final assetController =
        ref.watch(sendAssetSelectionScreenProvider.notifier);

    final tokens = [
      Token(
        tokenImage: 'assets/icons/aptos.png',
        tokenName: 'Aptos',
        tokenBalance: '7 Aptos',
        tokenPrice: '22.12',
        tokenSymbol: 'APT',
      ),
      Token(
        tokenImage: 'assets/icons/ethereum.png',
        tokenName: 'Ethereum',
        tokenBalance: '0.023 ETH',
        tokenPrice: '672',
        tokenSymbol: 'ETH',
      ),
      Token(
        tokenImage: 'assets/icons/polygon.png',
        tokenName: 'Polygon',
        tokenBalance: '8 Matic',
        tokenPrice: '54.09',
        tokenSymbol: 'MATIC',
      ),
      Token(
        tokenImage: 'assets/icons/dai.png',
        tokenName: 'Dai',
        tokenBalance: '12 DAI',
        tokenPrice: '21',
        tokenSymbol: 'DAI',
      ),
      Token(
        tokenImage: 'assets/icons/usdc.png',
        tokenName: 'USDC',
        tokenBalance: '91 USDC',
        tokenPrice: '90.21',
        tokenSymbol: 'USDC',
      ),
    ];

    final nfts = [
      NFT(
        assetPath: 'assets/images/nft-1.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft-2.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft-3.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft-4.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
      NFT(
        assetPath: 'assets/images/nft-5.png',
        nftName: 'CryptoPunk #1234',
        nftValue: '0.23 ETH',
        nftId: '1234',
        nftCollection: 'CryptoPunks',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (assetState.isSelectionMode) {
                        assetController.resetSelection();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Icon(
                      PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  Text(
                    "Send",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox.shrink()
                ],
              ),
              const Gap(20),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Row(
                    children: [
                      const Gap(16),
                      Text(
                        "To",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(20),
                      RowSuper(
                        innerDistance: -24,
                        children: [
                          ...widget.selectedToItems.map((selectableItem) {
                            if (selectableItem is Wallet) {
                              return Image(
                                height: 32,
                                width: 32,
                                image: AssetImage(selectableItem.asset),
                              );
                            } else if (selectableItem is Token) {
                              return Image(
                                height: 32,
                                width: 32,
                                image: AssetImage(selectableItem.tokenImage!),
                              );
                            } else if (selectableItem is UserModel) {
                              return Image(
                                height: 32,
                                width: 32,
                                image: AssetImage(selectableItem.asset),
                              );
                            } else if (selectableItem is Friend) {
                              return Image(
                                height: 32,
                                width: 32,
                                image: AssetImage(selectableItem.avatar!),
                              );
                            } else if (selectableItem is Contact) {
                              return Image(
                                height: 32,
                                width: 32,
                                image: AssetImage(selectableItem.avatar!),
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
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.greyLight,
                          ),
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
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
              ),
              const Gap(18),
              Expanded(
                child: Column(
                  children: [
                    SendAssetSelectionTabBar(
                      controller: _tabController,
                      isMulti: widget.isMulti,
                      isSelectionMode: assetState.isSelectionMode,
                      onTap: () {
                        assetController.toggleSelectionMode(tokens.length);
                        print(
                          'Seleted tiles: ${assetState.selectedAssetItems}',
                        );
                      },
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SendAssetSelectionTokensTab<SelectableItem>(
                            tokens: tokens,
                            selectedToItems: widget.selectedToItems,
                            isSelectionMode: assetState.isSelectionMode,
                          ),
                          SendAssetSelectionNFTsTab(
                            nfts: nfts,
                            selectedToItems: widget.selectedToItems,
                          ),
                        ],
                      ),
                    ),
                    if (assetState.isSelectionMode)
                      MultiSelectButton(
                        item: _tabController.index == 0 ? 'Tokens' : 'NFTs',
                        selectedCount: assetState.selectedAssetItems.length,
                        onTap: () {
                          if (_tabController.index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MultiSendTokenScreen(
                                  selectedAssetItems:
                                      assetState.selectedAssetItems,
                                  selectedToItems: widget.selectedToItems,
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SendNFTPage<SelectableItem>(
                                  selectedToItems: widget.selectedToItems,
                                  selectedNfts: assetState.selectedAssetItems,
                                  isMulti: true,
                                ),
                              ),
                            );
                          }
                        },
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

  String? _buildSelectedText() {
    final firstItem = widget.selectedToItems.first;

    if (firstItem is UserModel) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.userName} +${widget.selectedToItems.length - 1} others"
          : firstItem.userName;
    } else if (firstItem is Friend) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.friendName} +${widget.selectedToItems.length - 1} others"
          : firstItem.friendName;
    } else if (firstItem is Contact) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.contactName} +${widget.selectedToItems.length - 1} others"
          : firstItem.contactName;
    } else if (firstItem is Wallet) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.walletName} +${widget.selectedToItems.length - 1} others"
          : firstItem.walletName;
    } else if (firstItem is Token) {
      return widget.selectedToItems.length > 1
          ? "${firstItem.tokenName} +${widget.selectedToItems.length - 1} others"
          : firstItem.tokenName;
    } else {
      return "";
    }
  }
}
