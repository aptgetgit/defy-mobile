import 'package:flutter/material.dart';

class NftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NftSection(
            title: 'Chum Chums NFT',
            count: '2',
            icon: Icons.arrow_drop_down_circle_sharp,
            nfts: [
              NftData(
                imageUrl: 'assets/images/Mask group.png',
                title: '#4147',
                subtitle: '0.02 APT',
              ),
              NftData(
                imageUrl: 'assets/images/Mask group (1).png',
                title: '#4147',
                subtitle: '0.02 APT',
              ),
            ],
          ),
          const SizedBox(height: 16),
          NftSection(
            title: 'Chum Chums NFT',
            count: '2',
            icon: Icons.arrow_drop_down_circle_sharp,
            nfts: [
              NftData(
                imageUrl: 'assets/images/Mask group (2).png',
                title: 'Makeup monkey',
                subtitle: '0.02 ETH',
                collection: 'glossy apes',
                views: '2.2k',
              ),
              NftData(
                imageUrl: 'assets/images/Mask group (3).png',
                title: 'Makeup monkey',
                subtitle: '0.02 ETH',
                collection: 'glossy apes',
                views: '2.2k',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NftSection extends StatelessWidget {
  final String title;
  final String count;
  final List<NftData> nfts;

  final dynamic icon;

  const NftSection({
    Key? key,
    required this.title,
    required this.count,
    required this.nfts,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/chum_chums_logo.png', // Replace with your actual image asset
                  ),
                  radius: 14,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              count,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // NFT Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4,
          ),
          itemCount: nfts.length,
          itemBuilder: (context, index) {
            return NftItemWidget(nft: nfts[index]);
          },
        ),
      ],
    );
  }
}

class NftItemWidget extends StatelessWidget {
  final NftData nft;

  const NftItemWidget({Key? key, required this.nft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NFT Image
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                nft.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nft.title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                if (nft.collection != null)
                  Text(
                    nft.collection!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nft.subtitle,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    if (nft.views != null)
                      Row(
                        children: [
                          const Icon(Icons.visibility,
                              size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            nft.views!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NftData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? collection;
  final String? views;

  NftData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.collection,
    this.views,
  });
}
