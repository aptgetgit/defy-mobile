import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../wallet/data/models/nft_model.dart';
import 'custom_check_box.dart';

class NFTItem extends StatelessWidget {
  const NFTItem({
    required this.nft,
    required this.isSelected,
    required this.showCheckbox,
    required this.onCheckboxChanged,
    super.key,
  });

  final NFT nft;
  final bool isSelected;
  final bool showCheckbox;
  final ValueChanged<bool>? onCheckboxChanged;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      if (nft.onTap != null) {
        nft.onTap!();
      } else {
        // Default navigation based on NFT type
        _navigateToNFTInfo(context);
      }
    },
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              // NFT Image with opacity based on selection
              Opacity(
                opacity: isSelected ? 0.5 : 1.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    nft.imageUrl,
                    width: double.infinity,
                    height: 185,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Checkbox - only show when in selection mode
              if (showCheckbox)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CustomCheckbox(
                    isChecked: isSelected,
                    isRound: true,
                    onTap: () {
                      onCheckboxChanged?.call(!isSelected);
                    },
                  ).animate().slideX(
                    duration: const Duration(milliseconds: 300),
                    begin: 1,
                    end: 0,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nft.id,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.grey : AppColors.greyLight,
                  ),
                ),
                const Gap(4),
                Text(
                  nft.price,
                  style: TextStyle(
                    fontSize: 18,
                    color: isSelected ? Colors.grey : AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  void _navigateToNFTInfo(BuildContext context) {
    switch (nft.type) {
      case NFTType.audio:
        const NftInfoAudioRoute().push(context);
      case NFTType.video:
        const NftInfoVideoRoute().push(context);
      case NFTType.image:
        const NftInfoRoute().push(context);
    }
  }
}