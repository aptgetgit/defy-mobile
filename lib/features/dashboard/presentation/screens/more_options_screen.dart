import 'package:flutter/material.dart';

class MoreOptionsScreen extends StatelessWidget {
  const MoreOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: const Text(
                "More",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                _buildGridItem(
                    context, 'assets/icons/onramp-logo.png', "Onramp"),
                _buildGridItem(
                    context, 'assets/icons/offramp-logo.png', "Offramp"),
                _buildGridItem(context, 'assets/icons/mints-logo.png', "Mints"),
                _buildGridItem(
                    context, 'assets/icons/ledborrow-logo.png', "Lend/Borrow"),
                _buildGridItem(
                    context, 'assets/icons/addtoken-logo.png', "Add Tokens"),
                _buildGridItem(
                    context, 'assets/icons/watchlist-logo.png', "Watchlist"),
                _buildGridItem(context, 'assets/icons/invitefriend-logo.png',
                    "Invite Friend"),
                _buildGridItem(
                    context, 'assets/icons/support-logo.png', "Support"),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Investment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 177,
                  height: 242,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.rocket, size: 40, color: Colors.white),
                      const SizedBox(height: 8),
                      const Text(
                        "Invest",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Earn 100% APY",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    _buildInvestmentCard(
                      context,
                      "Leverage Trading",
                      "Trade smarter",
                      Icons.show_chart,
                      [Colors.purple, Colors.deepPurpleAccent],
                    ),
                    const SizedBox(height: 16),
                    _buildInvestmentCard(
                      context,
                      "NFT Marketplace",
                      "Explore NFTs",
                      Icons.image,
                      [Colors.orange, Colors.deepOrangeAccent],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // Floating "View Less" container
      floatingActionButton: GestureDetector(
        onTap: () {
          _navigateBackWithAnimation(context);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: 160,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons
                    .arrow_circle_up_rounded, // Or use any other icon you prefer like caretUp
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8), // Space between the icon and text
              const Text(
                "View Less",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath, String label) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildInvestmentCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    List<Color> gradientColors,
  ) {
    return Container(
      width: 160,
      height: 117,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateBackWithAnimation(BuildContext context) {
    Navigator.of(context).pop(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Scaffold(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, -1.0); // Animation starts at the top
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
