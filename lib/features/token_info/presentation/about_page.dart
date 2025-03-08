import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// import 'package:defy/config/assets.gen.dart';
import 'package:defy/core/extensions/context_extensions.dart';

import '../../../config/theme/colors.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    // Static data
    final coin = {
      'coin_description': 'Take the red bean to join the garden. View the collection at azuki.com/gallery.',
      'coin_link': {
        'website': 'https://website.com',
        'twitter': 'https://twitter.com',
        'discord': 'https://discord.com',
        'whitepaper': 'https://whitepaper.com',
      },
      'coin_defyapp_symbol': 'APT',
      'coin_name': 'Aptos Coin',
    };

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text('DESCRIPTION', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const SizedBox(height: 10),
            Text(
              coin['coin_description'] as String,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.greyDark,
              ),
            ),
            const SizedBox(height: 30),
            Text('SOCIALS', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  if ((coin['coin_link'] as Map<String, String>)['website'] != null)
                    const SocialTile(
                      icon: PhosphorIconsBold.globe,
                      label: 'Website',
                    ),
                  const Gap(8),
                  if ((coin['coin_link'] as Map<String, String>)['twitter'] != null)
                    const SocialTile(
                      icon: PhosphorIconsBold.twitterLogo,
                      label: 'Twitter',
                    ),
                  const Gap(8),
                  if ((coin['coin_link'] as Map<String, String>)['discord'] != null)
                    const SocialTile(
                      icon: PhosphorIconsBold.discordLogo,
                      label: 'Discord',
                    ),
                  const Gap(8),
                  if ((coin['coin_link'] as Map<String, String>)['whitepaper'] != null)
                    const SocialTile(
                      icon: PhosphorIconsBold.scroll,
                      label: 'Whitepaper',
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('PERKS (1)', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const Gap(10),
            Row(
              children: <Widget>[
                Text(
                  'Users helping us add perks will be rewarded  ',
                  style: context.bodySmall?.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                Icon(
                  PhosphorIconsFill.info,
                  color: Colors.black.withOpacity(0.5),
                  size: 16,
                ),
              ],
            ),
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(15),
                    width: context.screenWidth * 0.55,
                    height: context.screenWidth * 0.35,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/cosmos-bg.png'),
                        fit: BoxFit.fill,
                      ),
                      color: const Color(0xffF4F4F6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/rocket.png',
                              height: context.screenHeight * 0.045,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          'Cosmos',
                          style: context.titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          'Free Entry for Virtual Cosmic \nEvent',
                          style: context.bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const Gap(20),
            Text('SIMILAR NFTS', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(15),
              height: context.screenWidth * 0.3,
              width: context.screenWidth * 0.45,
              decoration: BoxDecoration(
                color: const Color(0xffF4F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/gui-inu.png',
                        height: context.screenWidth * 0.09,
                      ),
                      Text(
                        '↑ 3.16%',
                        style: context.titleMedium?.copyWith(
                          color: const Color(0xff4EB13D),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Gui Inu',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'GUI',
                    style: context.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('PRICE SIMULATION', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const Gap(6),
            Text(
              'The Price of APT with the market cap of another assets',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyLight,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/gui-inu.png',
                          height: 40,
                        ),
                        const Gap(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gui Inu',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'GUI',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '\$142.39',
                              style: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'x0.10021',
                              style: context.bodyMedium?.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Gap(35),
            Text('CALCULATOR', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const Gap(12),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('assets/icons/aptos-logo.png',
                              height: 24),
                          const SizedBox(width: 10),
                          Text(
                            (coin['coin_defyapp_symbol'] as String?)?.toUpperCase() ?? '',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: context.screenWidth * 0.45,
                        height: context.screenWidth * 0.125,
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '90.02',
                              style: context.titleMedium?.copyWith(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('assets/icons/usdc.png',
                              height: 24),
                          const SizedBox(width: 10),
                          Text('USDC', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: context.screenWidth * 0.45,
                        height: context.screenWidth * 0.125,
                        decoration: BoxDecoration(
                          color: const Color(0xffF4F4F6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '90.02',
                              style: context.titleMedium?.copyWith(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('ADDITIONAL INFO', style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              height: context.screenHeight * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xffF4F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        PhosphorIconsRegular.scroll,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Contract',
                        style: context.titleMedium?.copyWith(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        truncateMiddle('0x1::aptos_coin::AptosCoin'),
                        overflow: TextOverflow.ellipsis,
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        PhosphorIconsRegular.link,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Chain',
                        style: context.titleMedium?.copyWith(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        getChainName(coin['coin_name'] as String?),
                        overflow: TextOverflow.ellipsis,
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        PhosphorIconsRegular.asterisk,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Token Standard',
                        style: context.titleMedium?.copyWith(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'ERC-721',
                        overflow: TextOverflow.ellipsis,
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  String truncateMiddle(String text, {int startLength = 4, int endLength = 4}) {
    if (text.length <= startLength + endLength) return text;
    return '${text.substring(0, startLength)}..${text.substring(text.length - endLength)}';
  }

  String getChainName(String? text) {
    if (text == null || text.isEmpty) return '';
    return text.split(' ').first.toUpperCase();
  }
}

class SocialTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const SocialTile({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) => Container(
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 16,
            color: Color.fromARGB(255, 151, 157, 170),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromARGB(255, 42, 46, 54),
            ),
          ),
        ],
      ),
    );
}