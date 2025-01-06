import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/blockchain/presentation/providers/account/dashboard_ui_provider.dart';
import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:defy/features/blockchain/presentation/providers/states/card_color.dart';
import 'package:defy/features/blockchain/presentation/providers/states/creation_stage_controller.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/wallet_creation_stage_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CardCustomizationWidget extends StatefulWidget {
  final bool disableAnimation;
  const CardCustomizationWidget({super.key, this.disableAnimation = false});

  @override
  State<CardCustomizationWidget> createState() =>
      _CardCustomizationWidgetState();
}

class _CardCustomizationWidgetState extends State<CardCustomizationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sizeAnimation = Tween<double>(begin: 1, end: 1.4)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Consumer(
      builder: (context, ref, child) {
        final cardZoomed = ref.watch(cardZoomedProvider);
        final cardColor = ref.watch(
            newWalletDataStateProvider.select((value) => value.cardColor));

        if (cardZoomed) {
          controller.forward();
          return ZoomedCardView(width, cardColor);
        } else {
          controller.reverse();
          return FullCardView(width, cardColor);
        }
      },
    );
  }

  SizedBox FullCardView(double width, CardColor cardColor) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: widget.disableAnimation,
            replacement: CardSection(width, cardColor)
                .animate()
                .fadeIn(duration: 1.seconds),
            child: CardSection(width, cardColor),
          )
        ],
      ),
    );
  }

  Container ZoomedCardView(double width, CardColor cardColor) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: width,
      child: AnimatedBuilder(
        animation: sizeAnimation,
        builder: (context, child) {
          // Calculate translation based on zoom factor
          final scale = sizeAnimation.value;
          final translation = (width * (scale - 1)) / 2;

          return Transform(
            transform: Matrix4.identity()
              ..scale(scale)
              ..translate(translation),
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              child: Align(
                widthFactor: 0.7,
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: CardSection(width, cardColor),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Consumer CardSection(double width, CardColor cardColor) {
    return Consumer(
      builder: (context, ref, child) {
        final newWalletState = ref.watch(newWalletDataStateProvider);
        return Container(
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            color: cardColor.color,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 9,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 3,
                child: Assets.images.doodleLeft.svg(),
              ),
              Positioned(
                top: 4,
                left: 60,
                child: Assets.images.doodleRight.svg(),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Assets.images.sprinkle.svg(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Assets.images.sprinkleBottom.svg(),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 23, right: 20),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white38,
                          radius: 24,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Consumer(
                              builder: (context, ref, child) {
                                return ref.watch(cardEmojiProvider);
                              },
                            ),
                          ),
                        ),
                        title: Consumer(builder: (ctx, ref, child) {
                          final stageController =
                              ref.watch(walletCreationStageProvider);
                          if (stageController.stage == CreationStage.stageOne) {
                            return Consumer(
                              builder:(ctx,ref,child){
                                final walletTextController = ref.read(walletCreationTextControllerProvider);
                              return SizedBox(
                                height: 32,
                                child: TextField(
                                  showCursor: true,
                                  focusNode: focusNode,
                                  controller: walletTextController,
                                  onChanged: (v) {},
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    hintText: 'Enter Wallet Name',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyLight),
                                  ),
                                ),
                              );
                          }
                            );
                          }
                          return Text(newWalletState.name);
                        }),
                        titleTextStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                        subtitle: const Text('Wallet Address'),
                        subtitleTextStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                        trailing: Column(
                          children: [
                            const Gap(6),
                            Icon(
                              PhosphorIcons.qrCode(),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Gap(24),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                              ),
                              Text(
                                '-------------',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            newWalletState.personaName,
                          ),
                          const Gap(24),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
