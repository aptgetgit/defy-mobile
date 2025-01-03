import 'package:cached_network_image/cached_network_image.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/nft_marketplace_cart_entity.dart';
import 'package:defy/features/marketplace/presentation/provider/nft_marketplace_cart_notifier.dart';
import 'package:defy/features/marketplace/presentation/screens/bid_nft_screen.dart';
import 'package:defy/features/marketplace/presentation/screens/buy_nft_screen.dart';
import 'package:defy/features/marketplace/presentation/state/nft_marketplace_cart_state_model.dart';
import 'package:defy/features/marketplace/presentation/widgets/marketplace_cart/cart_tile.dart';
import 'package:defy/features/shared/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:math' as math;



class NFTMarketplaceCartScreen extends ConsumerStatefulWidget {
  const NFTMarketplaceCartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NFTMarketplaceCartScreen> createState() =>
      _NFTMarketplaceCartScreenState();
}

class _NFTMarketplaceCartScreenState
    extends ConsumerState<NFTMarketplaceCartScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimationController _deleteAnimationController;
  String? _deletingNftName;
  @override
  void initState() {
    super.initState();
    _deleteAnimationController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    Future.microtask(() {
      ref.read(cartNotifierProvider.notifier).initializeSelectedNFTs();
    });
  }

  @override
  void dispose() {
    _deleteAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartNotifierProvider);
    final cartProvider = ref.watch(cartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Cart',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        leading: IconButton(
          icon: const Icon(PhosphorIconsRegular.caretLeft, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              PhosphorIconsRegular.shoppingCart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: cartState.items.isEmpty
          ? _buildEmptyCartState()
          : Column(
              children: [
                _buildHeader(cartState, cartProvider),
                Expanded(
                  child: cartState.items.isEmpty
                      ? _buildEmptyCartState()
                      : AnimatedList(
                          key: _listKey,
                          initialItemCount: cartState.items.length,
                          itemBuilder: (context, index, animation) {
                            if (index >= cartState.items.length) {
                              return const SizedBox.shrink();
                            }
                            final nft = cartState.items[index];
                            return SizeTransition(
                              sizeFactor: animation,
                              child: NFTMarketplaceCartTile(
                                key: ValueKey(nft.name),
                                nft: nft,
                                isEditMode: cartState.isEditMode,
                                onDelete: _deleteItem,
                              ),
                            );
                          },
                        ),
                ),
                _buildBottomButtons(context, cartState),
              ],
            ),
    );
  }

  Widget _buildHeader(
      NFTMarketplaceCartStateModel cartState, CartNotifier cartProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'NFTs (${cartState.items.length})',
            style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Row(
            children: [
              _buildIconButton(
                cartState.isSortAscending
                    ? PhosphorIconsRegular.trendUp
                    : PhosphorIconsRegular.trendDown,
                () => cartProvider.toggleSort(),
              ),
              const SizedBox(width: 8),
              _buildEditModeToggleButton(
                  cartState.isEditMode, cartProvider.toggleEditMode),
            ],
          ),
        ],
      ),
    );
  }

  void _handleSort() {
    final oldItems = List<NFTMarketplaceCartEntity>.from(
        ref.read(cartNotifierProvider).items);
    ref.read(cartNotifierProvider.notifier).toggleSort();
    final newItems = ref.read(cartNotifierProvider).items;

    for (int i = 0; i < newItems.length; i++) {
      if (oldItems[i] != newItems[i]) {
        final oldIndex = oldItems.indexOf(newItems[i]);
        _listKey.currentState?.removeItem(
          oldIndex,
          (context, animation) => _buildAnimatedNFTListItem(
              oldItems[oldIndex], ref.read(cartNotifierProvider), animation),
          duration: const Duration(milliseconds: 300),
        );
        _listKey.currentState
            ?.insertItem(i, duration: const Duration(milliseconds: 300));
      }
    }
  }

  Widget _buildAnimatedNFTListItem(NFTMarketplaceCartEntity nft,
      NFTMarketplaceCartStateModel cartState, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      )),
      child: FadeTransition(
        opacity: animation,
        child: _buildNFTListItem(nft, cartState),
      ),
    );
  }

  Widget _buildNFTListItem(
    NFTMarketplaceCartEntity nft,
    NFTMarketplaceCartStateModel cartState,
  ) {
    final isChecked = cartState.selectedNFTs.contains(nft.name);
    final isDeleted = cartState.deletedItems[nft.name] ?? false;
    final isDeleting = _deletingNftName == nft.name;
    final cartStateNotifier = ref.read(cartNotifierProvider.notifier);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isDeleted ? 0 : 76,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isDeleted ? 0 : 1,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: nft.mediaUrl
                              .replaceAll("ipfs://", "https://ipfs.io/ipfs/") ??
                          '',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nft.name ?? '',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(nft.collectionName ?? '',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          '\$${(getPriceInAPT(nft.price) * 4.15).toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                      const SizedBox(height: 4),
                        Text('${getPriceInAPT(nft.price)} APT',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(width: 12),
                  cartState.isEditMode
                      ? GestureDetector(
                          onTap: () => _deleteItem(nft),
                          child: Center(
                            child: Icon(
                              PhosphorIcons.minusCircle(
                                  PhosphorIconsStyle.fill),
                              color: AppColors.red,
                              size: 20,
                            ),
                          ),
                        )
                          .animate()
                          .scale(duration: 300.ms, curve: Curves.easeInOut)
                      : CustomCheckbox(
                          isRound: true,
                          isChecked: isChecked,
                          onTap: () => cartStateNotifier
                              .toggleNFTSelection(nft.name ?? ''),
                        )
                          .animate()
                          .scale(duration: 300.ms, curve: Curves.easeInOut),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isDeleting ? 0 : MediaQuery.of(context).size.width,
              top: 0,
              bottom: 0,
              right: isDeleting ? 0 : -MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: isDeleting,
                          child: AnimatedBuilder(
                            animation: _deleteAnimationController,
                            builder: (context, child) {
                              return ShaderMask(
                                shaderCallback: (Rect bounds) => LinearGradient(
                                  colors: <Color>[
                                    AppColors.greyDark,
                                    AppColors.greyLight.withOpacity(0.6)
                                  ],
                                  stops: <double>[
                                    _deleteAnimationController.value,
                                    _deleteAnimationController.value
                                  ],
                                ).createShader(bounds),
                                child: Text(
                                  "Removing from collection",
                                  style: TextStyle(
                                    color: AppColors.greyLight.withOpacity(0.6),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _deleteAnimationController.stop();
                            setState(() {
                              _deletingNftName = null;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 4),
                              child: Text(
                                "undo",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _deleteItem(NFTMarketplaceCartEntity nft) {
    final cartNotifier = ref.read(cartNotifierProvider.notifier);
    setState(() {
      _deletingNftName = nft.name;
    });

    _deleteAnimationController.forward(from: 0.0);

    Future.delayed(const Duration(seconds: 6), () {
      if (_deletingNftName == nft.name) {
        setState(() {
          _deletingNftName = null;
        });

        final currentState = ref.read(cartNotifierProvider);
        final index =
            currentState.items.indexWhere((item) => (item as NFTMarketplaceCartEntity).name == nft.name);
        if (index != -1) {
          _listKey.currentState?.removeItem(
            index,
            (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: _buildNFTListItem(nft, currentState),
            ),
            duration: const Duration(milliseconds: 300),
          );

          // Delay the actual removal from the state to allow the animation to complete
          Future.delayed(const Duration(milliseconds: 300), () {
            cartNotifier.removeFromCart(nft);
          });
        }
      }
    });
  }

  Widget _buildEmptyCartState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          const Icon(PhosphorIconsRegular.shoppingCartSimple,
                  size: 80, color: Colors.grey)
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut),
          const SizedBox(height: 24),
          Text(
            'Your cart is empty',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
          const SizedBox(height: 16),
          Text(
            'Add some NFTs to get started!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ).animate().fadeIn(duration: 600.ms, delay: 600.ms),
          const Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A90E2),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                shadowColor: AppColors.blue.withOpacity(0.5),
              ),
              child: const Text(
                'Add Products',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
                .animate()
                .fadeIn(duration: 600.ms, delay: 900.ms)
                .slideY(
                  begin: 0.5,
                  end: 0,
                  duration: 600.ms,
                  delay: 900.ms,
                  curve: Curves.easeOutBack,
                )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .shimmer(
                    duration: 1800.ms, color: Colors.white.withOpacity(0.2))
                .animate()
                .scale(
                  begin: const Offset(1, 1),
                  end: const Offset(1.05, 1.05),
                  duration: 600.ms,
                )
                .then(delay: 400.ms)
                .scale(
                  begin: const Offset(1.05, 1.05),
                  end: const Offset(1, 1),
                  duration: 600.ms,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons(
      BuildContext context, NFTMarketplaceCartStateModel cartState) {
    final totalPrice = cartState.selectedNFTs.isEmpty
        ? 0.0
        : cartState.items
            .where((nft) => cartState.selectedNFTs.contains((nft as NFTMarketplaceCartEntity).name))
            .map((nft) => getPriceInAPT((nft as NFTMarketplaceCartEntity).price))
            .reduce((a, b) => a + b);

    void showRemoveAllConfirmation() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Remove All Items',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Are you sure you want to remove all items from your cart?',
                    style: TextStyle(color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey[300]!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .removeAllFromCart();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            'Remove All',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().scale(
                duration: 300.ms,
                curve: Curves.easeOutBack,
              );
        },
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: cartState.isEditMode
            ? SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: cartState.items.isNotEmpty
                      ? showRemoveAllConfirmation
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF6767),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Remove All',
                    style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ).animate().fadeIn(duration: 300.ms)
            : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: cartState.selectedNFTs.isNotEmpty
                            ? () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BuyNFTScreen(
                                      nfts: cartState.items
                                            .where((nft) => cartState.selectedNFTs
                                              .contains((nft as NFTMarketplaceCartEntity).name))
                                          .toList(),
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Buy ${totalPrice.toStringAsFixed(1)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ClipOval(
                              child: Image.asset(
                                'assets/blockchains/aptos.jpg',
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: cartState.selectedNFTs.isNotEmpty
                            ? () {
                                final selectedNFTs = cartState.items
                                    .where((nft) => cartState.selectedNFTs
                                        .contains((nft as NFTMarketplaceCartEntity).name))
                                    .toList();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BidNFTScreen(nfts: selectedNFTs),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Bid Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void showOneNFTWarning() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Select Only One NFT',
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Please select only one NFT to make an offer. Multiple NFT offers are not supported.',
                  style: TextStyle(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    'Got it',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ).animate().scale(
              duration: 300.ms,
              curve: Curves.easeOutBack,
            );
      },
    );
  }

  Widget _buildEditModeToggleButton(bool isEditMode, VoidCallback onPressed) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isEditMode ? const Color(0xffFFE1E1) : Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: isEditMode
                  ? const Text(
                      'Cancel',
                      key: ValueKey('cancel'),
                      style: TextStyle(fontSize: 16, color: Color(0xffFF6767)),
                    )
                  : const Icon(
                      PhosphorIconsRegular.trash,
                      key: ValueKey('trash'),
                      color: Colors.black87,
                      size: 16,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed, {Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(icon, color: Colors.black87, size: 16),
      ),
    );
  }

  void _toggleSort() {
    ref.read(cartNotifierProvider.notifier).toggleSort();
  }

  double getPriceInAPT(int price) {
    return price / math.pow(10, 8);
  }
}
