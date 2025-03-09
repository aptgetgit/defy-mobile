import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';

class BalanceSheet extends StatelessWidget {

  const BalanceSheet({
    super.key, 
    required this.selectedOption, 
    required this.onOptionSelected,
  });
  final String selectedOption;
  final Function(String) onOptionSelected;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        padding: const EdgeInsets.only(bottom: 20, top:10, left: 20),
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Balances',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(PhosphorIconsBold.x, color: AppColors.black, size: 20),
                  ),
                ],
              ),
            ),
            const Gap(12),
            _buildOptionRow('🚀', 'Total Balance', selectedOption, onOptionSelected),
            const Gap(18),
            _buildOptionRow('🏋', 'NFT Only', selectedOption, onOptionSelected),
            const Gap(18),
            _buildOptionRow('🚀', 'Token Only', selectedOption, onOptionSelected),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color(0x192071EE),
                  minimumSize: const Size(double.infinity, 54),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: AppColors.blue, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildOptionRow(String emoji, String title, String selectedOption, Function(String) onTap) => Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Row(
      children: <Widget>[
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const Gap(12),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const Spacer(),
        CustomCheckbox(
          isChecked: selectedOption == title,
          isRound: true,
          onTap: () => onTap(title),
        ),
        const Gap(12),
      ],
    ),
  );
}
