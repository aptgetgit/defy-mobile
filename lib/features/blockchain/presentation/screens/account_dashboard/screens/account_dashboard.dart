import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/constants/animated_emoji.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/providers/account/dashboard_ui_provider.dart';
import 'package:defy/features/blockchain/presentation/screens/account_dashboard/components/add_account_sheet.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_ui_edit/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AccountDashboardScreen extends ConsumerStatefulWidget {
  const AccountDashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AccountDashboardScreenState();
}

class _AccountDashboardScreenState
    extends ConsumerState<AccountDashboardScreen> {
  bool isCardView = true;
  int index = 1;
  void toggleView() => setState(() => isCardView = !isCardView);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            horizontalTitleGap: 6,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: CachedNetworkImage(
                height: 48,
                width: 48,
                imageUrl:
                    'https://pbs.twimg.com/profile_images/1650135016108617731/IAtIpF4__400x400.jpg',
              ),
            ),
            title: Text(
              'Aj_22',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'BALANCE',
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColors.greyLight),
                ),
                Text(
                  '\$1582.2',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => Future.wait([]),
        child: SafeArea(
          child: Column(
            children: [
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Choose Wallet',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => addBlockchainAccountBottomSheet(context),
                      child: CircleAvatar(
                              radius: 14,
                              backgroundColor: AppColors.black,
                              child: Icon(
                                PhosphorIconsBold.plus,
                              ),
                            ),
                    ),
                          const Gap(16),
                    Visibility(
                      visible: isCardView,
                      replacement: GestureDetector(
                        onTap: toggleView,
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.transparent,
                          child: Icon(
                            PhosphorIconsBold.cardsThree,
                            size: 18,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.black,
                        child: Icon(
                          PhosphorIconsBold.cardsThree,
                          size: 18,
                        ),
                      ).animate().fadeIn(duration: 1.seconds),
                    ),
                    const Gap(16),
                    Visibility(
                      visible: !isCardView,
                      replacement: GestureDetector(
                        onTap: toggleView,
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.transparent,
                          child: Icon(
                            PhosphorIconsRegular.squareSplitVertical,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.black,
                        child: Icon(
                          PhosphorIconsRegular.squareSplitVertical,
                        ),
                      ).animate().fadeIn(duration: 1.seconds),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: isCardView,
                  replacement: const _AccountDashboardGrid(),
                  child: const _AccountDashboardCard(),
                ),
              ),
              Visibility(
                visible: isCardView,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      PhosphorIconsRegular.handTap,
                      color: AppColors.greyLight,
                      size: 26,
                    ),
                    const Gap(8),
                    Text(
                      'Long Press ',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'on Wallets to open Wallet info',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colorFromHex('f4f4f6'),
                    ),
                    child: Consumer(
                      builder:(ctx,ref,child){
                        final groupName = ref.watch(activeGroupProvider);
                        return SizedBox(
                        height: 56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Gap(10),
                            Text(
                              'Enter $groupName',
                              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                      }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountDashboardCard extends ConsumerStatefulWidget {
  const _AccountDashboardCard();

  @override
  ConsumerState<_AccountDashboardCard> createState() => _AccountDashboardCardState();
}

class _AccountDashboardCardState extends ConsumerState<_AccountDashboardCard> {
  int index = 0;
  int length = 10;
  CardSwiperController controller = CardSwiperController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              // color: Colors.amber,
              // height: context.height * .5,
              child: CardSwiper(
                isLoop: true,
                onSwipe: (previousIndex, currentIndex, direction) {
                  if (direction == CardSwiperDirection.bottom &&
                      previousIndex < length) {
                    if (previousIndex == length - 1) return false;
                    setState(() {
                      index = previousIndex + 1;
                    });
                    ref.read(activeGroupProvider.notifier).setActiveAccount('Account ${index+1}');
                    return true;
                  } else if (direction == CardSwiperDirection.top) {
                    if (index == 0) return false;
                    controller.moveTo(index - 1);
                    ref.read(activeGroupProvider.notifier).setActiveAccount('Account $index');
                    setState(() {
                      index = index - 1;
                    });
                    return false;
                  }
                  return false;
                },
                numberOfCardsDisplayed: 3,
                controller: controller,
                allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
                  vertical: true,
                ),
                backCardOffset: const Offset(0, -52),
                padding: EdgeInsets.zero,
                cardsCount: length,
                cardBuilder: (
                  context,
                  i,
                  horizontalOffsetPercentage,
                  verticalOffsetPercentage,
                ) {
                  return Center(
                    child: SizedBox(
                      height: 240,
                      width: double.maxFinite,
                      child: GestureDetector(
                        onLongPress: () => {
                          showDialog(
                            context: context,
                            builder: (context) => Material(
                              elevation: 0,
                              color: AppColors.transparent,
                              child: Container(
                                color: Colors.white.withOpacity(.3),
                                child: Container(
                                  color: Colors.white.withOpacity(.2),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 5,
                                            sigmaY: 5,
                                          ),
                                          child: Container(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 200),
                                          child: WalletCard(
                                            backgroudcolor: [
                                              Colors.red,
                                              Colors.blue,
                                              Colors.amber,
                                              Colors.green
                                            ].elementAt(i % 4),
                                            groupImage: AnimatedEmoji.values
                                                .elementAt(i % 4)
                                                .getEmoji,
                                            name: 'Account ${i + 1}',
                                            amount: '\$679.98',
                                            profile: 'Profile',
                                            width: context.screenWidth,
                                            height: 240,
                                          ).animate().scale(
                                              duration: 350.milliseconds),
                                        ),
                                      ),
                                      Builder(builder: (context) {
                                        final col1 = AppColors.greyDark;
                                        return Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton.icon(
                                                onPressed: () {
                                                  // WalletUiScreenRoute(
                                                  //   Group(
                                                  //     groupName:
                                                  //         "Account ${i + 1}",
                                                  //     animatedIconUrl:
                                                  //         AnimatedEmoji.values
                                                  //             .elementAt(i)
                                                  //             .getEmoji,
                                                  //     backgroundHexColor:
                                                  //         colorToHex([
                                                  //       Colors.red,
                                                  //       Colors.blue,
                                                  //       Colors.green,
                                                  //       Colors.yellow
                                                  //     ].elementAt(i % 4)),
                                                  //     isPrimary: false,
                                                  //     blockchainAccounts: [],
                                                  //   ),
                                                  //   personaName: "Persona",
                                                  // ).push(context);
                                                },
                                                icon: Icon(
                                                  PhosphorIconsBold
                                                      .appWindow,
                                                  color: col1,
                                                ),
                                                label: Text(
                                                  'Wallet Settings',
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: col1),
                                                ),
                                              ),
                                              const Gap(12),
                                              TextButton.icon(
                                                onPressed: () {},
                                                icon: Icon(
                                                  PhosphorIconsBold
                                                      .magnifyingGlass,
                                                  color: col1,
                                                ),
                                                label: Text(
                                                  'Open Wallet',
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: col1),
                                                ),
                                              ),
                                              const Gap(12),
                                              TextButton.icon(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                label: Text(
                                                  'Cancel',
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.red),
                                                ),
                                              ),
                                              const Gap(30),
                                            ],
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        },
                        child: WalletCard(
                          backgroudcolor: [
                            Colors.red,
                            Colors.blue,
                            Colors.amber,
                            Colors.green
                          ].elementAt(i % 4),
                          groupImage:
                              AnimatedEmoji.values.elementAt(i % 4).getEmoji,
                          name: 'Account ${i + 1}',
                          amount: '\$679.98',
                          profile: 'Profile',
                        ),
                      ),
                    ),
                  );
                },
              ).animate().fade(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardIndicator(current: index, length: length),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardIndicator extends StatelessWidget {
  final int current;
  final int length;
  const CardIndicator({
    super.key,
    required this.current,
    required this.length,
  });

  Widget dot({bool show = false}) {
    return Visibility(
      visible: show,
      replacement: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorFromHex('#E3E6EC'),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Text(
          '${current + 1}',
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: colorFromHex('#F4F4F6'),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          dot(show: current == 0),
          dot(show: current <= 5 && current >= 1),
          dot(show: current > 5 && current <= 8),
          dot(show: current == 9),
        ],
      ),
    );
  }
}

class _AccountDashboardGrid extends StatelessWidget {
  const _AccountDashboardGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5 / 2.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          // WalletUiScreenRoute(
          //   Group(
          //     groupName: "Account ${i + 1}",
          //     animatedIconUrl: AnimatedEmoji.values.elementAt(i).getEmoji,
          //     backgroundHexColor: colorToHex([
          //       Colors.red,
          //       Colors.blue,
          //       Colors.green,
          //       Colors.yellow
          //     ].elementAt(i % 4)),
          //     isPrimary: false,
          //     blockchainAccounts: [],
          //   ),
          //   personaName: "Persona",
          // ).push(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorFromHex('#F4F4F6'),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: [
                        Colors.red,
                        Colors.blue,
                        Colors.green,
                        Colors.yellow
                      ].elementAt(i % 4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: AnimatedEmoji.values.elementAt(i).getEmoji,
                    ),
                  ),
                  const Icon(PhosphorIconsBold.dotsThree,color: AppColors.greyDark,),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account ${i + 1}',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$876.9',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyDark),
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
}
