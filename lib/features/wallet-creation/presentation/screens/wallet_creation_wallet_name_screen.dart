import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../app/routes/router.dart';
import '../../../../core/logging/app_logger.dart';

class WalletCreationWalletNameScreen extends ConsumerStatefulWidget {
  const WalletCreationWalletNameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WalletCreationWalletNameScreenState();
}

class WalletCreationWalletNameScreenState
    extends ConsumerState<WalletCreationWalletNameScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              const Icon(PhosphorIconsBold.caretLeft),
              const Spacer(),
              const Spacer(),
              Image.asset(
                'assets/images/wallet-creation-wallet-name-appbar-component.png',
                height: 100,
                width: 140,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyMedium),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/coins.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Coins',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Let's create your new Wallet 🥳",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.identificationCard,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Give a name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Give a name to your new wallet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyLight,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Wallet name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Wallet name',
                    hintStyle: TextStyle(
                      color: AppColors.greyLight,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              const Spacer(),
              const Center(
                child: Text(
                  'Skip for now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blue,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  AppLogger.debug('Here');
                  const WalletCreationWalletBackgroundScreenRoute()
                      .push(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  height: 54,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
