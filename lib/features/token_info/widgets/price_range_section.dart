import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../../core/extensions/context_extensions.dart';

class PriceRangeSection extends StatefulWidget {
  const PriceRangeSection({
    super.key,
    required this.lowPrice,
    required this.highPrice,
    required this.lastTradedPrice,
    this.onPriceChanged,
  });
  
  final double lowPrice;
  final double highPrice;
  final double lastTradedPrice;
  final Function(double)? onPriceChanged;

  @override
  State<PriceRangeSection> createState() => _PriceRangeSectionState();
}

class _PriceRangeSectionState extends State<PriceRangeSection> {
  late double _currentPrice;

  @override
  void initState() {
    super.initState();
    _currentPrice = widget.lastTradedPrice;
  }

  @override
  void didUpdateWidget(PriceRangeSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.lastTradedPrice != widget.lastTradedPrice) {
      _currentPrice = widget.lastTradedPrice;
    }
  }

  double _calculateSliderValue() {
    // Handle the case when highPrice and lowPrice are equal or very close
    if ((widget.highPrice - widget.lowPrice).abs() < 0.001) {
      return 0.5; // Return middle value
    }
    
    // Clamp the value between 0.0 and 1.0 to prevent out of range errors
    final double value = (_currentPrice - widget.lowPrice) / (widget.highPrice - widget.lowPrice);
    return value.clamp(0.0, 1.0);
  }

  void _handleSliderChange(double value) {
    final newPrice = widget.lowPrice + value * (widget.highPrice - widget.lowPrice);
    setState(() {
      _currentPrice = newPrice;
    });
    
    if (widget.onPriceChanged != null) {
      widget.onPriceChanged!(newPrice);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '1 Day Low',
                    style: context.bodySmall?.copyWith(color: AppColors.greyLight),
                  ),
                  Text(
                    '\$${widget.lowPrice.toStringAsFixed(2)}',
                    style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '1 Day High',
                    style: context.bodySmall?.copyWith(color: AppColors.greyLight),
                  ),
                  Text(
                    '\$${widget.highPrice.toStringAsFixed(2)}',
                    style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: context.screenHeight * 0.0125),
          // Make the slider more prominent and ensure it's not obstructed
          SizedBox(
            height: 50, // Increased height for better touch area
            width: double.infinity,
            child: Slider(
              value: _calculateSliderValue(),
              onChanged: _handleSliderChange,
              divisions: 100,
              activeColor: AppColors.blue,
              inactiveColor: Colors.grey[300],
            ),
          ),
          SizedBox(height: context.screenHeight * 0.0125),
          Row(
            children: <Widget>[
              const Icon(PhosphorIconsFill.lightning, size: 16, color: Colors.black),
              SizedBox(width: context.screenWidth * 0.025),
              Text(
                'Last Traded price (LTP)',
                style: context.bodyMedium?.copyWith(color: AppColors.greyDark),
              ),
              const Spacer(),
              Text(
                '\$${_currentPrice.toStringAsFixed(2)}',
                style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
}
