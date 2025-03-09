import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';
import '../data/models/token_model.dart';

class TokenItem extends StatelessWidget {

  const TokenItem({
    super.key,
    required this.token,
    required this.isSelected,
    required this.isInWatchlist,
    required this.showSelection,
    required this.onCheckboxTap,
  });
  final Token token;
  final bool isSelected;
  final bool isInWatchlist;
  final bool showSelection;
  final VoidCallback onCheckboxTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 8),
    child: ListTile(
      title: Text(
        token.name, 
        style: TextStyle(fontSize: 18, color: isSelected ? Colors.grey : Colors.black)
      ),
      subtitle: Text(
        '${token.amount} ${token.currency}', 
        style: TextStyle(fontSize: 14, color: isSelected ? Colors.grey : AppColors.greyLight)
      ),
      leading: Stack(
        children: <Widget>[
          Opacity(
            opacity: isSelected ? 0.5 : 1,
            child: ClipOval(
              child: Image.asset(token.imagePath, width: 44, height: 44),
            ),
          ),
          if (isInWatchlist && showSelection)
            Positioned(
              top: -4,
              left: -4,
              child: Image.asset('assets/icons/watchlist-logo2.png', width: 21, height: 21),
            ),
        ],
      ),
      trailing: showSelection
          ? _buildSelectionTrailing()
          : _buildNormalTrailing(),
    ),
  );

  Widget _buildSelectionTrailing() => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '\$${token.balance}', 
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: isSelected ? Colors.grey : Colors.black),
          ),
          Text(
            '${token.percentageChange}%',
            style: TextStyle(
              color: token.percentageChange >= 0 ? Colors.green : Colors.red,
              fontSize: 14,
            ),
          ),
        ],
      ),
      const Gap(16),
      CustomCheckbox(
        isChecked: isSelected,
        isRound: true,
        onTap: onCheckboxTap,
      ),
    ],
  );

  Widget _buildNormalTrailing() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Text('\$${token.balance}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      Text(
        '${token.percentageChange}%',
        style: TextStyle(
          color: token.percentageChange >= 0 ? Colors.green : Colors.red,
          fontSize: 14,
        ),
      ),
    ],
  );
}
