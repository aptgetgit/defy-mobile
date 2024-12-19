import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/widgets/wallet_card.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/widgets/wallet_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../components/delete_wallet_dialog.dart';

class WalletUiScreen extends ConsumerStatefulWidget {
  const WalletUiScreen({
    // required this.group,
    this.profileName,
    super.key,
  });
  // final Group group;
  final String? profileName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletUiScreenState();
}

class _WalletUiScreenState extends ConsumerState<WalletUiScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                PhosphorIconsBold.caretLeft,
                size: 22,
              ),
            ),
            centerTitle: true,
            title: const Text('Wallet'),
            actions: const [
              Icon(PhosphorIconsRegular.cardholder),
              Gap(20),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.screenHeight - 60 - MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  WalletCard(
                    backgroudcolor: AppColors.blue,
                        // colorFromHex(widget.group.backgroundHexColor),
                    name: "groupName",
                    profile: widget.profileName,
                    groupImage: "widget.group.animatedIconUrl",
                    onEdit: () => {},
                  ),
                  const Gap(32),
                  Row(
                    children: [
                      const Gap(20),
                      Icon(
                        PhosphorIconsBold.appWindow,
                        color: colorFromHex('#979DAA'),
                      ),
                      const Gap(8),
                      Text(
                        'Wallet Settings',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Divider(
                    color: colorFromHex('#F4F4F6'),
                    thickness: 2,
                  ),
                  WalletOptionTile(
                    onTap: () {
                    },
                    label: 'Security',
                    iconData: PhosphorIconsRegular.arrowCircleUpRight,
                  ),
                  WalletOptionTile(
                    onTap: () {},
                    label: 'Manage',
                    iconData: PhosphorIconsRegular.atom,
                  ),
                  WalletOptionTile(
                    onTap: () {
                    },
                    label: 'Set As Default',
                    iconData: PhosphorIconsRegular.gearSix,
                  ),
                                    WalletOptionTile(
                    onTap: () {
                    },
                    label: 'Customise Wallet',
                    iconData: PhosphorIconsRegular.palette,
                  ),
                  const Spacer(),
                  Container(
                    height: 56,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorFromHex('#FFE1E1'),
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: InkWell(
                      onTap: () => deleteWalletDialog(context),
                      child: Center(
                        child: Text(
                          'Remove Wallet',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.red),
                          // style: AppFont.of(context)
                          //     .GeneralMedium
                          //     .copyWith(color: colorFromHex('#FF6767')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
