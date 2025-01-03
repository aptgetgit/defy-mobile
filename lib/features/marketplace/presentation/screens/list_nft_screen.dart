import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/wallet_inventory_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ListNFTScreen extends StatefulWidget {
  final List<NFTEntity> nfts;
  const ListNFTScreen({super.key, required this.nfts});

  @override
  _ListNFTScreenState createState() => _ListNFTScreenState();
}

class _ListNFTScreenState extends State<ListNFTScreen> {
  bool isSwapped = false;
  String topAmount = "0";
  String bottomAmount = "0";
  String selectedMarketplace = 'OpenSea';
  String selectedExpiry = '1 day';

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopContainer(),
                  _buildPriceInput(width),
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
      leading: IconButton(
        icon: const Icon(PhosphorIconsBold.caretLeft),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text('List NFT',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: const [
        Icon(PhosphorIconsBold.tag),
        Gap(16),
      ],
    );
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
                  '${widget.nfts.length} Items',
                  style: const TextStyle(
                    color: Color(0xff979daa),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (widget.nfts.length > 1) _buildPageIndicator(),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 100,
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
                        color: Colors.black.withOpacity(0.2),
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
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
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
                            Text(
                                currentNFT.collection.title ??
                                    'Unnamed Collection',
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

  Widget _buildStatContainer(String title, String value, IconData icon,
      {required Color color, required VoidCallback onTap}) {
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
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xffe7e7e8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Text(title,
                      style: const TextStyle(
                          color: Color(0xff979daa),
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceInput(double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Enter list price',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text('2.12%+floor',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  const Gap(4),
                  const Icon(PhosphorIconsBold.trendUp,
                      color: Colors.green, size: 16),
                ],
              ),
            ],
          ),
          const Gap(8),
          Container(
            height: 200,
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            child: Stack(
              children: [
                _buildAnimatedAmount(true, topAmount, width),
                _buildAnimatedAmount(false, bottomAmount, width),
                _buildSwapButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedAmount(bool isTop, String amountText, double width) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      bottom: isTop ? 55 : 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.6,
            height: 100,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                amountText,
                style: TextStyle(
                  fontWeight: isTop ? FontWeight.w700 : FontWeight.w500,
                  color: isTop ? Colors.black : const Color(0xff646d80),
                  fontSize: isTop ? 80 - (amountText.length * 3) : 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _swap() {
    setState(() {
      isSwapped = !isSwapped;
      final temp = topAmount;
      topAmount = bottomAmount;
      bottomAmount = temp;
    });
  }

  void _onKeyPress(String key) {
    HapticFeedback.lightImpact();
    setState(() {
      String currentAmount = topAmount;
      currentAmount = _processKeyInput(currentAmount, key);
      topAmount = currentAmount;
    });
  }

  void _showMarketplaceModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _buildAnimatedBottomSheet(
          title: 'Choose Marketplace',
          options: _buildMarketplaceOptions(),
        );
      },
    );
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

  List<Widget> _buildMarketplaceOptions() {
    final marketplaces = [
      {'name': 'OpenSea', 'icon': Icons.add, 'color': Colors.blue},
      {'name': 'Rarible', 'icon': Icons.rocket_launch, 'color': Colors.orange},
      {'name': 'Foundation', 'icon': Icons.view_agenda, 'color': Colors.grey},
    ];

    return marketplaces.map((marketplace) {
      bool isSelected = selectedMarketplace == marketplace['name'];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedMarketplace = marketplace['name'] as String;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: (marketplace['color'] as Color).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(marketplace['icon'] as IconData,
                        size: 24, color: marketplace['color'] as Color),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    marketplace['name'] as String,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  if (isSelected)
                    const Icon(Icons.check_circle,
                        color: Colors.blue, size: 24),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  void _showExpiryModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _buildAnimatedBottomSheet(
          title: 'Choose Expiry',
          options: _buildExpiryOptions(),
        );
      },
    );
  }

  List<Widget> _buildExpiryOptions() {
    final expiryOptions = [
      {'duration': '1 day', 'icon': PhosphorIconsBold.clock},
      {'duration': '7 days', 'icon': PhosphorIconsBold.calendarBlank},
      {'duration': '30 days', 'icon': PhosphorIconsBold.calendar},
      {'duration': 'Custom', 'icon': PhosphorIconsBold.pencilSimple},
    ];

    return expiryOptions.map((option) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child:
                Icon(option['icon'] as IconData, size: 24, color: Colors.blue),
          ),
          title: Text(option['duration'] as String,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          trailing: selectedExpiry == option['duration']
              ? const Icon(PhosphorIconsBold.checkCircle, color: Colors.blue)
              : const SizedBox(width: 24, height: 24),
          onTap: () {
            setState(() {
              selectedExpiry = option['duration'] as String;
            });
          },
        ),
      );
    }).toList();
  }

  IconData _getMarketplaceIcon([String? marketplace]) {
    marketplace ??= selectedMarketplace;
    switch (marketplace) {
      case 'OpenSea':
        return PhosphorIconsBold.cube;
      case 'Rarible':
        return PhosphorIconsBold.rocketLaunch;
      default:
        return PhosphorIconsBold.storefront;
    }
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

  Widget _buildSwapButton() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: -200,
      child: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: _swap,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: AnimatedRotation(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              turns: isSwapped ? 0.5 : 0,
              child: const Icon(PhosphorIconsBold.arrowsDownUp, size: 24),
            ),
          ),
        ),
      ),
    );
  }

  Color _getMarketplaceColor() {
    switch (selectedMarketplace) {
      case 'OpenSea':
        return Colors.blue;
      case 'Rarible':
        return Colors.orange;
      default:
        return Colors.purple;
    }
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
                _getMarketplaceIcon(),
                color: _getMarketplaceColor(),
                onTap: _showMarketplaceModal,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatContainer(
                'Expiry',
                selectedExpiry,
                PhosphorIconsBold.money,
                color: Colors.grey,
                onTap: _showExpiryModal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionContainer({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Icon(PhosphorIconsBold.caretDown,
                    size: 20, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
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
        children: row.map((label) => _buildButton(label)).toList(),
      ),
    );
  }

  Widget _buildButton(String label) {
    final isCancel = label == 'cancel';
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2,
        child: InkWell(
          onTap: () => _onKeyPress(label),
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isCancel
                ? const Icon(PhosphorIconsBold.backspace)
                : Text(
                    label,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
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
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
