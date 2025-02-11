import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class WalletCardBack extends StatelessWidget {
  const WalletCardBack({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final Color cardColor = ref.watch(
            importWalletNotifierProvider
                .select((ImportWalletState state) => state.selectedWalletColor),
          );
          return Container(
            width: 342,
            height: 185,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 9,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    'assets/images/sprinkle-bottom.svg',
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(
                    'assets/images/sprinkle-bottom.svg',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SvgPicture.asset(
                      'assets/images/sprinkle-bottom.svg',
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    'assets/images/sprinkle.svg',
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 48, top: 20),
                    child: SvgPicture.asset(
                      'assets/images/sprinkle.svg',
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      'AVEX',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.white24,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
