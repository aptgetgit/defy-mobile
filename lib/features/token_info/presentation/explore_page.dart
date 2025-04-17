import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart'; // Import the gap package

// --- Placeholder Data Models (Replace with your actual data models) ---
class LiveInvestment { // Assets associated, null if not expandable or no assets

  LiveInvestment({
    required this.type,
    required this.iconAsset,
    required this.count,
    this.assets,
  });
  final String type; // e.g., "Stake"
  final String iconAsset; // Placeholder for icon path
  final int count;
  final List<Asset>? assets;
}

class Asset { // Placeholder for icon path

  Asset({
    required this.name,
    required this.amount,
    required this.value,
    required this.iconAsset,
  });
  final String name;
  final String amount; // e.g., "100 APT"
  final String value; // e.g., "$3.02"
  final String iconAsset;
}

class Opportunity {

  Opportunity({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
    required this.iconBgColor,
  });
  final String title;
  final String subtitle;
  final String value; // e.g., "75.3% APY" or "1000x"
  final IconData icon; // Using IconData for simplicity here
  final Color iconBgColor;
}
// --- End Placeholder Data Models ---


class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // --- State Variables ---
  // Replace single boolean with a set to track expanded rows
  final Set<int> _expandedRows = <int>{};

  // --- Placeholder Data (Replace with data fetched from your backend/source) ---
  final List<LiveInvestment> _liveInvestments = <LiveInvestment>[
    LiveInvestment(
      type: 'Stake',
      iconAsset: 'assets/stake_icon_green.png', // Replace with your asset path
      count: 2,
      assets: <Asset>[
        Asset(
            name: 'Aptos',
            amount: '100 APT',
            value: r'$3.02',
            iconAsset: 'assets/icons/aptos.png', // Replace with your asset path
            ),
        Asset(
            name: 'Gui inu',
            amount: '100 APT', // Assuming same amount for example
            value: r'$3.02',
            iconAsset: 'assets/icons/gui-inu.png', // Replace with your asset path
            ),
      ],
    ),
    // Add sample assets to all investments to make them expandable
    LiveInvestment(
      type: 'Stake',
      iconAsset: 'assets/stake_icon_green.png', // Replace with your asset path
      count: 2,
      assets: <Asset>[
        Asset(
            name: 'Aptos',
            amount: '100 APT',
            value: r'$3.02',
            iconAsset: 'assets/icons/aptos.png', // Replace with your asset path
            ),
        Asset(
            name: 'Gui inu',
            amount: '100 APT', // Assuming same amount for example
            value: r'$3.02',
            iconAsset: 'assets/icons/gui-inu.png', // Replace with your asset path
            ),
      ],
    ),
    LiveInvestment(
      type: 'Stake',
      iconAsset: 'assets/stake_icon_green.png', // Replace with your asset path
      count: 2,
      assets: <Asset>[
        Asset(
            name: 'Aptos',
            amount: '100 APT',
            value: r'$3.02',
            iconAsset: 'assets/icons/aptos.png', // Replace with your asset path
            ),
        Asset(
            name: 'Gui inu',
            amount: '100 APT', // Assuming same amount for example
            value: r'$3.02',
            iconAsset: 'assets/icons/gui-inu.png', // Replace with your asset path
            ),
      ],
    ),
    LiveInvestment(
      type: 'Stake',
      iconAsset: 'assets/stake_icon_green.png', // Replace with your asset path
      count: 2,
      assets: <Asset>[
        Asset(
            name: 'Aptos',
            amount: '100 APT',
            value: r'$3.02',
            iconAsset: 'assets/icons/aptos.png', // Replace with your asset path
            ),
        Asset(
            name: 'Gui inu',
            amount: '100 APT', // Assuming same amount for example
            value: r'$3.02',
            iconAsset: 'assets/icons/gui-inu.png', // Replace with your asset path
            ),
      ],
    ),
  ];

  final List<Opportunity> _newOpportunities = <Opportunity>[
    Opportunity(
        title: 'Stake',
        subtitle: 'Earn on 5+ offers',
        value: '75.3% APY',
        icon: PhosphorIconsFill.handCoins, // Example Icon
        iconBgColor: AppColors.purple,),
    Opportunity(
        title: 'Lend',
        subtitle: 'Earn on 5+ offers',
        value: '75.3% APY',
        icon: PhosphorIconsFill.handCoins, // Example Icon
        iconBgColor: AppColors.purple,),
    Opportunity(
        title: 'Leverage Trade',
        subtitle: 'Get leverage upto',
        value: '1000x',
        icon: PhosphorIconsFill.handCoins, // Example Icon
        iconBgColor: AppColors.purple,),
    Opportunity(
        title: 'Leverage Trade',
        subtitle: 'Get leverage upto',
        value: '1000x',
        icon: PhosphorIconsFill.handCoins, // Example Icon
        iconBgColor: AppColors.purple,),
  ];

  // --- Helper Build Methods ---

  Widget _buildSectionHeader(String title) => Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );

  Widget _buildLiveInvestmentRow(LiveInvestment investment, {required int index}) {
    final bool isExpanded = _expandedRows.contains(index);
    final bool isExpandable = investment.assets != null && investment.assets!.isNotEmpty;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: isExpandable ? () {
            setState(() {
              if (isExpanded) {
                _expandedRows.remove(index);
              } else {
                _expandedRows.add(index);
              }
            });
          } : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: <Widget>[
                // Placeholder for Icon - Replace with Image.asset or CircleAvatar
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.green,
                  child: Icon(PhosphorIconsFill.coins, color: Colors.white, size: 12), // Example icon
                ),
                const Gap(12),
                Expanded(
                  child: Text(
                    investment.type,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Text(
                  investment.count.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black87),
                ),
                const Gap(8),
                // Show arrow icon only if row is expandable
                if (isExpandable) 
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isExpanded) {
                          _expandedRows.remove(index);
                        } else {
                          _expandedRows.add(index);
                        }
                      });
                    },
                    child: Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ),
        ),
        // --- Conditionally Visible Asset Containers ---
        if (isExpandable && isExpanded)
          Padding(
            padding: EdgeInsets.zero,
            child: Column(
              children: investment.assets!.map(_buildAssetRow).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildAssetRow(Asset asset) => Padding(
       padding: const EdgeInsets.only(bottom: 8), // Gap between asset rows
       child: Container(
         padding: const EdgeInsets.all(12),
         decoration: BoxDecoration(
           color: AppColors.greyVeryLight, // Light grey background
           borderRadius: BorderRadius.circular(12),
         ),
         child: Row(
           children: <Widget>[
              // Placeholder for Icon - Replace with Image.asset or CircleAvatar
              Image.asset(asset.iconAsset, width: 44, height: 44),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      asset.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const Gap(2),
                    Text(
                      asset.amount,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: AppColors.greyLight),
                    ),
                  ],
                ),
              ),
              Text(
                asset.value,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.green,), // Green color for value
              ),
           ],
         ),
       ),
    );


  Widget _buildOpportunityRow(Opportunity opportunity) => Padding(
       padding: const EdgeInsets.only(bottom: 10), // Gap between opportunity rows
       child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
         decoration: BoxDecoration(
           color: AppColors.greyVeryLight, // Light grey background
           borderRadius: BorderRadius.circular(16),
         ),
         child: Row(
           children: <Widget>[
             CircleAvatar(
               radius: 22,
               backgroundColor: opportunity.iconBgColor,
               child: Icon(opportunity.icon, color: Colors.white, size: 24),
             ),
             const Gap(15),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     opportunity.title,
                     style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                   ),
                   Text(
                     opportunity.subtitle,
                     style: const TextStyle(fontSize: 14, color: AppColors.greyLight, fontWeight: FontWeight.w500),
                   ),
                 ],
               ),
             ),
             const Gap(10),
             Text(
               opportunity.value,
               style: const TextStyle(
                   fontWeight: FontWeight.w600,
                   fontSize: 18,
                   // Adjust color based on value type if needed
                   color:AppColors.green ,
               ),
             ),
           ],
         ),
       ),
     );

  // --- Main Build Method ---
  @override
  Widget build(BuildContext context) => Scaffold(
      // appBar: AppBar(title: const Text('Explore')), // Optional AppBar
      body: SingleChildScrollView( // Allows scrolling if content overflows
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // --- Live Investments Section ---
              _buildSectionHeader('YOUR LIVE INVESTMENTS'),
              const Gap(5),
              // Build all investment rows with their index
              for (int i = 0; i < _liveInvestments.length; i++)
                _buildLiveInvestmentRow(_liveInvestments[i], index: i),

              // --- New Opportunities Section ---
              _buildSectionHeader('NEW OPPORTUNITIES'),
              const Gap(5),
              // Build opportunity rows
              for (final Opportunity opportunity in _newOpportunities)
                _buildOpportunityRow(opportunity),

              const Gap(20), // Add some padding at the bottom
            ],
          ),
        ),
      ),
    );
}
