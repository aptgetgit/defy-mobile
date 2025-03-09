// swap_from_screen.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../../../shared/presentation/widgets/keypad.dart';
import '../widgets/swap_from_header.dart';
import '../widgets/token_selection_sheet.dart';

class SwapFromScreen extends StatefulWidget {
  const SwapFromScreen({required this.selectedTokens, super.key});
  final List<Map<String, String>> selectedTokens;

  @override
  _SwapFromScreenState createState() => _SwapFromScreenState();
}

class _SwapFromScreenState extends State<SwapFromScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _amount = '';
  String _toToken = 'USDC';
  String _toTokenIcon = 'assets/icons/usdc.png';
  String _toTokenAmount = '0.00';
  int _highlightedIndex = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _handleButtonPress(String label) {
    setState(() {
      if (label == 'cancel' || label == 'cancelLongPress') {
        _amount = '';
      } else if (label == '.') {
        if (!_amount.contains('.') && _amount.isNotEmpty) {
          _amount += label;
        }
      } else {
        if (_amount == '' || _amount == '0.00') {
          _amount = label;
        } else {
          _amount += label;
        }
      }
    });
  }

  Future<void> _showTokenSelectionSheet() async {
    final Map<String, String>? selectedToken = await showModalBottomSheet<Map<String, String>>(
      showDragHandle: true,
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) => TokenSelectionSheet(onTokenSelected: (Map<String, String> token) {}),
    );

    if (selectedToken != null) {
      setState(() {
        _toToken = selectedToken['name'] ?? _toToken;
        _toTokenIcon = selectedToken['icon'] ?? _toTokenIcon;
        _toTokenAmount = selectedToken['amount']?.replaceAll(RegExp(r'[^\d.]'), '') ?? '0.00';
      });
    }
  }

  void _handleScroll() {
    const double itemHeight = 100;
    final double scrollOffset = _scrollController.offset;
    final int newIndex = (scrollOffset / itemHeight).round().clamp(0, widget.selectedTokens.length - 1);

    if (newIndex != _highlightedIndex) {
      setState(() => _highlightedIndex = newIndex);
      _scrollController.jumpTo(_highlightedIndex * itemHeight);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(icon: const Icon(Icons.arrow_back_ios, size: 24), onPressed: () => Navigator.pop(context)),
        ),
        title: const Text('Swap', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(icon: const Icon(PhosphorIconsRegular.arrowsClockwise, size: 24), onPressed: () {}),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const Gap(18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Swap from', style: TextStyle(fontSize: 16, color: AppColors.greyDark)),
                      GestureDetector(
                        onTap: () => setState(() => _amount = ''), // Simplified reset
                        child: const Text('Reset', style: TextStyle(fontSize: 16, color: AppColors.blue)),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  _handleScroll();
                }
                return false;
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SwapFromHeader(
                      minHeight: 100,
                      maxHeight: 100,
                      token: widget.selectedTokens[_highlightedIndex],
                      amount: _amount,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index >= widget.selectedTokens.length - 1) {
                          return null;
                        }
                        final int displayIndex = index >= _highlightedIndex ? index + 1 : index;
                        if (displayIndex >= widget.selectedTokens.length) {
                          return null;
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12, top: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() => _highlightedIndex = displayIndex);
                              _scrollController.jumpTo(displayIndex * 100.0);
                            },
                            child: Container(
                              width: 345,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Image.asset(widget.selectedTokens[displayIndex]['icon']!, width: 32),
                                      const Gap(8),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.selectedTokens[displayIndex]['name']!,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                                          ),
                                          Text(
                                            widget.selectedTokens[displayIndex]['usdValue']!,
                                            style: const TextStyle(fontSize: 12, color: AppColors.greyDark),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      const Text(r'$0.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                                      Text(
                                        '0.00 ${widget.selectedTokens[displayIndex]['name']}',
                                        style: const TextStyle(fontSize: 12, color: AppColors.greyDark),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: widget.selectedTokens.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: _showTokenSelectionSheet,
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.greyVeryLight),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22, right: 10, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Swap to', style: TextStyle(fontSize: 14, color: AppColors.greyLight)),
                              Text('--', style: TextStyle(fontSize: 16, color: AppColors.black)),
                            ],
                          ),
                          Container(
                            height: 44,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.only(left: 4, right: 16),
                            child: Row(
                              children: <Widget>[
                                Image.asset(_toTokenIcon, width: 32),
                                const Gap(11),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(_toToken, style: const TextStyle(fontSize: 16, color: Colors.black)),
                                    Text(
                                      _toTokenAmount.isNotEmpty ? '$_toTokenAmount $_toToken' : '--',
                                      style: const TextStyle(fontSize: 12, color: AppColors.greyDark),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(4),
                Container(
                  height: 66,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset('assets/icons/Cellana.png', width: 36.25, height: 34),
                            const Gap(12),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text('Via', style: TextStyle(fontSize: 16, color: AppColors.greyDark)),
                                    Gap(4),
                                    Text('Cellana, Cetus', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Text('2.5% Cheaper', style: TextStyle(fontSize: 14, color: AppColors.green)),
                              ],
                            ),
                          ],
                        ),
                        FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            fixedSize: const Size(103, 35),
                            backgroundColor: AppColors.blue.withValues(alpha: 0.2),
                            foregroundColor: AppColors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text('Change', style: TextStyle(color: AppColors.blue, fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                ),
                Keypad(onButtonPress: _handleButtonPress),
              ],
            ),
          ),
        ],
      ),
    );
}
