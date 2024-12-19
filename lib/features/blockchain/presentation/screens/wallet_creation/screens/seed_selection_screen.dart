import 'package:defy/config/assets.gen.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/components/animated_emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


class SeedSelectionScreen extends ConsumerWidget {
  const SeedSelectionScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose Seedphrase',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
        actions: [
          Icon(PhosphorIcons.x(PhosphorIconsStyle.bold)),
          const Gap(16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select in which Seedphrase you want to create wallet',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Consumer(
                builder: (context, ref, child) {
                  // var seedWalletCount =
                  //     ref.watch(getSeedWalletCountMapProvider);
                  var seedWalletCount;
                  //!REMOVE
                  seedWalletCount = const AsyncData({
                    "isasawd": 3,
                    "adsd": 4,
                  });
                  return seedWalletCount.when(
                    data: (data) {
                      final values = data.keys.toList();
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: values.length,
                        itemBuilder: (context, index) {
                          final count = data[values[index]];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              // visualDensity: const VisualDensity(vertical: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                // vertical: 3,
                                horizontal: 12,
                              ),
                              tileColor: colorFromHex('#F4F4F6'),
                              leading: Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: Assets.images.seed.provider()),
                                ),
                              ),
                              title: Text(
                                'Seedphase ${index + 1}',
                                
                              ),
                              titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                              subtitle: Text('$count Wallets'),
                              subtitleTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                              trailing: Text(
                                '\$232.02',
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color:AppColors.blue),
                              ),
                            ),
                          ).animate().fadeIn();
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return const SizedBox();
                    },
                    loading: () => ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ShimmerWidget(
                          child: Container(
                            height: 80,
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.greyLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  onTap: () {
                  },
                  child: ListTile(
                    // visualDensity: const VisualDensity(vertical: 2),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    tileColor: colorFromHex('#F4F4F6'),
                    leading: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        PhosphorIconsBold.plus,
                        color: AppColors.white,
                        size: 30,
                      ),
                    ),
                    title: const Text('Create new'),
                    subtitle:
                        const Text('A new seed phrase will be generated '),
                    titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    subtitleTextStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
