import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/transaction/swap/presentation/screens/single_swap_screen.dart';
import 'package:defy/features/transaction/swap/presentation/widgets/token_tile.dart';
import 'package:defy/features/transaction/swap/presentation/providers/swap_tokens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// ignore: must_be_immutable
class TokensScreen extends ConsumerStatefulWidget {
  TokensScreen({super.key, required this.isSwapFrom});

  final bool isSwapFrom;

  @override
  ConsumerState<TokensScreen> createState() => _TokensScreenState();
}

class _TokensScreenState extends ConsumerState<TokensScreen> {
  bool enableSearch = false;
  final TextEditingController controller = TextEditingController();

  void continueToMultipleTokensSwap() async {
    // const MultiSwapScreenRoute().push(context);
  }

  void continueToSingleTokensSwap() {
    // const SingleSwapScreenRoute().push(context);
  }

  void resetTokens() {
    // ref.read(swapProvider.notifier).resetTokens(widget.isSwapFrom);
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SingleSwapScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    final width = context.screenWidth;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(PhosphorIconsBold.caretLeft),
        ),
        title: Text(
          'Swap',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(PhosphorIcons.arrowsClockwise()),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: context.themeData.scaffoldBackgroundColor,
                  child: Visibility(
                    visible: !enableSearch,
                    replacement: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      width: width,
                      decoration: BoxDecoration(
                        color: const Color(0xfff4f4f6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        width: width / 3,
                        child: TextField(
                          controller: controller,
                          showCursor: true,
                          cursorColor: AppColors.black,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              PhosphorIconsBold.magnifyingGlass,
                            ),
                            hintText: 'Search here',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.greyLight,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              height: 1),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.isSwapFrom ? 'From Token' : "Swap to",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(PhosphorIconsBold.magnifyingGlass),
                        ),
                        InkWell(
                          onTap: resetTokens,
                          child: Container(
                            width: 60,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 252, 205, 205),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.red,
                              ),
                            ),
                          ).animate().slideX(
                                begin: 0.7,
                                end: 0,
                                duration: const Duration(milliseconds: 150),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer(builder: (ctx, ref, child) {
                    final tokens = widget.isSwapFrom
                        ? ref.watch(swapFromProvider)
                        : ref.watch(swapToProvider);
                    return tokens.when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (ctx, index) => TokenTile(
                              token: data[index],
                              isSwapFrom: widget.isSwapFrom),
                        );
                      },
                      error: (e, st) {
                        return const Center(
                          child: Text('Error'),
                        );
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                    );
                  }),
                ),
              ],
            ),
            Positioned(
              bottom: height * 0.015,
              left: 0,
              right: 0,
              child: Consumer(builder: (ctx, ref, child) {
                final tokens = ref.watch(swapProvider);
                final fromTokensLength = tokens.value?.fromTokens.length ?? 0;
                final toTokensLength = tokens.value?.toTokens.length ?? 0;
                return GestureDetector(
                  onTap: () {
                    if (fromTokensLength == 0 || toTokensLength == 0) {
                      return;
                    }
                    if (fromTokensLength > 1) {
                      return continueToMultipleTokensSwap();
                    } else {
                      return continueToSingleTokensSwap();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      // vertical: 16,
                    ),
                    height: ButtonSize.large.height,
                    width: width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                    ),
                    decoration: BoxDecoration(
                      color: widget.isSwapFrom
                          ? fromTokensLength > 0
                              ? AppColors.black
                              : AppColors.greyMedium
                          : toTokensLength > 0
                              ? AppColors.black
                              : AppColors.greyMedium,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: widget.isSwapFrom
                                  ? fromTokensLength > 0
                                      ? AppColors.white
                                      : AppColors.greyLight
                                  : toTokensLength > 0
                                      ? AppColors.white
                                      : AppColors.greyLight,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: widget.isSwapFrom
                                  ? fromTokensLength > 0
                                      ? AppColors.blue
                                      : const Color(0xff979daa)
                                  : toTokensLength > 0
                                      ? AppColors.blue
                                      : const Color(0xff979daa),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              widget.isSwapFrom
                                  ? fromTokensLength.toString()
                                  : toTokensLength.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
