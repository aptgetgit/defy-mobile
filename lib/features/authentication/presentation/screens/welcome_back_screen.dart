import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:math' as math;

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(PhosphorIconsBold.caretLeft),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderText(context),
          _buildEmojiGifs(context),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hello again, Allan',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Gap(16),
        Align(
          alignment: Alignment.topCenter,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text:
                    'Looks like you already have a profile created,\nMissed you! Enjoy a ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyLight,
                ),
                children: [
                  TextSpan(
                    text: 'welcome-back reward.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.yellow,
                    ),
                  )
                ]),
          ),
        ),
        const Gap(22),
        _buildCoinReward(context),
      ],
    );
  }

  Widget _buildCoinReward(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.yellow,
        ),
        constraints: BoxConstraints(
          minWidth: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.coinLogo.image(
              width: 22,
              color: AppColors.white,
            ),
            const Gap(6),
            Text(
              '+20 Coins',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiGifs(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    return SizedBox(
      height: height * .3142,
      width: double.maxFinite,
      child: Stack(
        children: [
          _buildEmojiContanier(
            leftP: width * .1261,
            topP: height * .0248,
            dashPattern: [12, 8],
            height: height * .0888,
            width: width * .1922,
            color: [
              Color(
                0xffd4d4d3,
              ),
              Color(0xffdddddd)
            ],
            gif: Assets.gifs.grinningFaceWithSmilingEyes,
            gifSize: width * .1117,
            gifAngle: math.pi / 18,
          ),
          _buildEmojiContanier(
            leftP: width * .4803,
            topP: 0.0,
            dashPattern: [12, 8],
            height: height * .0606,
            width: width * .1311,
            color: [
              Color(
                0xffcbf4d2,
              ),
              Color(0xffbbe7cc)
            ],
            gif: Assets.gifs.grinningFaceWithSmilingEyes,
            gifSize: width * .0762,
            gifAngle: -(math.pi / 10),
          ),
          _buildEmojiContanier(
            leftP: width * .3594,
            topP: height * .0881,
            dashPattern: [12, 8],
            height: height * .1056,
            width: width * .2284,
            color: [
              Color(
                0xffdfd8fa,
              ),
              Color(0xffa38cd4)
            ],
            gif: Assets.gifs.starStruck,
            gifSize: width * .1329,
            gifAngle: math.pi / 12,
          ),
          _buildEmojiContanier(
            leftP: width * .6665,
            topP: height * .0728,
            dashPattern: [12, 8],
            height: height * .0797,
            width: width * .1723,
            color: [
              Color(
                0xfff7d9ae,
              ),
              Color(0xffffb845)
            ],
            gif: Assets.gifs.faceWithTearsOfJoy,
            gifSize: width * .1159,
            gifAngle: -(math.pi / 14),
          ),
          _buildEmojiContanier(
            leftP: width * .1348,
            topP: height * .1664,
            dashPattern: [12, 8],
            height: height * .0861,
            width: width * .1861,
            color: [
              Color(
                0xffc8edfd,
              ),
              Color(0xffc8edfd)
            ],
            gif: Assets.gifs.smilingFaceWithHalo,
            gifSize: width * .0925,
            gifAngle: -(math.pi / 12),
          ),
          _buildEmojiContanier(
            leftP: width * .6534,
            topP: height * .1858,
            dashPattern: [12, 8],
            height: height * .0636,
            width: width * .1376,
            color: [
              Color(
                0xfffaced4,
              ),
              Color(0xffff9cbb)
            ],
            gif: Assets.gifs.kissingFace,
            gifSize: width * .0773,
            gifAngle: math.pi / 18,
          ),
          _buildEmojiContanier(
            leftP: width * .4410,
            topP: height * .2351,
            dashPattern: [12, 8],
            height: height * .0542,
            width: width * .1173,
            color: [
              Color(
                0xfffdbcba,
              ),
              Color(0xfffdbcba)
            ],
            gif: Assets.gifs.slightlySmilingFace,
            gifSize: width * .0683,
            gifAngle: math.pi / 16,
          ),
        ],
      ),
    );
  }

  Widget _buildEmojiContanier({
    required double leftP,
    required double topP,
    required List<double> dashPattern,
    required double height,
    required double width,
    required List<Color> color,
    required AssetGenImage gif,
    required double gifSize,
    required double gifAngle,
  }) {
    return Positioned(
      left: leftP,
      top: topP,
      child: DottedBorder(
        strokeWidth: 2,
        color: AppColors.greyLight,
        borderType: BorderType.Circle,
        dashPattern: dashPattern,
        child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(3),
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: color,
              ),
            ),
            child: Transform.rotate(
              angle: gifAngle,
              child: gif.image(
                width: gifSize,
              ),
            )),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Ready to choose your wallets?',style: TextStyle(
            color: AppColors.greyLight,
            fontSize: 16,
          ),),
          const Gap(16),
          SizedBox(
            height: 56,
            child: ElevatedButton(onPressed: (){}, child: Text('Choose Wallet'),)),
        ],
      ),
    );
  }
}
