import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/extensions/button_size_extension.dart';
import '../../../shared/presentation/widgets/custom_button.dart';
import '../provider/nft_marketplace_sell_provider.dart';
import '../state/nft_marketplace_sell_state_model.dart';

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

  final List<Map<String, dynamic>> _sortOptions = <Map<String, dynamic>>[
    <String,String >{'name': 'Alphabetic Order', 'key': 'Alphabetic Order'},
    <String,String >{'name': 'Collection Floor', 'key': 'Collection Floor'},
    <String,String >{'name': 'Collection Volume', 'key': 'Collection Volume'},
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
    final NFTMarketplaceSellState currentState = ref.read(nFTMarketplaceSellNotifierProvider);
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
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: Offset(0, (1 - _animation.value) * 100),
          child: Opacity(
            opacity: _animation.value,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
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
                        .map(_buildSortOptionButton)
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
                    size: ButtonSize.large,
                  ),
                ],
              ),
            ),
          ),
        ),
    );

  Widget _buildSortOptionButton(Map<String, dynamic> option) {
    bool isSelected = _tempSortBy == option['key'];

    return GestureDetector(
      onTap: () => _toggleSortOption(option['key'] as String),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffe9f1fd) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? <BoxShadow>[
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ]
              : <BoxShadow>[],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              option['name'] as String,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xff2071ee)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            if (isSelected) ...<Widget>[
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
