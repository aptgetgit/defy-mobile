import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../watchlist/presentation/watch_list_screen.dart';

class WalletMoreScreen extends StatefulWidget {
  const WalletMoreScreen({super.key});

  @override
  State<WalletMoreScreen> createState() => _WalletMoreScreenState();
}

class _WalletMoreScreenState extends State<WalletMoreScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from below the screen
      end: Offset.zero, // End at the normal position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ),);
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void _onViewLessPressed() {
    _animationController.reverse().then((_) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) => SlideTransition(
    position: _slideAnimation,
    child: Scaffold(
        body: SingleChildScrollView( // For overall screen scrolling
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Gap(70),
                const Padding(
                  padding: EdgeInsets.only(left:4),
                  child: Text('More', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                const Gap(16),
                // Buttons Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MoreButton(imagePath: 'assets/icons/onramp-logo.png', text: 'Onramp'),
                    MoreButton(imagePath: 'assets/icons/offramp-logo.png', text: 'Offramp'),
                    MoreButton(imagePath:'assets/icons/mints-logo.png', text: 'Mints'),
                    MoreButton(imagePath: 'assets/icons/ledborrow-logo.png', text: 'Lend/Borrow'),
                  ],
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const MoreButton(imagePath: 'assets/icons/addtoken-logo.png', text: 'Add Tokens'),
                    GestureDetector(onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WatchListScreen())),child: const MoreButton(imagePath: 'assets/icons/watchlist-logo.png', text: 'Watchlist')),
                    const MoreButton(imagePath: 'assets/icons/invitefriend-logo.png', text: 'Invite friend'),
                    const MoreButton(imagePath: 'assets/icons/support-logo.png', text: 'Support'),
                  ],
                ),
    
                const Gap(24),
                // Investment Section
                const Padding(
                  padding: EdgeInsets.only(left:4),
                  child: Text('Investment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                const Gap(16),
                // Scrollable Investment Cards
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/invest.png', height: 242,width:177),
                    const Gap(8),
                    Column(
                      children: <Widget>[
                        Image.asset('assets/images/trading.png', height: 119, width: 176,),
                        const Gap(8),
                        Image.asset('assets/images/marketplace.png', height: 115, width: 176,),
                      ],
                    ),
                  ],
                ),
                const Gap(172),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    width: 153,
                    height: 44,
                    child: Center( // "View less" button at the bottom
                      child: TextButton(
                        onPressed: _onViewLessPressed,
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.white, // Text color
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle, 
                                color: AppColors.white,
                              ),
                              child: const Icon(PhosphorIconsBold.caretUp, color: AppColors.black,),
                            ),
                            const Gap(8),
                            const Text('View less'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
  );
}

// More Button Widget
class MoreButton extends StatelessWidget {

  const MoreButton({required this.imagePath, required this.text, super.key});
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 90,
    child: Column(
        children: <Widget>[
          Image.asset(imagePath, height: 60, width: 60,),
          Text(text, style: const TextStyle(color: AppColors.greyDark, fontSize: 14),),
        ],
      ),
  );
}
