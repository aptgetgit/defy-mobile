import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:defy/features/send/domain/models/selectable_item_model.dart';
import 'package:defy/features/send/domain/models/nft_model.dart';
import 'package:defy/features/send/domain/models/token_model.dart';
import 'package:defy/features/send/domain/models/user_model.dart';
import 'package:defy/features/send/presentation/providers/send_provider.dart';
import 'package:defy/features/send/presentation/widgets/send/swipe_to_send_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/theme/colors.dart';
import '../../domain/models/selectable_item_model.dart';

class SendNFTPage<T extends SelectableItem> extends StatefulWidget {
  final List<T> selectedToItems;
  final List<T> selectedNfts;
  final bool isMulti;

  const SendNFTPage({
    required this.selectedToItems,
    required this.selectedNfts,
    required this.isMulti,
    super.key,
  });

  @override
  State<SendNFTPage> createState() => _SendNFTPageState();
}

class _SendNFTPageState extends State<SendNFTPage> {
  String _selectedText() {
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
          ? "${firstItem.name} +${widget.selectedToItems.length - 1} others"
          : firstItem.name;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final nft = widget.selectedNfts.first;
    final controller = PageController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  Icon(
                    PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
                    color: Colors.black,
                    size: 21,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16),
                      Text(
                        "To",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 20),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        RowSuper(
                          innerDistance: -24,
                          children: [
                            ...widget.selectedToItems
                                .asMap()
                                .entries
                                .map((entry) {
                              final selectableToItem = entry.value;

                              if (selectableToItem is Wallet) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.asset),
                                );
                              } else if (selectableToItem is Contact) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.avatar!),
                                );
                              } else if (selectableToItem is Token) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image:
                                      AssetImage(selectableToItem.tokenImage!),
                                );
                              } else if (selectableToItem is Friend) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.avatar!),
                                );
                              } else if (selectableToItem is UserModel) {
                                return Image(
                                  height: 32,
                                  width: 32,
                                  image: AssetImage(selectableToItem.asset),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                          ],
                        ),
                        const Gap(4),
                        Text(
                          _buildSelectedText()!,
                          style: TextStyle(fontSize: 16, color: AppColors.greyVeryLight),
                        ),
                      ]),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(24)),
                          child: Center(
                            child: Icon(
                              PhosphorIcons.plus(PhosphorIconsStyle.bold),
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'You Send',
                      style: TextTheme.of(context)
                          .bodyMedium
                          ?.copyWith(color: AppColors.greyDark),
                    ),
                    const Spacer(),
                    Text(
                      widget.selectedNfts.length == 1
                          ? '${widget.selectedNfts.length} NFT'
                          : '${widget.selectedNfts.length} NFTs',
                      style: TextTheme.of(context)
                          .bodyMedium
                          ?.copyWith(color: AppColors.greyDark),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              widget.isMulti
                  ? Expanded(
                      flex: 6,
                      child: SizedBox(
                        width: width * 0.9,
                        child: PageView.builder(
                          scrollBehavior: NoGlowScrollBehavior(),
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          itemCount: widget.selectedNfts.length,
                          itemBuilder: (context, index) {
                            final nft = widget.selectedNfts[index];
                            return Center(
                              child: Container(
                                height: width * 0.9,
                                width: width * 0.9,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset(
                                  nft is NFT ? nft.assetPath : '',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                          onPageChanged: (pageIndex) {},
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                            nft is NFT ? nft.assetPath : '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 4),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Cosmos-Bg.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nft is NFT ? nft.nftCollection : '',
                                        style: TextTheme.of(context)
                                            .bodyMedium
                                            ?.copyWith(color: AppColors.greyDark),
                                      ),
                                      Text(
                                        '100 Aptos',
                                        style: TextTheme.of(context)
                                            .bodyMedium
                                            ?.copyWith(color: AppColors.greyDark),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  nft is NFT ? nft.nftValue : '',
                                  style: TextTheme.of(context)
                                      .bodyMedium
                                      ?.copyWith(color: AppColors.greyDark),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
              const SizedBox(height: 30),
              Visibility(
                visible: widget.isMulti,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: widget.selectedNfts.length,
                    effect: const WormEffect(
                      dotWidth: 6,
                      dotHeight: 6,
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Visibility(
                visible: widget.isMulti,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Cosmos-Bg.png'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nft is NFT ? nft.nftCollection : '',
                                style: TextTheme.of(context)
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.greyDark),
                              ),
                              Text(
                                '100 Aptos',
                                style: TextTheme.of(context)
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.greyDark),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          nft is NFT ? nft.nftValue : '',
                          style: TextTheme.of(context)
                              .bodyMedium
                              ?.copyWith(color: AppColors.greyDark),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomSwipeButton(
                onSwipeCompleted: () {
                  // const TransactionLoadingScreenRoute(TransactionType.send)
                  //     .push(context);
                },
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
          ? "${firstItem.name} +${widget.selectedToItems.length - 1} others"
          : firstItem.name;
    } else {
      return "";
    }
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
