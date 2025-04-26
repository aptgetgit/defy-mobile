import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/import_wallet_provider.dart';
import '../state/import_wallet_state.dart';

class WalletCardBack extends StatelessWidget {
  const WalletCardBack({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final LinearGradient cardColor = ref.watch(
            importWalletNotifierProvider
                .select((ImportWalletState state) => state.selectedWalletColor),
          );
          return Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 184,
            decoration: BoxDecoration(
              gradient: cardColor,
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

class FlipCard extends StatelessWidget {
  const FlipCard({
    required this.toggler,
    required this.frontCard,
    required this.backCard,
    super.key,
  });
  final bool toggler;
  final Widget frontCard;
  final Widget backCard;

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) =>
            Stack(
          children: <Widget>[
            if (currentChild != null) currentChild,
            ...previousChildren,
          ],
        ),
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease.flipped,
        child: toggler
            ? KeyedSubtree(
                key: const ValueKey<String>('front'), child: frontCard,)
            : KeyedSubtree(
                key: const ValueKey<String>('back'), child: backCard,),
      );

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final Animation<double> rotateAnim =
        Tween<double>(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (BuildContext context, Widget? widget) {
        final bool isUnder = (ValueKey<bool>(toggler) != widget!.key);
        double tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final double value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('toggler', toggler));
  }
}
