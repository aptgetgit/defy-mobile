import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'package:defy/features/shared/presentation/widgets/custom_check_box.dart';
import 'package:defy/features/yield/common/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BidNFTScreen extends StatefulWidget {
  final List<NFTMarketplaceCartEntity> nfts;

  const BidNFTScreen({Key? key, required this.nfts}) : super(key: key);

  @override
  _BidNFTScreenState createState() => _BidNFTScreenState();
}

class _BidNFTScreenState extends State<BidNFTScreen>
    with TickerProviderStateMixin {
  TransactionType transactionType = TransactionType.send;
  var amountController = TextEditingController();
  var toAddressController = TextEditingController();

  bool isSwapped = false;

  String amount = "\$0";
  String _amount = "\$0";

  String amount2 = "0";
  String _amount2 = "0";

  int paymentTime = 0;

  String topAmount = "0.32";
  String bottomAmount = "6.23";
  late AnimationController _controller;
  late Animation<double> _animation;
  String selectedMarketplace = 'Trade Port';
  String selectedExpiry = '1 day';
  Timer? _autoScrollTimer;
  final int _autoScrollDuration = 3;
  late PageController _pageController;
  int _currentPage = 0;

  late AnimationController _customExpiryAnimationController;
  late Animation<double> _customExpiryAnimation;
  final TextEditingController _customExpiryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _pageController = PageController(initialPage: 0);
    _customExpiryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _customExpiryAnimation = CurvedAnimation(
      parent: _customExpiryAnimationController,
      curve: Curves.easeInOut,
    );
  }

  void swap() {
    setState(() {
      isSwapped = !isSwapped;
    });
  }

  @override
  void dispose() {
    _customExpiryAnimationController.dispose();
    _customExpiryController.dispose();
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopContainer(),
                  _buildPriceInput(size),
                  _buildMarketplaceAndExpiryRow(),
                  const SizedBox(height: 16),
                  _buildKeyboard(),
                ],
              ),
            ),
          ),
          _buildContinueButton(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(PhosphorIconsBold.caretLeft, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('Bid NFT',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.black)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(PhosphorIconsBold.flag, color: Colors.black),
          onPressed: () {
            // Handle flag action
          },
        ),
      ],
    );
  }

  void _showMarketplaceModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return _buildAnimatedBottomSheet(
              title: 'Choose Marketplace',
              options: _buildMarketplaceOptions(setModalState),
            );
          },
        );
      },
    ).then((_) {
      // This will trigger a rebuild of the main screen when the modal is closed
      setState(() {});
    });
  }

  Widget _buildAnimatedBottomSheet(
      {required String title, required List<Widget> options}) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 24),
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: options),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMarketplaceOptions(StateSetter setModalState) {
    final marketplaces = [
      {'name': 'Trade Port', 'image': 'assets/images/tradeport.png'},
      {'name': 'Wapal', 'image': 'assets/images/wapal.jpeg'},
      {'name': 'Topaz', 'image': 'assets/images/topaz.png'},
      {'name': 'Blue Move', 'image': 'assets/images/bluemove.png'}
    ];

    return marketplaces.map((marketplace) {
      return _buildMarketplaceItem(
        marketplace['name'] as String,
        marketplace['image'] as String,
        setModalState,
      );
    }).toList();
  }

  Widget _buildMarketplaceItem(
      String name, String imagePath, StateSetter setState) {
    bool isSelected = selectedMarketplace == name;
    return InkWell(
      onTap: () {
        setState(() {
          selectedMarketplace = name;
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
                  selectedMarketplace = name;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatContainer(
    String title,
    String value, {
    IconData? icon,
    String? imagePath,
    Color? color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xffe7e7e8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    )
                  : Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff979daa),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showExpiryModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return _buildAnimatedBottomSheet(
              title: 'Choose Expiry',
              options: _buildExpiryOptions(setModalState),
            );
          },
        );
      },
    ).then((_) {
      setState(() {});
    });
  }

  List<Widget> _buildExpiryOptions(StateSetter setModalState) {
    final expiryOptions = [
      {'duration': '1 day', 'icon': PhosphorIconsBold.clock},
      {'duration': '7 days', 'icon': PhosphorIconsBold.calendarBlank},
      {'duration': '30 days', 'icon': PhosphorIconsBold.calendar},
      {'duration': 'Custom', 'icon': PhosphorIconsBold.pencilSimple},
    ];

    return expiryOptions.map((option) {
      return _buildExpiryItem(
        option['duration'] as String,
        option['icon'] as IconData,
        setModalState,
      );
    }).toList();
  }

  Widget _buildExpiryItem(
      String duration, IconData icon, StateSetter setState) {
    bool isSelected = selectedExpiry == duration ||
        (duration == 'Custom' &&
            !['1 day', '7 days', '30 days'].contains(selectedExpiry));
    bool isCustom = duration == 'Custom';

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (isCustom) {
                _customExpiryAnimationController.forward();
              } else {
                _customExpiryAnimationController.reverse();
                selectedExpiry = duration;
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
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  child: Icon(icon, size: 20, color: Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    isCustom && _customExpiryController.text.isNotEmpty
                        ? '${_customExpiryController.text} days'
                        : duration,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
                CustomCheckbox(
                  key: ValueKey(duration),
                  isChecked: isSelected,
                  isRound: true,
                  onTap: () {
                    setState(() {
                      if (isCustom) {
                        _customExpiryAnimationController.forward();
                      } else {
                        _customExpiryAnimationController.reverse();
                        selectedExpiry = duration;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        if (isCustom)
          SizeTransition(
            sizeFactor: _customExpiryAnimation,
            child: FadeTransition(
              opacity: _customExpiryAnimation,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: _customExpiryController,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter days',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[400],
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      selectedExpiry = '$value days';
                                    } else {
                                      selectedExpiry = 'Custom';
                                    }
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'days',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue[700],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  String _processKeyInput(String currentAmount, String key) {
    if (key == 'cancel') {
      return currentAmount.length > 1
          ? currentAmount.substring(0, currentAmount.length - 1)
          : '0';
    } else if (key == '.' && !currentAmount.contains('.')) {
      return currentAmount + key;
    } else if (key != '.') {
      return currentAmount == '0' ? key : currentAmount + key;
    }
    return currentAmount;
  }

  Widget _buildMarketplaceAndExpiryRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _buildStatContainer(
                'Marketplace',
                selectedMarketplace,
                imagePath: _getMarketplaceImagePath(),
                onTap: _showMarketplaceModal,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatContainer(
                'Expiry',
                selectedExpiry,
                icon: PhosphorIconsBold.money,
                color: Colors.grey,
                onTap: _showExpiryModal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMarketplaceImagePath() {
    switch (selectedMarketplace) {
      case 'Trade Port':
        return 'assets/images/tradeport.png';
      case 'Wapal':
        return 'assets/images/wapal.jpeg';
      case 'Topaz':
        return 'assets/images/topaz.png';
      case 'Blue Move':
        return 'assets/images/bluemove.png';
      default:
        return 'assets/images/default_marketplace.png'; // Provide a default image
    }
  }

  Widget _buildTopContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.nfts.length > 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.nfts.length > 1
                      ? '${widget.nfts.length} Items'
                      : '${widget.nfts.length} Item',
                  style: const TextStyle(
                    color: Color(0xff979daa),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _buildPageIndicator(),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 100,
            child: GestureDetector(
              // onTap: _resetAutoScroll,
              // onPanDown: (_) => _stopAutoScroll(),
              // onPanCancel: _startAutoScroll,
              // onPanEnd: (_) => _startAutoScroll(),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.nfts.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  final currentNFT = widget.nfts[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: currentNFT.mediaUrl!.replaceAll(
                                    'ipfs://', 'https://ipfs.io/ipfs/') ??
                                '',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(currentNFT.name ?? 'Unnamed NFT',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text(currentNFT.collectionName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xff979DAA),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Text('0.23',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                const SizedBox(width: 4),
                                Image.asset('assets/icons/aptos-logo.png',
                                    width: 16, height: 16),
                              ],
                            ),
                            const Text('Floor ',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xff979DAA),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.nfts.length,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index
                ? AppColors.blue
                : Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceInput(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enter Bid price',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
            ],
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            child: Stack(children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
                bottom: isSwapped ? 0 : 55,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: List.generate(20, (index) {
                              final char =
                                  index < _amount.length ? _amount[index] : "";
                              bool isNotVisible =
                                  (_amount.length > amount.length
                                      ? index >= amount.length
                                      : index >= _amount.length);
                              return AnimatedSlide(
                                duration: const Duration(milliseconds: 150),
                                offset: (!isNotVisible)
                                    ? const Offset(0, 0)
                                    : const Offset(0, 0.5),
                                child: AnimatedOpacity(
                                  opacity: (!isNotVisible) ? 1 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 200),
                                    style: TextStyle(
                                        fontWeight: isSwapped
                                            ? FontWeight.w500
                                            : FontWeight.w700,
                                        color: isSwapped
                                            ? const Color(0xff646d80)
                                            : Colors.black,
                                        fontSize: isSwapped
                                            ? 14
                                            : 80 - (_amount.length * 3)),
                                    child: Text(char),
                                  ),
                                ),
                              );
                            }),
                          )),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
                bottom: !isSwapped ? 0 : 55,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      height: 100,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                              children: List.generate(20, (index) {
                            final char =
                                index < _amount2.length ? _amount2[index] : "";
                            bool isNotVisible =
                                (_amount2.length > amount2.length
                                    ? index >= amount2.length
                                    : index >= _amount2.length);
                            return AnimatedSlide(
                              duration: const Duration(milliseconds: 150),
                              offset: (!isNotVisible)
                                  ? const Offset(0, 0)
                                  : const Offset(0, 0.5),
                              child: AnimatedOpacity(
                                opacity: (!isNotVisible) ? 1 : 0,
                                duration: const Duration(milliseconds: 200),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                      fontWeight: !isSwapped
                                          ? FontWeight.w500
                                          : FontWeight.w700,
                                      color: !isSwapped
                                          ? const Color(0xff646d80)
                                          : Colors.black,
                                      fontSize: !isSwapped
                                          ? 14
                                          : 80 - (_amount2.length * 3)),
                                  child: Text(
                                    char,
                                  ),
                                ),
                              ),
                            );
                          }))),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 40,
                  left: 100,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      swap();
                    },
                    child: AnimatedRotation(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceInOut,
                      turns: isSwapped ? 0.5 : 0,
                      child: const Icon(
                        PhosphorIconsBold.arrowsDownUp,
                        size: 18,
                      ),
                    ),
                  ))
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildFloorPrice(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * 0.015),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                Image.asset('assets/icons/aptos-logo.png',
                    width: size.width * 0.08, height: size.width * 0.08),
                SizedBox(width: size.width * 0.02),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.width * 0.01,
                      right: size.width * 0.02,
                      bottom: size.width * 0.01),
                  child: Column(
                    children: [
                      Text('Aptos',
                          style: Theme.of(context).textTheme.bodyLarge),
                      Text(' 8 APTOS', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('0.52 APT',
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.black)),
              Text('Floor Price',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }

  void _onKeyPress(String key) {
    HapticFeedback.lightImpact();
    setState(() {
      String currentAmount = topAmount;
      currentAmount = _processKeyInput(currentAmount, key);
      topAmount = currentAmount;
      bottomAmount = (double.parse(currentAmount) * 19.5).toStringAsFixed(2);
    });
  }

  Widget _buildKeyboard() {
    final buttons = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['.', '0', 'cancel'],
    ];

    return Column(
      children: buttons.map((row) => _buildRowButtons(row)).toList(),
    );
  }

  Widget _buildRowButtons(List<String> row) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: row.map((label) => _buildButton(label, null)).toList(),
      ),
    );
  }

  Widget _buildButton(String label, IconData? icon) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (!isSwapped) {
            _onTapOne(label);
          } else {
            _onTapTwo(label);
          }
        },
        borderRadius: BorderRadius.circular(100),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: icon == null ? 16 : 8,
                vertical: icon == null ? 16 : 16),
            child: icon == null
                ? Center(
                    child: Text(
                      label,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 22),
                    ),
                  )
                : Icon(icon)),
      ),
    );
  }

  void _onTapOne(String label) {
    HapticFeedback.lightImpact();
    if (label == 'cancel') {
      setState(() {
        if (amount.length > 2 && amount != "\$0") {
          amount = amount.substring(0, amount.length - 1);
        } else {
          amount = "\$0";
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount.length > 2 && _amount != "\$0") {
            _amount = _amount.substring(0, _amount.length - 1);
          } else {
            _amount = "\$0";
          }
        });
      });
    } else {
      if (_amount.length >= 12) return;

      setState(() {
        if (amount == "\$0") {
          amount = "\$";
          amount += label;
        } else {
          amount += label;

          // final val = addCommas(amount.substring(1) + label);
          // print(val);
          // amount = "\$" + val;
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount == "\$0") {
            _amount = "\$" + label;
          } else {
            _amount += label;

            //   final val = addCommas(_amount.substring(1) + label);
            // _amount =  "\$" + val;
          }
        });
      });
    }
  }

  void _onTapTwo(String label) {
    HapticFeedback.lightImpact();
    if (label == 'cancel') {
      setState(() {
        if (amount2.length > 2 && amount2 != "0") {
          amount2 = amount2.substring(0, amount2.length - 1);
        } else {
          amount2 = "0";
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount2.length > 2 && _amount2 != "\$0") {
            _amount2 = _amount2.substring(0, _amount2.length - 1);
          } else {
            _amount2 = "\$0";
          }
        });
      });
    } else {
      if (_amount2.length >= 12) return;

      setState(() {
        if (amount2 == "0") {
          amount2 = "";
          amount2 += label;
        } else {
          amount2 += label;

          // final val = addCommas(amount.substring(1) + label);
          // print(val);
          // amount = "\$" + val;
        }
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          if (_amount2 == "0") {
            _amount2 = label;
          } else {
            _amount2 += label;

            //   final val = addCommas(_amount.substring(1) + label);
            // _amount =  "\$" + val;
          }
        });
      });
    }
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          // Handle continue action
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text('Continue',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
