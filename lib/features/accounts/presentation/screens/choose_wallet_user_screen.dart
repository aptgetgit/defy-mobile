import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/assets.gen.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../core/logging/app_logger.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../components/new_wallet_bottom_sheet.dart';
import '../components/wallet_pagination_indicator.dart';
import '../components/wallet_swiper.dart';
import '../provider/choose_wallet_screen_provider.dart';
import '../state/choose_wallet_screen_state.dart';

class ChooseWalletUserScreen extends ConsumerStatefulWidget {
  const ChooseWalletUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChooseWalletUserScreenState();
}

class _ChooseWalletUserScreenState
    extends ConsumerState<ChooseWalletUserScreen> {
  @override
  Widget build(BuildContext context) {
    final Future<Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>>
        accountsFuture = ref.watch(listAptosAccountsUseCaseProvider).call();

    ref.listen<bool>(
      chooseWalletScreenNotifierProvider
          .select((ChooseWalletScreenState state) => state.isUpdated),
      (bool? previous, bool next) {
        if (previous != next) {
          ref.invalidate(listAptosAccountsUseCaseProvider);
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            const SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: AppColors.pink,
              child: Image.asset(
                Assets.images.slightlySmilingFace.path,
                height: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Allan Jerrold',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'aj_22',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  r'$1582.2',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 5),
          ],
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                const Text(
                  'Choose Wallet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                const CircleAvatar(
                  maxRadius: 16,
                  child: Icon(PhosphorIconsBold.cardsThree, size: 20),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () async => showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    isScrollControlled: true, // Add this line
                    backgroundColor: Colors.transparent, // Add this line
                    builder: (BuildContext context) =>
                        const NewWalletBottomSheet(),
                  ),
                  child: const CircleAvatar(
                    maxRadius: 16,
                    child: Icon(
                      PhosphorIconsBold.plus,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'You can change them here anytime',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: FutureBuilder<
                Either<ExceptionWithStackTrace, Set<AptosAccountWithMetadata>>>(
              future: accountsFuture,
              builder: (
                BuildContext context,
                AsyncSnapshot<
                        Either<ExceptionWithStackTrace,
                            Set<AptosAccountWithMetadata>>>
                    snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  AppLogger.error('Error loading accounts: ${snapshot.error}');
                  return const Center(child: Text('Error loading accounts'));
                }

                if (!snapshot.hasData) {
                  return const Center(child: Text('No data available'));
                }

                return snapshot.data!.fold(
                  (ExceptionWithStackTrace error) {
                    AppLogger.error(
                      'Error loading accounts: ${error.exception}',
                    );
                    return const Center(child: Text('Error loading accounts'));
                  },
                  (Set<AptosAccountWithMetadata> accountsSet) {
                    final List<AptosAccountWithMetadata> accounts =
                        accountsSet.toList();

                    if (accounts.isEmpty) {
                      return const Center(child: Text('No wallets found'));
                    }

                    return Column(
                      children: <Widget>[
                        Expanded(
                          child: WalletSwiper(
                            accounts: accounts,
                            allowLongPress: true,
                          ),
                        ),
                        const SizedBox(height: 20),
                        WalletPaginationIndicator(accounts: accounts),
                        const SizedBox(height: 32),
                        const SizedBox(height: 16),
                        Consumer(
                          builder: (
                            BuildContext context,
                            WidgetRef ref,
                            Widget? child,
                          ) {
                            final int currentIndex = ref
                                .watch(chooseWalletScreenNotifierProvider)
                                .currentIndex;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          'Enter ${accounts[currentIndex].label}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      CircleAvatar(
                                        maxRadius: 16,
                                        backgroundColor: accounts[currentIndex]
                                            .backgroundColor,
                                        child: CachedNetworkImage(
                                          imageUrl: accounts[currentIndex]
                                              .iconUri
                                              .toString(),
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWalletCard(AptosAccountWithMetadata account) => Center(
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: account.backgroundColor,
            // gradient: account.backgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.greyDark.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total Balance',
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const Text(
                        '---------',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInOut,
                  bottom: 24,
                  right: 24,
                  child: Text(
                    'Profile',
                    style: GoogleFonts.urbanist(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const AnimatedPositioned(
                  duration: Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInOut,
                  top: 26,
                  right: 26,
                  child: Icon(
                    PhosphorIconsRegular.qrCode,
                    color: AppColors.white,
                    size: 32,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 10,
                  child: SvgPicture.asset(
                    Assets.images.cardTopLeft,
                    height: 64,
                    width: 64,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  right: 0,
                  top: -4,
                  child: SvgPicture.asset(
                    Assets.images.cardTopRight,
                    height: 48,
                    width: 48,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  right: 88,
                  bottom: -8,
                  child: SvgPicture.asset(
                    Assets.images.cardBottom,
                    height: 88,
                    width: 88,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 28,
                  left: 28,
                  child: CachedNetworkImage(
                    imageUrl: account.iconUri.toString(),
                    height: 40,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: 100,
                  top: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        account.label,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Wallet Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
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
