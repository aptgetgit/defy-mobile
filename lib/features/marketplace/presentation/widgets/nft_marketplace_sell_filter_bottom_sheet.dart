import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:defy/features/marketplace/presentation/provider/nft_marketplace_sell_provider.dart';
import 'package:defy/features/marketplace/presentation/state/nft_marketplace_sell_state_model.dart';

class NFTMarketplaceSellFilterBottomSheet extends ConsumerStatefulWidget {
  const NFTMarketplaceSellFilterBottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<NFTMarketplaceSellFilterBottomSheet> createState() =>
      _NFTMarketplaceSellFilterBottomSheetState();
}

class _NFTMarketplaceSellFilterBottomSheetState
    extends ConsumerState<NFTMarketplaceSellFilterBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late String _tempSortBy;
  late bool _isAscending;

  final List<Map<String, dynamic>> _sortOptions = [
    {'name': 'Alphabetic Order', 'key': 'Alphabetic Order'},
    {'name': 'Collection Floor', 'key': 'Collection Floor'},
    {'name': 'Collection Volume', 'key': 'Collection Volume'},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
    final currentState = ref.read(nFTMarketplaceSellNotifierProvider);
    _tempSortBy = currentState.sortBy;
    _isAscending = currentState.isAscending;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSortOption(String option) {
    setState(() {
      if (_tempSortBy == option) {
        _isAscending = !_isAscending;
      } else {
        _tempSortBy = option;
        _isAscending = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, (1 - _animation.value) * 100),
          child: Opacity(
            opacity: _animation.value,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(PhosphorIconsBold.x),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sort by',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _sortOptions
                        .map((option) => _buildSortOptionButton(option))
                        .toList(),
                  ),
                  const SizedBox(height: 50),
                  ActiveButton(
                    label: 'Apply',
                    onTap: () {
                      ref
                          .read(nFTMarketplaceSellNotifierProvider.notifier)
                          .setSortBy(_tempSortBy, _isAscending);

                      Navigator.pop(context);
                    },
                    active: true,
                    size: ButtonSize.large,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSortOptionButton(Map<String, dynamic> option) {
    bool isSelected = _tempSortBy == option['key'];

    return GestureDetector(
      onTap: () => _toggleSortOption(option['key']),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffe9f1fd) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              option['name'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xff2071ee)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              Icon(
                _isAscending
                    ? PhosphorIconsRegular.trendUp
                    : PhosphorIconsRegular.trendDown,
                size: 16,
                color: const Color(0xff2071ee),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
