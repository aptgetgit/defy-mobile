import 'package:defy/config/assets.gen.dart';
import 'package:defy/features/blockchain/presentation/providers/account/new_wallet_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletCardBack extends StatelessWidget {
  const WalletCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final cardColor = ref.watch(
          newWalletDataStateProvider.select((value) => value.cardColor),
        );
        return Container(
          width: 342,
          height: 185,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Assets.images.sprinkleBottom.svg(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Assets.images.sprinkleBottom.svg(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Assets.images.sprinkleBottom.svg(),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Assets.images.sprinkle.svg(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 48, top: 20),
                  child: Assets.images.sprinkle.svg(),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Text(
                    'AVEX',
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
