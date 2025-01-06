import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/marketplace/domain/entities/collection_details_entity.dart';
import 'package:defy/features/marketplace/presentation/widgets/bin/nft_perk_widget.dart';
import 'package:defy/features/shared/presentation/widgets/nft_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NFTCollectionItemDetailScreen extends StatefulWidget {
  final String? nftName;
  final String? imageUrl;
  final String? description;
  final String? discordUrl;
  final String? twitterUrl;
  final String? websiteUrl;
  final CollectionInfoEntity? collectionInfo;
  final String? collectionImageUrl;

  const NFTCollectionItemDetailScreen({
    super.key,
    required this.discordUrl,
    required this.twitterUrl,
    required this.websiteUrl,
    this.collectionInfo,
    required this.nftName,
    required this.imageUrl,
    required this.description,
    required this.collectionImageUrl,
  });

  @override
  State<NFTCollectionItemDetailScreen> createState() =>
      _NFTCollectionItemDetailScreenState();
}

class _NFTCollectionItemDetailScreenState
    extends State<NFTCollectionItemDetailScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: widget.collectionImageUrl?.isNotEmpty == true
                      ? NetworkImage(widget.collectionImageUrl!)
                      : AssetImage("assets/images/cyborg.png") as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nftName ?? "Unnamed NFT",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      widget.collectionInfo?.title ?? "Unnamed Collection",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyLight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(4),
                    Image.asset(
                      "assets/images/Blue-Check.png",
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Icon(
              PhosphorIcons.star(PhosphorIconsStyle.regular),
              size: 24,
              color: AppColors.black,
            ),
            const Gap(24),
            Icon(
              PhosphorIcons.bell(PhosphorIconsStyle.regular),
              size: 24,
              color: AppColors.black,
            ),
            const Gap(20),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image(
                    image:
                        widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                            ? NetworkImage(widget.imageUrl!) as ImageProvider
                            : const AssetImage("assets/images/Cyborg.png")
                                as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 65.h,
                        width: 175.w,
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "14.85 APT",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              "COST",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 65.h,
                        width: 175.w,
                        decoration: BoxDecoration(
                          color: AppColors.greyVeryLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$14.85",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              "LAST BID",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.greyLight,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  _buildCustomTabBar(),
                  const SizedBox(height: 4),
                  Divider(
                    color: AppColors.greyVeryLight,
                    thickness: 1,
                  ),
                  _buildTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCustomTabBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabButton("About", 0),
        const SizedBox(width: 20),
        _buildTabButton("Activity", 1),
        const SizedBox(width: 20),
        _buildTabButton("Analytics", 2),
        const SizedBox(width: 20),
        _buildTabButton("History", 3),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: _selectedTabIndex == index
              ? AppColors.black
              : AppColors.greyMedium,
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return _buildAboutTab();
      case 1:
        return _buildActivityTab();
      case 2:
        return _buildAnalyticsTab();
      case 3:
        return Container();
      default:
        return Container();
    }
  }

  Widget _buildAboutTab(
      {String? description,
      String? discordUrl,
      String? twitterUrl,
      String? websiteUrl}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Text(
            "DESCRIPTION",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const Gap(12),
          Text(
            widget.description ??
                "Take the red bean to join the garden. View the collection at azuki.com/gallery.",
            style: TextStyle(fontSize: 16, color: AppColors.greyDark),
          ),
          if (discordUrl != null || twitterUrl != null || websiteUrl != null)
            const Gap(32),
          if (discordUrl != null || twitterUrl != null || websiteUrl != null)
            Text(
              "SOCIALS",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          if (discordUrl != null || twitterUrl != null || websiteUrl != null)
            const Gap(12),
          if (discordUrl != null || twitterUrl != null || websiteUrl != null)
            _buildSocialButtons(
              discordUrl: discordUrl,
              twitterUrl: twitterUrl,
              websiteUrl: websiteUrl,
            ),
          const Gap(32),
          Text(
            "ATTRIBUTES",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const Gap(12),
          _buildAttributeButtons(),
          const Gap(32),
          Text(
            "PERKS (5)",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Users helping us add perks will be rewarded ",
                style: TextStyle(color: AppColors.greyLight),
              ),
              const Gap(6),
              Icon(
                PhosphorIcons.info(PhosphorIconsStyle.fill),
                size: 20.0,
                color: AppColors.greyLight,
              ),
            ],
          ),
          const Gap(12),
          _buildPerks(),
          const Gap(32),
          Text(
            "SIMILAR NFTS",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const Gap(12),
          _buildSimilarNFTs(),
        ],
      ),
    );
  }

  Widget _buildActivityTab() {
    return Center(child: Text("Activity Tab Content"));
  }

  Widget _buildAnalyticsTab() {
    return Center(child: Text("Analytics Tab Content"));
  }

  Widget _buildSocialButtons(
      {String? discordUrl, String? twitterUrl, String? websiteUrl}) {
    return Row(
      children: [
        if (websiteUrl != null)
          _buildSocialButton(
              "Website", PhosphorIcons.globe(PhosphorIconsStyle.bold)),
        if (discordUrl != null)
          _buildSocialButton(
              "Discord", PhosphorIcons.discordLogo(PhosphorIconsStyle.bold)),
        if (twitterUrl != null)
          _buildSocialButton(
              "Twitter", PhosphorIcons.twitterLogo(PhosphorIconsStyle.bold)),
      ],
    );
  }

  Widget _buildSocialButton(String text, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16.0,
              color: AppColors.greyDark,
            ),
            const Gap(4),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAttributeButtons() {
    return Row(
      children: [
        _buildAttributeButton("Background", "Orange"),
        const Gap(12),
        _buildAttributeButton("Type", "Human"),
        const Gap(12),
        _buildAttributeButton("Hair", "Purple"),
      ],
    );
  }

  Widget _buildAttributeButton(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyVeryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
            const Gap(2),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPerks() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NFTPerkWidget(),
          Gap(12),
          NFTPerkWidget(),
          Gap(12),
          NFTPerkWidget(),
        ],
      ),
    );
  }

  Widget _buildSimilarNFTs() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - 16) / 2;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: listings?.map((listing) {
                return SizedBox(
                  width: cardWidth,
                  child: NFTCard(
                    description: null,
                    discordUrl: null,
                    websiteUrl: null,
                    twitterUrl: null,
                    isCollectionItem: true,
                    imageUrl: listing.imageUrl,
                    nftName: listing.name,
                    collectionName: 'Pontem-Space-Pirates',
                    price: listing.price,
                  ),
                );
              }).toList() ??
              [],
        );
      },
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 90,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              width: 34,
              height: 34,
              image: AssetImage("assets/icons/aptos-logo.png"),
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "89.02 APT",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "+2.98",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.greenDark,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(child: _buildButton("Bid", Colors.white, Colors.black)),
            const SizedBox(width: 16),
            Expanded(child: _buildButton("Buy", Colors.black, Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(60),
        color: bgColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class NFTListing {
  final String id;
  final int price;
  final String imageUrl;
  final String name;

  NFTListing({
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.name,
  });
}

final List<NFTListing> listings = [
  NFTListing(
    id: "6977e058-c84c-4f5e-9f8a-f7dc17e01d35",
    price: 17000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/6656.png",
    name: "#6656",
  ),
  NFTListing(
    id: "422ab1db-328b-4b64-b83b-1081b4812d28",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/5881.png",
    name: "#5881",
  ),
  NFTListing(
    id: "452ab8be-8415-4f3e-bfc2-d76c3214ee4d",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8248.png",
    name: "#8248",
  ),
  NFTListing(
    id: "65f77940-2ae0-49c7-969c-69aed7b55fd9",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/4232.png",
    name: "#4232",
  ),
  NFTListing(
    id: "7be5577f-7f40-472a-9daa-fca2b32af50b",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/1443.png",
    name: "#1443",
  ),
  NFTListing(
    id: "e43ddce5-3c97-42dd-ae53-2c0ae35e3a29",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8857.png",
    name: "#8857",
  ),
  NFTListing(
    id: "58457839-f8af-4283-a791-bfbda32d0505",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/9740.png",
    name: "#9740",
  ),
  NFTListing(
    id: "17008e46-252b-4b5c-a68c-c55de1687be0",
    price: 17500000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/2113.png",
    name: "#2113",
  ),
  NFTListing(
    id: "713322c4-f133-420c-8f8f-31a604361863",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/9095.png",
    name: "#9095",
  ),
  NFTListing(
    id: "7e4f5039-3e50-443c-9fe7-b7280f80338f",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/6436.png",
    name: "#6436",
  ),
  NFTListing(
    id: "4e7d4c83-6c25-4865-bbe3-0a58be8a6f62",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/335.png",
    name: "#335",
  ),
  NFTListing(
    id: "5480b170-296f-47a4-8129-122afb050b3a",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/5433.png",
    name: "#5433",
  ),
  NFTListing(
    id: "a87f8508-4f7c-443a-972f-cbf3fada3af5",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/2999.png",
    name: "#2999",
  ),
  NFTListing(
    id: "03ef4df4-50d7-4d37-99bf-30ec46beea3e",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8513.png",
    name: "#8513",
  ),
  NFTListing(
    id: "3b5e71ef-5a83-4a54-835d-08286d1dba5c",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/2520.png",
    name: "#2520",
  ),
  NFTListing(
    id: "3583aac6-6863-4285-b371-8163f783e9fc",
    price: 20000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8941.png",
    name: "#8941",
  ),
  NFTListing(
    id: "bffcd379-3aa2-439a-8585-6fcbcbfb2907",
    price: 21000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/3137.png",
    name: "#3137",
  ),
  NFTListing(
    id: "7c6a510f-1cd5-4c8f-b89e-c1522337570c",
    price: 25000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/8984.png",
    name: "#8984",
  ),
  NFTListing(
    id: "5374d0ce-30e2-436f-b7f0-9b6413e48f8d",
    price: 25000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/9406.png",
    name: "#9406",
  ),
  NFTListing(
    id: "7b8ec904-a2ac-4049-988f-819ec09ae745",
    price: 25000000,
    imageUrl:
        "https://bafybeia7o7urwwp7mkq7zmuljyktcwjz5wesu352akg7ditvlbuoj6e2u4.ipfs.nftstorage.link/5702.png",
    name: "#5702",
  ),
];
