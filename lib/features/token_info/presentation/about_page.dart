import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:defy/config/assets.gen.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy_graphql/defy_graphql.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});

  @override
  ConsumerState<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final client = ref.read(defyGraphQlClientProvider);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GraphQLProvider(
          client: ValueNotifier(client),
          child: Query(
            options: QueryOptions(
              document: documentNodeQueryFetchTokenInfo,
              variables: const {
                'coin_id': '0x1::aptos_coin::AptosCoin',
              },
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return Center(
                  child: Lottie.asset(Assets.animations.loadingIndicator),
                );
              }
              if (result.data == null) {
                return const Center(
                  child: Text("No data found!"),
                );
              }

              final coin = result.data!['coins']?.first;
              if (coin == null) {
                return const Center(
                  child: Text("No valid data found!"),
                );
              }
              print('About Page : $coin');

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text("DESCRIPTION", style: context.titleLarge),
                  const SizedBox(height: 10),
                  Text(
                    coin['coin_description'] ?? 'No description',
                    style: context.bodyMedium,
                  ),
                  const SizedBox(height: 30),
                  Text("SOCIALS", style: context.titleLarge),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (coin['coin_link']!['discord'] != null)
                          const SocialTile(
                            icon: PhosphorIconsRegular.discordLogo,
                            label: 'Discord',
                          ),
                        if (coin['coin_link']!['facebook'] != null)
                          const SocialTile(
                            icon: PhosphorIconsRegular.facebookLogo,
                            label: 'Facebook',
                          ),
                        if (coin['coin_link']!['github'] != null)
                          const SocialTile(
                            icon: PhosphorIconsRegular.githubLogo,
                            label: 'GitHub',
                          ),
                        if (coin['coin_link']!['website'] != null)
                          const SocialTile(
                            icon: PhosphorIconsRegular.globeHemisphereWest,
                            label: 'Website',
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("PERKS (1)", style: context.titleLarge),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        "Users helping us add perks will be rewarded  ",
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
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: context.screenWidth * 0.55,
                          height: context.screenWidth * 0.35,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/cosmos-cg.png'),
                              fit: BoxFit.fill,
                            ),
                            color: const Color(0xffF4F4F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/rocket.png',
                                    height: context.screenHeight * 0.045,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "Cosmos",
                                style: context.titleLarge?.copyWith(color: Colors.white),
                              ),
                              Text(
                                "Free Entry for Virtual Cosmic \nEvent",
                                style: context.bodySmall?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Text("SIMILAR NFTS", style: context.titleLarge),
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
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/icons/gui-inu.png',
                              height: context.screenWidth * 0.09,
                            ),
                            Text(
                              "↑ 3.16%",
                              style: context.titleMedium?.copyWith(
                                color: const Color(0xff4EB13D),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "Gui Inu",
                          style: context.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "GUI",
                          style: context.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("PRICE SIMULATION", style: context.titleLarge),
                  Text(
                    "The Price of APT with the market cap of another assets",
                    style: context.bodySmall?.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/icons/gui-inu.png',
                                height: 40,
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gui Inu",
                                    style: context.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "GUI",
                                    style: context.bodyMedium?.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$142.39",
                                    style: context.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "x0.10021",
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
                  const SizedBox(height: 20),
                  Text("CALCULATOR", style: context.titleLarge),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/icons/aptos-logo.png', height: 40),
                                const SizedBox(width: 10),
                                Text(
                                  coin['coin_defyapp_symbol']?.toUpperCase() ?? '',
                                  style: context.headlineSmall,
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
                                children: [
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/icons/usdc.png', height: 40),
                                const SizedBox(width: 10),
                                Text('USDC', style: context.headlineSmall),
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
                                children: [
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
                  Text("ADDITIONAL INFO", style: context.titleLarge),
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
                      children: [
                        Row(
                          children: [
                            Icon(
                              PhosphorIconsRegular.scroll,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Contract",
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
                          children: [
                            Icon(
                              PhosphorIconsRegular.link,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Chain",
                              style: context.titleMedium?.copyWith(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              getChainName(coin['coin_name']),
                              overflow: TextOverflow.ellipsis,
                              style: context.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              PhosphorIconsRegular.asterisk,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Token Standard",
                              style: context.titleMedium?.copyWith(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "ERC-721",
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
              );
            },
          ),
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
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: context.screenWidth * 0.25,
      decoration: BoxDecoration(
        color: const Color(0xffF4F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
            color: Colors.black,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: context.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}