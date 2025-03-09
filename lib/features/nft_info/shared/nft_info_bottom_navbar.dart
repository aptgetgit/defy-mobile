import 'package:flutter/material.dart';

import '../../../config/theme/colors.dart';

class NftInfoBottomNavBar extends StatelessWidget {
  const NftInfoBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 26, top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/icons/aptos.png',
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 10),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '89.02 APT',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                '+ 2.98',
                style: TextStyle(fontSize: 14, color: AppColors.green),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    // Handle Bid action
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(95, 45), // Explicit minimum size
                    maximumSize: const Size(150, 48), // Explicit maximum size
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: const BorderSide(),
                  ),
                  child: const Text('Bid', style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle Buy action
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(95, 45), // Explicit minimum size
                    maximumSize: const Size(150, 48), // Explicit maximum size
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Buy', style: TextStyle(color: Colors.white,fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
