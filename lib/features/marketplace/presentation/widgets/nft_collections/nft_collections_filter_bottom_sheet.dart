
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:defy/features/shared/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NftCollectionsFilterBottomSheet extends ConsumerStatefulWidget {
  final ScrollController scrollController;

  const NftCollectionsFilterBottomSheet(
      {Key? key, required this.scrollController})
      : super(key: key);

  @override
  ConsumerState<NftCollectionsFilterBottomSheet> createState() =>
      _NftCollectionsFilterBottomSheetState();
}

class _NftCollectionsFilterBottomSheetState
    extends ConsumerState<NftCollectionsFilterBottomSheet>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  RangeValues rarityRange = const RangeValues(1, 8888);
  late AnimationController _sliderAnimationController;
  late Animation<double> _sliderAnimation;
  Set<String> selectedStatus = {};
  String selectedOwner = 'All';
  String selectedCurrency = 'USD';
  Set<String> selectedOrderSources = {};
  Map<String, List<String>> traits = {
    'Background': ['Blue', 'Red', 'Green'],
    'Eyes': ['Big', 'Small', 'Closed'],
    'Mouth': ['Smile', 'Frown', 'Open'],
  };
  Map<String, Set<String>> selectedTraits = {};
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  String? _errorMessage;
  final GlobalKey _maxPriceKey = GlobalKey();

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
    _sliderAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _sliderAnimation = CurvedAnimation(
      parent: _sliderAnimationController,
      curve: Curves.easeInOut,
    );
  }

  void _validatePrices() {
    final minPrice = double.tryParse(_minPriceController.text) ?? 0;
    final maxPrice = double.tryParse(_maxPriceController.text) ?? 0;

    setState(() {
      if (maxPrice < minPrice) {
        _errorMessage = 'Max price should be higher than min price';
      } else {
        _errorMessage = null;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _sliderAnimationController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
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
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Row(
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
                ),
                Expanded(
                  child: ListView(
                    controller: widget.scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      _buildSection('Status', _buildStatusButtons()),
                      _buildSection('Owners', _buildOwnerButtons()),
                      _buildSection('Rarity Rank', _buildRarityRankSlider()),
                      _buildSection('Price', _buildPriceSection()),
                      _buildSection('Order Source', _buildOrderSourceList()),
                      _buildSection('Traits', _buildTraitSection()),
                      const SizedBox(height: 20),
                      ActiveButton(
                        label: 'Apply',
                        onTap: () {
                          // Apply filters
                          Navigator.pop(context);
                        },
                        active: true,
                        size: ButtonSize.large,
                      ),
                      const SizedBox(height: 20), // Add some bottom padding
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        content,
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildStatusButtons() {
    return Row(
      children: [
        Expanded(
            child: _buildBigFilterButton(
                'Buy now', selectedStatus.contains('Buy now'))),
        const SizedBox(width: 10),
        Expanded(
            child: _buildBigFilterButton(
                'Has offers', selectedStatus.contains('Has offers'))),
      ],
    );
  }

  Widget _buildOwnerButtons() {
    return Row(
      children: [
        Expanded(child: _buildBigFilterButton('All', selectedOwner == 'All')),
        const SizedBox(width: 10),
        Expanded(child: _buildBigFilterButton('Mine', selectedOwner == 'Mine')),
      ],
    );
  }

  Widget _buildRarityRankSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  _buildSliderTrack(constraints.maxWidth - 40),
                  _buildSliderThumbs(constraints.maxWidth - 40),
                  Positioned.fill(
                    child: GestureDetector(
                      onHorizontalDragUpdate: (details) =>
                          _handleSliderDrag(details, constraints.maxWidth),
                      onHorizontalDragEnd: (_) => setState(() {}),
                      onTapUp: (details) =>
                          _handleSliderTap(details, constraints.maxWidth),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        _buildRarityLabels(),
      ],
    );
  }

  Widget _buildRarityLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${rarityRange.start.round()}'),
        Text('${rarityRange.end.round()}'),
      ],
    );
  }

  Widget _buildSliderTrack(double width) {
    final startPosition = (rarityRange.start - 1) / 8887;
    final endPosition = (rarityRange.end - 1) / 8887;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: 4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[300]!,
              const Color(0xff2071ee),
              const Color(0xff2071ee),
              Colors.grey[300]!,
            ],
            stops: [0, startPosition, endPosition, 1],
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildSliderThumbs(double width) {
    return Stack(
      children: [
        _buildSliderThumb(
          rarityRange.start,
          true,
        ),
        _buildSliderThumb(
          rarityRange.end,
          false,
        ),
      ],
    );
  }

  Widget _buildSliderThumb(double value, bool isStart) {
    final position = (value - 1) / 8887;
    return Align(
      alignment: Alignment(position * 2 - 1, 0),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xff2071ee), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSliderDrag(DragUpdateDetails details, double width) {
    final newValue = _valueFromPosition(details.localPosition.dx, width);
    _updateSliderValue(newValue);
  }

  void _handleSliderTap(TapUpDetails details, double width) {
    final newValue = _valueFromPosition(details.localPosition.dx, width);
    _updateSliderValue(newValue);
  }

  double _valueFromPosition(double position, double width) {
    final thumbSize = 20.0;
    final effectiveWidth = width - thumbSize;
    final adjustedPosition =
        (position - thumbSize / 2).clamp(0.0, effectiveWidth);
    return 1 + (adjustedPosition / effectiveWidth) * 8887;
  }

  void _updateSliderValue(double newValue) {
    setState(() {
      if ((newValue - rarityRange.start).abs() <
          (newValue - rarityRange.end).abs()) {
        rarityRange =
            RangeValues(newValue.clamp(1, rarityRange.end), rarityRange.end);
      } else {
        rarityRange = RangeValues(
            rarityRange.start, newValue.clamp(rarityRange.start, 8888));
      }
    });
    HapticFeedback.selectionClick();
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildCurrencyButton('USD', selectedCurrency == 'USD'),
            _buildCurrencyButton('ETH', selectedCurrency == 'ETH'),
            _buildCurrencyButton('APT', selectedCurrency == 'APT'),
            _buildCurrencyButton('USDC', selectedCurrency == 'USDC'),
            _buildCurrencyButton('DAI', selectedCurrency == 'DAI'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildPriceInput('Min', _minPriceController)),
            const SizedBox(width: 10),
            Expanded(
              child: Stack(
                children: [
                  _buildPriceInput('Max', _maxPriceController,
                      key: _maxPriceKey),
                  if (_errorMessage != null) _buildErrorTooltip(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceInput(String label, TextEditingController controller,
      {Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: _errorMessage != null && label == 'Max'
                ? Colors.red
                : Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey[400]),
          suffixText: selectedCurrency,
          suffixStyle: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        onChanged: (_) => _validatePrices(),
      ),
    );
  }

  Widget _buildErrorTooltip() {
    return Positioned(
      top: -40,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyButton(String currency, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => selectedCurrency = currency),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff2071ee) : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Text(
          currency,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSourceList() {
    return Column(
      children: [
        _buildOrderSourceItem('Tradeport', 'assets/images/tradeport.png'),
        _buildOrderSourceItem('Wapal', 'assets/images/wapal.jpeg'),
        _buildOrderSourceItem('Topaz', 'assets/images/topaz.png'),
        _buildOrderSourceItem('Bluemove', 'assets/images/bluemove.png'),
      ],
    );
  }

  Widget _buildOrderSourceItem(String name, String imagePath) {
    bool isSelected = selectedOrderSources.contains(name);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedOrderSources.remove(name);
          } else {
            selectedOrderSources.add(name);
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            CustomCheckbox(
              key: ValueKey(name),
              isChecked: isSelected,
              isRound: true,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedOrderSources.remove(name);
                  } else {
                    selectedOrderSources.add(name);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBigFilterButton(String text, bool isSelected,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ??
          () {
            setState(() {
              if (['Buy now', 'Has offers'].contains(text)) {
                if (selectedStatus.contains(text)) {
                  selectedStatus.remove(text);
                } else {
                  selectedStatus.add(text);
                }
              } else if (['All', 'Mine'].contains(text)) {
                selectedOwner = text;
              } else if (['USD', 'ETH', 'OKB', 'USDC', 'DAI'].contains(text)) {
                selectedCurrency = text;
              }
            });
          },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffe9f1fd) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xff2071ee)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xff2071ee),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  PhosphorIconsBold.check,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ??
          () {
            setState(() {
              if (['Buy now', 'Has offers'].contains(text)) {
                if (selectedStatus.contains(text)) {
                  selectedStatus.remove(text);
                } else {
                  selectedStatus.add(text);
                }
              } else if (['All', 'Mine'].contains(text)) {
                selectedOwner = text;
              } else if (['USD', 'ETH', 'OKB', 'USDC', 'DAI'].contains(text)) {
                selectedCurrency = text;
              }
            });
          },
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
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xff2071ee)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xff2071ee),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  PhosphorIconsBold.check,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTraitSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...traits.entries
            .map((entry) => _buildTraitCategory(entry.key, entry.value)),
      ],
    );
  }

  Widget _buildTraitCategory(String category, List<String> traitValues) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: traitValues
              .map((trait) => _buildTraitButton(category, trait))
              .toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTraitButton(String category, String trait) {
    bool isSelected = selectedTraits[category]?.contains(trait) ?? false;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedTraits[category] == null) {
            selectedTraits[category] = {};
          }
          if (isSelected) {
            selectedTraits[category]!.remove(trait);
          } else {
            selectedTraits[category]!.add(trait);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
              trait,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xff2071ee)
                    : Colors.black.withOpacity(0.7),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xff2071ee),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  PhosphorIconsBold.check,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
