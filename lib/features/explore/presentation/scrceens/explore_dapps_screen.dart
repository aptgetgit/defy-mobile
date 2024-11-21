import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ExploreDappsScreen extends StatefulWidget {
  const ExploreDappsScreen({super.key});

  @override
  State<ExploreDappsScreen> createState() => _ExploreDappsScreenState();
}

class _ExploreDappsScreenState extends State<ExploreDappsScreen> {
  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dapps',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search bar
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xfff4f4f6),
                    borderRadius: BorderRadius.circular(58),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(16),
                      Icon(
                        PhosphorIconsBold.magnifyingGlass,
                        color: AppColors.greyMedium,
                      ),
                      const Gap(8),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          controller: _searchConroller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search or paste URL",
                            hintStyle: TextStyle(
                              color: AppColors.greyMedium,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        PhosphorIconsBold.cards,
                        color: AppColors.greyMedium,
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
                const Gap(8),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Dapp',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                _buildDappTile(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDappTile(BuildContext context) {
    final width = context.screenWidth;
    final dapps = [
      Assets.icons.uniswapDexLogo,
      Assets.icons.petraWalletLogo,
      Assets.icons.rainbowWalletLogo,
    ];
    final dappNames = [
      "Uniswap",
      "Petra Wallet",
      "Rainbow",
    ];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: dapps.length,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
                context: context, builder: (ctx) => _buildDappModalSheet(ctx));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                dapps[index].image(width: width * .16),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          dappNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(12),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'DeFi',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyDark),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Staking',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyDark),
                          ),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: width - width * .3),
                      child: Text(
                        'Uniswap allows direct crypto swapping without middlemen,using, automated...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyLight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDappModalSheet(BuildContext context) {
    final coinsLogos = [
      "https://res.coinpaper.com/coinpaper/Aptos_mark_BLK_02443605a1.png",
      "https://res.coinpaper.com/coinpaper/usd_coin_usdc_logo_3e68fafa38.png",
      "https://res.coinpaper.com/coinpaper/tether_usdt_logo_0231fbcde8.png",
      "https://res.coinpaper.com/coinpaper/dogecoin_doge_logo_f18d59aae4.png"
    ];
    final width = context.screenWidth;
    final height = context.screenHeight;
    return Container(
       padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Assets.icons.uniswapDexLogo.image(width: width * .16),
                const Gap(3),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Uniswap',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'DeFi',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyDark),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: AppColors.greyVeryLight2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Staking',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyDark),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    PhosphorIconsBold.x,
                    size: 26,
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),

            //description
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Swap cryptocurrencies directly without intermediaries on Uniswap\'s automated platform.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyLight,
                ),
              ),
            ),
            const Gap(26),

            //network
            Row(
              children: [
                Icon(
                  PhosphorIconsBold.shareNetwork,
                  color: AppColors.greyLight,
                ),
                const Gap(12),
                Text(
                  'Network',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyLight,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    SizedBox(
                      height: width * .06,
                      width: width * .05 * 4,
                      child: Stack(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Positioned(
                              left: i * width * .04,
                              child: Image.network(
                                coinsLogos[i],
                                width: width * .06,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      '+2',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyLight,
                      ),
                    )
                  ],
                ),
              ],
            ),

            const Gap(12),

            //socials
            Row(
              children: [
                Icon(
                  PhosphorIconsBold.cellSignalHigh,
                  color: AppColors.greyLight,
                ),
                const Gap(12),
                Text(
                  'Socials',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyLight,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(PhosphorIconsBold.globe,size: 22,color: AppColors.greyLight,),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(PhosphorIconsBold.twitterLogo,size: 22,color: AppColors.greyLight,),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight2,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(PhosphorIconsBold.discordLogo,size: 22,color: AppColors.greyLight,),
                    ),
                  ],
                ),
              ],
            ),

            const Gap(28),

            //skip page descrition
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: 1.2,
                  child: Checkbox(
                    value: false, 
                    onChanged: (v){},
            side: const BorderSide(
              color: AppColors.greyMedium,
              width: 2,
            ),
                    ),),
                Flexible(
                  child: Text(
                    'Skip this page next time and go directly to Uniswap',
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyDark,
                    ),
                    ),
                ),
              ],
            ),
            const Gap(12),

            //launch button
            ActiveButton(
              label: 'Launch App',
              onTap: (){},
              isDarkMode: false,
            ),
          ],
        ),
        );
  }
}
