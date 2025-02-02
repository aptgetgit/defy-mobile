import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../config/theme/colors.dart';
import '../../../../app/routes/router.dart';

class AccountSetUpUserNameScreen extends ConsumerStatefulWidget {
  const AccountSetUpUserNameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      AccountSetUpUserNameScreenState();
}

class AccountSetUpUserNameScreenState
    extends ConsumerState<AccountSetUpUserNameScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(PhosphorIconsBold.caretLeft)),
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
                "Let's setup your account",
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
                    PhosphorIconsBold.at,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Create your username',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Username',
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
                    hintText: 'Enter your username',
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Username should not contain special characters',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  const WalletCreationScreenRoute().go(context);
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
