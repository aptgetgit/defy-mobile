import 'package:defy/features/send/presentation/providers/send_provider.dart';
import 'package:defy/features/send/presentation/screens/send_asset_selection.dart';
import 'package:defy/features/send/presentation/widgets/send/multi_select_button.dart';
import 'package:defy/features/send/presentation/widgets/send/multi_select_menu_button.dart';
import 'package:defy/features/send/presentation/widgets/send/send_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class SendToSelfScreen extends ConsumerWidget {
  const SendToSelfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendController = ref.watch(sendToWalletProvider.notifier);
    final sendState = ref.watch(sendToWalletProvider);

    // List of wallets
    final wallets = [
      Wallet(
          asset: 'assets/images/wallet-1.png',
          walletName: 'Business',
          balance: '\$659.02'),
      Wallet(
          asset: 'assets/images/wallet-2.png',
          walletName: 'Side Gig',
          balance: '\$98.34'),
      Wallet(
          asset: 'assets/images/wallet-3.png',
          walletName: 'Family',
          balance: '\$242.00'),
      Wallet(
          asset: 'assets/images/wallet-4.png',
          walletName: 'Test-Demo',
          balance: '\$76.88'),
      Wallet(
          asset: 'assets/images/wallet-5.png',
          walletName: 'Meme Coins',
          balance: '\$234.93'),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (sendState.isSelectionMode) {
                  sendController.resetSelection();
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
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Icon(
              PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
              color: Colors.black,
              size: 21,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(60)),
                child: Center(
                  child: Row(
                    children: [
                      const Gap(16),
                      Text(
                        "To",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const Gap(20),
                      Text(
                        "Enter Address",
                        style: TextStyle(fontSize: 16, color: AppColors.greyLight),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                              color:AppColors.blue,
                              borderRadius: BorderRadius.circular(60)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Center(
                              child: Text(
                                "Paste",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Gap(30),
              Row(
                children: [
                  Icon(
                    PhosphorIcons.clockClockwise(PhosphorIconsStyle.bold),
                    color: AppColors.greyLight,
                    size: 20,
                  ),
                  const Gap(4),
                  Text(
                    "Your Wallets",
                    style: TextStyle(color: AppColors.greyLight),
                  ),
                  const Spacer(),
                  Icon(
                    PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.bold),
                    color: AppColors.greyLight,
                    size: 20,
                  ),
                  const Gap(20),
                  MultiSelectMenuButton(
                      onTap: () {
                        sendController.toggleSelectionMode(wallets.length);
                        // sendController.resetSelection();
                      },
                      isSelectionMode: sendState.isSelectionMode),
                  const Gap(10)
                ],
              ),
              const Gap(12),
              const Divider(
                thickness: 1.5,
                height: 1.5,
                color: Color(0xffF4F4F6),
              ),
              const Gap(12),
              ...wallets.asMap().entries.map((entry) {
                final index = entry.key;
                final wallet = entry.value;
                return SendTile(
                  asset: wallet.asset,
                  heading: wallet.walletName,
                  subHeading: wallet.balance,
                  isSelectionMode: sendState.isSelectionMode,
                  tileSelected: sendState.tileSelected.length > index
                      ? sendState.tileSelected[index]
                      : false,
                  selectTile: () => sendController.selectTile(index, wallet),
                );
              }),
              const Spacer(),
              if (sendState.isSelectionMode)
                MultiSelectButton(
                  item: 'Wallets',
                  selectedCount: sendState.selectedCount,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendAssetSelection(
                          selectedToItems: sendState.selectedToItems,
                          isMulti: true,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
