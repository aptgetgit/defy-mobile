import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void addBlockchainAccountBottomSheet(
  BuildContext context,
) async {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) => _AddBlockchainAccountSheet(),
  );
}

class _AddBlockchainAccountSheet extends ConsumerStatefulWidget {
  const _AddBlockchainAccountSheet();

  @override
  ConsumerState<_AddBlockchainAccountSheet> createState() =>
      _AddBlockchainAccountSheetState();
}

class _AddBlockchainAccountSheetState
    extends ConsumerState<_AddBlockchainAccountSheet> {
  // final subTextStyle = TextStyle(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 14,
  //   color: colorFromHex('#979DAA'),
  // );

  // final titleTextStyle = const TextStyle(
  //   fontWeight: FontWeight.w500,
  //   fontSize: 18,
  //   color: Colors.black,
  // );

  @override
  void initState() {
    super.initState();
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   ref
    //       .read(newWalletDataStateProvider.notifier)
    //       .setPersonaName(widget.personaName);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      // ref.watch(newWalletDataStateProvider);
      return Container(
        padding: const EdgeInsets.all(12).copyWith(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: colorFromHex('#CFD2D8'),
              ),
            ),
            Row(
              children: [
                const Gap(20),
                const Icon(PhosphorIconsBold.appWindow),
                const Gap(12),
                Text(
                  'New Wallet',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(PhosphorIconsBold.x, size: 18),
                )
              ],
            ),
            const Gap(10),
            _Tile(
              onTap: () {
                const SeedSelectionScreenRoute().push(context);
              },
              icon: PhosphorIcons.circlesThreePlus(),
              title: 'Create Wallet',
              subtitle: 'Click to create a new wallet',
              color: Color(0xff2071ee),
            ),
            _Tile(
              onTap: () {
              },
              icon: PhosphorIcons.key(),
              title: 'Import Private Key',
              subtitle: 'Import existing wallet using private key',
              color: Color(0xffDD2282),
            ),
            _Tile(
              onTap: () {
              },
              icon: PhosphorIcons.password(),
              title: 'Import Seed Key',
              subtitle: 'Import existing wallet using Seed Phrase',
              color: Color(0xffFFAD29),
            ),
            _Tile(
              // onTap: () => WalletUiScreenRoute().push(context),
              icon: PhosphorIcons.computerTower(),
              title: 'Import Hardware Wallet',
              subtitle: 'Import from external hardware',
              color: Color(0xff991FF9),
            ),
          ],
        ),
      );
    });
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    // ignore: unused_element
    this.onTap,
  });
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final subTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColors.greyLight);
    final titleTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: AppColors.black);
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
        // context.pop();
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4),
        leading: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 1),
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        titleTextStyle: titleTextStyle,
        subtitle: Text(subtitle),
        subtitleTextStyle: subTextStyle,
      ),
    );
  }
}
