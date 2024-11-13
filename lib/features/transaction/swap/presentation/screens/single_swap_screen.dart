// ignore_for_file: depend_on_referenced_packages

import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/features/transaction/swap/presentation/components/swap_route_tile.dart';
import 'package:defy/features/transaction/swap/presentation/components/swap_tile.dart';
import 'package:defy/features/transaction/swap/presentation/providers/swap_tokens_provider.dart';
import 'package:defy/features/transaction/swap/presentation/screens/tokens_screen.dart';
import 'package:defy/features/transaction/swap/presentation/widgets/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SingleSwapScreen extends ConsumerStatefulWidget {
  const SingleSwapScreen({super.key});

  @override
  ConsumerState<SingleSwapScreen> createState() => _SingleSwapScreenState();
}

class _SingleSwapScreenState extends ConsumerState<SingleSwapScreen>
    with SingleTickerProviderStateMixin {
  bool isMarketSelected = true;
  TextEditingController swapfromTokenController = TextEditingController();
  TextEditingController swapToTokenController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> rotationAnimation;
  String swapFromTokenInUSD = '\$0.0';
  String swapToTokenInUSD = '\$0.0';
  double price = 0.0;

  FocusNode swapFromFocusNode = FocusNode();
  FocusNode swapToFocusNode = FocusNode();
  FocusNode priceFocusNode = FocusNode();
  TextEditingController currentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    swapFromFocusNode = FocusNode();
    swapToFocusNode = FocusNode();
    priceFocusNode = FocusNode();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    rotationAnimation =
        Tween<double>(begin: 0, end: 3.14159).animate(_controller);
  }

  void _animate() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    swapFromFocusNode.dispose();
    swapToFocusNode.dispose();
    super.dispose();
  }

  void _continueToLoading() async {
    // final amount = (swapfromTokenController.text).toDouble();
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SwapTransactionLoadingScreen(amount: [amount])));
  }

  void _gotoSwapTokens({required bool swapFromToken}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => TokensScreen(isSwapFrom: swapFromToken)));
  }

  void openChangeRoutesSheet() {
    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (ctx) {
          return Text('hello');
          // return const ChangeRoutes();
        });
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(PhosphorIconsBold.caretLeft),
        ),
        title: Text(
          'Swap',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(PhosphorIcons.arrowsClockwise()),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 12,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    TextButton(
                      style: const ButtonStyle(
                        visualDensity: VisualDensity(vertical: -4),
                      ),
                      onPressed: () {
                        setState(() {
                          isMarketSelected = !isMarketSelected;
                        });
                      },
                      child: Text(
                        'Market',
                        style: TextStyle(
                            fontSize: isMarketSelected ? 17 : 16,
                            fontWeight: FontWeight.w700,
                            color: isMarketSelected
                                ? AppColors.black
                                : AppColors.greyLight),
                      ),
                    ),
                    TextButton(
                        style: const ButtonStyle(
                          visualDensity: VisualDensity(vertical: -4),
                        ),
                        onPressed: () {
                          setState(() {
                            isMarketSelected = !isMarketSelected;
                          });
                        },
                        child: Text(
                          'Limit',
                          style: TextStyle(
                              fontSize: !isMarketSelected ? 17 : 16,
                              fontWeight: FontWeight.w700,
                              color: !isMarketSelected
                                  ? AppColors.black
                                  : AppColors.greyLight),
                        )),
                    const Spacer(),
                    Visibility(
                      visible: !isMarketSelected,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            onPressed: () {},
                            icon: const Icon(PhosphorIconsBold.chartBar),
                          ),
                          IconButton(
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            onPressed: () {},
                            icon: const Icon(PhosphorIconsBold.notebook),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Consumer(
                    builder: (ctx, ref, child) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SwapTokenTile(
                            controller: swapfromTokenController,
                            chooseTokens: () {
                              _gotoSwapTokens(swapFromToken: true);
                            },
                            label: 'Selling',
                            isMarketSelected: isMarketSelected,
                            swapTokenInUSD: swapFromTokenInUSD,
                            isFromTokenTile: true,
                          ),
                          SwapTokenTile(
                            controller: swapToTokenController,
                            chooseTokens: () {
                              _gotoSwapTokens(swapFromToken: false);
                            },
                            label: 'Buying',
                            isMarketSelected: isMarketSelected,
                            swapTokenInUSD: swapToTokenInUSD,
                            isFromTokenTile: false,
                          ),
                        ],
                      );
                    },
                  ),
                  Consumer(builder: (ctx, ref, child) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (ctx, child) {
                        return GestureDetector(
                          onTap: () async {
                            ref.read(swapProvider.notifier).swapTokens();
                            final fromTokensTest =
                                await ref.read(swapFromProvider.future);
                            final toTokensTest =
                                await ref.read(swapToProvider.future);
                            fromTokensTest.map(
                                (token) => print("--fromToken: ${token.name} ${token.isSelected}")).toList();
                            toTokensTest.map(
                                (token) => print("--toToken: ${token.name} ${token.isSelected}")).toList();
                            _animate();
                            setState(() {
                              final temp_1 = swapfromTokenController.text;
                              swapfromTokenController.text =
                                  swapToTokenController.text;
                              swapToTokenController.text = temp_1;
                              final temp_2 = swapFromTokenInUSD;
                              swapFromTokenInUSD = swapToTokenInUSD;
                              swapToTokenInUSD = temp_2;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: const Color(0xfff4f4f6),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      context.themeData.scaffoldBackgroundColor,
                                  width: 4,
                                )),
                            child: Transform.rotate(
                              angle: rotationAnimation.value,
                              child: const Icon(
                                PhosphorIconsBold.arrowsDownUp,
                                size: 28,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Visibility(
                      visible: !isMarketSelected,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width / 2.5,
                                child: TextField(
                                  controller: priceController,
                                  showCursor: true,
                                  // focusNode: widget.focusNode,
                                  keyboardType: TextInputType.number,
                                  cursorColor: AppColors.black,
                                  cursorHeight: 18,
                                  decoration: InputDecoration(
                                    hintText: '0.0',
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.greyMedium),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(width: 22),
                              const Gap(8),
                              Text(
                                'SOL',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: context
                                        .themeData.scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(3),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 2)
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 6),
                                  child: const Icon(PhosphorIconsBold.minus,
                                      size: 14),
                                ),
                              ),
                              const Gap(28),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: context
                                          .themeData.scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 2)
                                      ]),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 6),
                                  child: const Icon(PhosphorIconsBold.plus,
                                      size: 14),
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Use Market',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.greyLight,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isMarketSelected,
                    child: SwapRouteTile(
                      changeRoutes: openChangeRoutesSheet,
                    ),
                  ),
                  const Gap(12),
                  Keyboard(
                    controller: priceFocusNode.hasFocus
                        ? priceController
                        : swapToFocusNode.hasFocus
                            ? swapToTokenController
                            : swapfromTokenController,
                  ),
                  const Gap(12),
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 1),
                  //     child: CustomSwipeButton(
                  //       onSwipeCompleted: _continueToLoading,
                  //     )
                  //     ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
