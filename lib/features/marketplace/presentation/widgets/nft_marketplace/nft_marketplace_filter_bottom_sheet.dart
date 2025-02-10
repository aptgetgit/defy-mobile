import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/features/marketplace/presentation/provider/marketplace_provider.dart';
import 'package:defy/features/marketplace/presentation/state/marketplace_filter_state_model.dart';
import 'package:defy/features/marketplace/presentation/state/marketplace_state_model.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTMarketplaceFilterBottomSheet extends ConsumerStatefulWidget {
  final MarketplaceFilterStateModel initialFilterState;
  final Function(MarketplaceFilterStateModel) onFilterChanged;

  const NFTMarketplaceFilterBottomSheet({
    super.key,
    required this.initialFilterState,
    required this.onFilterChanged,
  });

  @override
  ConsumerState<NFTMarketplaceFilterBottomSheet> createState() =>
      _NftMarketplaceFilterBottomSheetState();
}

class _NftMarketplaceFilterBottomSheetState
    extends ConsumerState<NFTMarketplaceFilterBottomSheet>
    with TickerProviderStateMixin {
  late MarketplaceFilterStateModel _filterState;
  late AnimationController _animationController;
  late Animation<double> _animation;
  late AnimationController _sliderAnimationController;
  late Animation<double> _sliderAnimation;

  final List<Map<String, String>> _sortOptions = <Map<String, String>>[
    <String, String>{'name': 'Volume', 'key': 'volume'},
    <String, String>{'name': 'Vol USD', 'key': 'vol_usd'},
    <String, String>{'name': 'Market Cap', 'key': 'market_cap'},
    <String, String>{'name': 'Sales', 'key': 'sales'},
    <String, String>{'name': 'Average', 'key': 'average'},
  ];

  final List<String> _timePeriods = <String>[
    '24 Hrs',
    '7 Days',
    '14 Days',
    '30 Days',
    '60 Days',
    '90 Days',
    '1 Year',
    'All Time',
  ];

  final List<String> _timeLabels = <String>[
    '24H',
    '7D',
    '14D',
    '30D',
    '60D',
    '90D',
    '1Y',
    'ALL',
  ];

  double _sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _filterState = widget.initialFilterState;
    _updateSliderFromFilterState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
    _sliderAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _sliderAnimation = CurvedAnimation(
      parent: _sliderAnimationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _sliderAnimationController.dispose();
    super.dispose();
  }

  void _updateSliderFromFilterState() {
    final String selectedPeriod = _filterState.selectedPeriod.isNotEmpty
        ? _filterState.selectedPeriod.first
        : _timePeriods.first;
    _sliderValue = _timePeriods.indexOf(selectedPeriod).toDouble();
  }

  void _toggleSortOption(String option) {
    setState(() {
      if (_filterState.selectedSortBy.contains(option)) {
        _filterState = _filterState.copyWith(
          isAscending: !_filterState.isAscending,
        );
      } else {
        _filterState = _filterState.copyWith(
          selectedSortBy: <String>[option],
          isAscending: true,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<MarketplaceStateModel>(
      marketplaceProviderProvider,
      (MarketplaceStateModel? previous, MarketplaceStateModel next) {
        if (previous?.selectedPeriod != next.selectedPeriod) {
          _updateSliderFromFilterState();
        }
      },
    );
    return AnimatedBuilder(
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
                        .map((Map<String, dynamic> option) => _buildSortOptionButton(option))
                        .toList(),
                  ),
                  // const SizedBox(height: 30),
                  // const Text(
                  //   'Period',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  _buildTimeSlider(),
                  const SizedBox(height: 50),
                  ActiveButton(
                    label: 'Apply',
                    onTap: () {
                      widget.onFilterChanged(_filterState);
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
  }

  Widget _buildSortOptionButton(Map<String, dynamic> option) {
    bool isSelected = _filterState.selectedSortBy.contains(option['key']);

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
                  ),
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
                _filterState.isAscending
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

  // Widget _buildFilterButton(String text, bool isSortBy) {
  //   bool isSelected = isSortBy
  //       ? _filterState.selectedSortBy.contains(text)
  //       : _filterState.selectedPeriod.contains(text);

  //   return GestureDetector(
  //     onTap: () {
  //       _toggleFilter(text, isSortBy);
  //     },
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 300),
  //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //       decoration: BoxDecoration(
  //         color: isSelected ? const Color(0xffe9f1fd) : Colors.grey[200],
  //         borderRadius: BorderRadius.circular(20),
  //         boxShadow: isSelected
  //             ? [
  //                 BoxShadow(
  //                     color: Colors.blue.withOpacity(0.2),
  //                     blurRadius: 6,
  //                     spreadRadius: 1)
  //               ]
  //             : [],
  //       ),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             text,
  //             style: TextStyle(
  //               fontSize: 16,
  //               fontWeight: FontWeight.w600,
  //               color: isSelected
  //                   ? const Color(0xff2071ee)
  //                   : Colors.black.withOpacity(0.5),
  //             ),
  //           ),
  //           const SizedBox(width: 5),
  //           if (isSelected)
  //             Container(
  //               padding: const EdgeInsets.all(3),
  //               decoration: BoxDecoration(
  //                 color: const Color(0xff2071ee),
  //                 borderRadius: BorderRadius.circular(20),
  //               ),
  //               child: const Icon(
  //                 PhosphorIconsBold.x,
  //                 size: 12,
  //                 color: Colors.white,
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTimeSlider() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Time Period',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 60,
          child: Stack(
            children: <Widget>[
              _buildSliderTrack(),
              _buildSliderThumb(),
              Positioned.fill(
                child: GestureDetector(
                  onHorizontalDragUpdate: _handleSliderDrag,
                  onHorizontalDragEnd: (_) => setState(() {}),
                  onTapUp: _handleSliderTap,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _buildTimeLabels(),
      ],
    );

  Widget _buildSliderTrack() => Align(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              const Color(0xff2071ee),
              const Color(0xff2071ee),
              Colors.grey[300]!,
            ],
            stops: <double>[
              0,
              _sliderValue / (_timePeriods.length - 1),
              _sliderValue / (_timePeriods.length - 1),
            ],
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );

  Widget _buildSliderThumb() {
    final double position = _sliderValue / (_timePeriods.length - 1);
    return Align(
      alignment: Alignment(position * 2 - 1, 0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff2071ee), width: 2),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeLabels() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(_timePeriods.length, (int index) {
        return _buildTimeLabel(index);
      }),
    );

  Widget _buildTimeLabel(int index) {
    final bool isSelected = _sliderValue.round() == index;
    return GestureDetector(
      onTap: () => _updateSliderValue(index.toDouble()),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          fontSize: isSelected ? 14 : 12,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? const Color(0xff2071ee) : Colors.grey[600],
        ),
        child: Text(_timeLabels[index]),
      ),
    );
  }

  void _handleSliderDrag(DragUpdateDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final double percent =
        (details.localPosition.dx / box.size.width).clamp(0.0, 1.0);
    _updateSliderValue(percent * (_timePeriods.length - 1));
  }

  void _handleSliderTap(TapUpDetails details) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final double percent =
        (details.localPosition.dx / box.size.width).clamp(0.0, 1.0);
    _updateSliderValue(percent * (_timePeriods.length - 1));
  }

  void _updateSliderValue(double newValue) {
    setState(() {
      _sliderValue = newValue.roundToDouble();
      _filterState = _filterState.copyWith(
        selectedPeriod: <String>[_timePeriods[_sliderValue.round()]],
      );
    });
    HapticFeedback.selectionClick();
  }
}
