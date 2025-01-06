// ignore_for_file: depend_on_referenced_packages
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/features/authentication/presentation/screens/account_creation/fullname_input_screen.dart';
import 'package:defy/features/authentication/presentation/screens/account_creation/username_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountCreationScreen extends ConsumerStatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AccountCreationScreenState();
}

class _AccountCreationScreenState extends ConsumerState<AccountCreationScreen> {
  int index = 0;

  void nextPage(int direction) {
    setState(() {
      index += direction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 60,
          leading: IconButton(
            onPressed: () {
              if (index > 0) {
                nextPage(-1);
              }  else {
                AppLogger.debug("Go to auth screen");
              }
            },
            icon: const Icon(PhosphorIconsBold.caretLeft),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xfff4f4f6),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(PhosphorIconsBold.alien, size: 22),
                    const Gap(6),
                    const Text(
                      'Coins',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff646d80),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s set up your account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  child: [
                    FullNameInputScreen(
                      nextPage: nextPage,
                    ),
                    UserNameInputScreen(
                      nextPage: nextPage,
                    ),
                  ].elementAt(index),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
