import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateImportWalletScreen extends StatefulWidget {
  const CreateImportWalletScreen({super.key});

  @override
  State<CreateImportWalletScreen> createState() =>
      _CreateImportWalletScreenState();
}

class _CreateImportWalletScreenState extends State<CreateImportWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color(0xfff8f8f8),
                  Color(0xfffee6e2),
                  Color(0xffeee9ff),
                  Color(0xffe1f1ff),
                ])),
          )),
          Positioned(
            top: height * .1,
            left: 0,
            right: 0,
            child: Assets.images.mobileFrame.image(
              width: width * .7985,
              height: height * .5035,
            ),
          ),
          Positioned(
            top: height * .13,
            left: 0,
            right: 0,
            child: Assets.images.mobileFrameNotch.image(
              width: width * .2143,
              height: height * .0318,
            ),
          ),
          Positioned(
            top: height * .2571,
            left: 0,
            right: 0,
            child: _buildRecentTransactionTile(context),
          ),
          Positioned.fill(
            top: height * .44100,
            child: _buildWids(context),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactionTile(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    return SizedBox(
      height: height * .1745,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height * .0495,
                    width: width * .1071,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffd2e3fc),
                    ),
                    child: Assets.icons.maleEmoji.image(
                      width: 39.48,
                    )),
                const Gap(8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Allan Jerrold',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sent you 7.02 APT',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Now',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height * .0495,
                    width: width * .1071,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffb8b9f3),
                    ),
                    child: Assets.icons.femaleEmoji.image(
                      width: 39.48,
                    )),
                const Gap(8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Bethany Cruz',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sent you 12.45 USD',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Yesterday',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWids(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.white.withOpacity(.3),
            AppColors.white,
            AppColors.white,
            AppColors.white,
            AppColors.white,
            AppColors.white,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildEmojis(context),
          const Spacer(),
          Text(
            'Create your Wallet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(6),
          Text(
            'Creating wallet will help you get the full\ndefy experience all over the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.greyLight,
            ),
          ),
          const Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
            child: ActiveButton(label: 'Create Wallet', onTap: () {},size: ButtonSize.large,),
          ),
          TextButton(onPressed: (){}, child: Text('Import Wallet',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.greyDark,
          ),),),

          const Gap(18),
        ],
      ),
    );
  }

  Widget _buildEmojis(BuildContext context) {
    final (width, height) = (context.screenWidth, context.screenHeight);
    return SizedBox(
      height: height * .2520,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: height * .2520 * .3220,
            child: Container(
              height: height * .2520 * .4178,
              width: width * .2282,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffdfd8fa),
                    Color(0xffa38cd4),
                  ],
                ),
              ),
              child: Transform.rotate(
                angle: 16.98 * 3.14159 / 180,
                child: Assets.gifs.starStruck.image(
                  width: width * .1327,
                ),
              ),
            ),
          ),
          Positioned(
            left: width * .1810,
            top: height * .2520 * .3010,
            child: Container(
              height: height * .2520 * .1807,
              width: width * .0910,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xffcbf4d2),
                    Color(0xffbbe7cc),
                  ],
                ),
              ),
              child: Transform.rotate(
                angle: -16.98 * 3.14159 / 180,
                child: Assets.gifs.grinningFaceWithSmilingEyes.image(
                  width: width * .0568,
                ),
              ),
            ),
          ),
          Positioned(
            left: width * .0612,
            top: height * .2520 * .5710,
            child: Container(
              height: height * .2520 * .2150,
              width: width * .1173,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffc8edfd),
              ),
              child: Transform.rotate(
                angle: -16.98 * 3.14159 / 180,
                child: Assets.gifs.smilingFaceWithHalo.image(
                  width: width * .0608,
                ),
              ),
            ),
          ),
          Positioned(
            left: width * .2364,
            top: height * .2520 * .6842,
            child: Container(
              height: height * .2520 * .2250,
              width: width * .1273,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffc8edfd),
              ),
              child: Transform.rotate(
                angle: 16.98 * 3.14159 / 180,
                child: Assets.gifs.grinningFaceWithSmilingEyes.image(
                  width: width * .0708,
                ),
              ),
            ),
          ),
          //----------
          Positioned(
            right: width * .1810,
            top: height * .2520 * .3010,
            child: Container(
              height: height * .2520 * .2250,
              width: width * .1273,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xfffdbcba),
              ),
              child: Transform.rotate(
                angle: 16.98 * 3.14159 / 180,
                child: Assets.gifs.slightlySmilingFace.image(
                  width: width * .0708,
                ),
              ),
            ),
          ),
          Positioned(
            right: width * .0612,
            top: height * .2520 * .5710,
            child: Container(
              height: height * .2520 * .2150,
              width: width * .1173,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xfffaced4),
                    Color(0xffff9cbb),
                  ],
                ),
              ),
              child: Transform.rotate(
                angle: 16.98 * 3.14159 / 180,
                child: Assets.gifs.kissingFace.image(
                  width: width * .0608,
                ),
              ),
            ),
          ),
          Positioned(
            right: width * .2364,
            top: height * .2520 * .6842,
            child: Container(
              height: height * .2520 * .2150,
              width: width * .1173,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xfff7d9ae),
                    Color(0xffffb845),
                  ],
                ),
              ),
              child: Transform.rotate(
                angle: -16.98 * 3.14159 / 180,
                child: Assets.gifs.faceWithTearsOfJoy.image(
                  width: width * .0708,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
