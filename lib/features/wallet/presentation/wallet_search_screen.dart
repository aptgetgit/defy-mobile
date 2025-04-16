import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';

class WalletSearchScreen extends StatefulWidget {
  const WalletSearchScreen({super.key});

  @override
  State<WalletSearchScreen> createState() => _WalletSearchScreenState();
}

class _WalletSearchScreenState extends State<WalletSearchScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  String _searchQuery = '';
  bool _isLoading = true;
  bool _isTextFieldFocused = false; // Add this to track focus state
  final FocusNode _searchFocusNode = FocusNode(); // Add focus node

  // Add these animation controllers to _WalletSearchScreenState
  late AnimationController _tokenSectionController;
  late AnimationController _nftSectionController;
  late Animation<double> _tokenSectionAnimation;
  late Animation<double> _nftSectionAnimation;
  bool _shouldShowTokenSection = true;
  bool _shouldShowNFTSection = true;

  // Define token data
  final List<Token> _tokens = [
    Token(
      name: 'Ethereum',
      balance: 1.245,
      amount: 1.245,
      currency: 'ETH',
      percentageChange: 1.02,
      price: r'$142.39',
      change: '+1.02%',
      imagePath: 'assets/icons/aptos.png',
    ),
    Token(
      name: 'USD Coin',
      balance: 12760.34,
      amount: 12760.34,
      currency: 'USDC',
      percentageChange: 1.02,
      price: r'$142.39',
      change: '+1.02%',
      imagePath: 'assets/icons/gui-inu.png',
    ),
    Token(
      name: 'Bitcoin',
      balance: 0.56,
      amount: 0.56,
      currency: 'BTC',
      percentageChange: 0.75,
      price: r'$38,560.20',
      change: '+0.75%',
      imagePath: 'assets/icons/aptos.png',
    ),
  ];

  // Define NFT collections data
  final List<NFTCollection> _nftCollections = [
    NFTCollection(
      name: 'Cyberpunk kids',
      count: 121,
      nfts: [
        NFT(id: 'Cyberpunk #123', price: r'$142.39', imageUrl: 'assets/images/nft_image1.png'),
        NFT(id: 'Cyberpunk #124', price: r'$142.39', imageUrl: 'assets/images/nft_image1.png'),
      ],
    ),
    NFTCollection(
      name: 'Doodles',
      count: 521,
      nfts: [
        NFT(id: 'Doodle #456', price: r'$142.39', imageUrl: 'assets/images/nft_image1.png'),
        NFT(id: 'Doodle #457', price: r'$142.39', imageUrl: 'assets/images/nft_image1.png'),
      ],
    ),
    NFTCollection(
      name: 'Bored Ape Yacht Club',
      count: 42,
      nfts: [
        NFT(id: 'BAYC #789', price: r'$142.39', imageUrl: 'assets/images/nft_image1.png'),
        NFT(id: 'BAYC #790', price: r'$142.39', imageUrl: 'assets/images/nft_image1.png'),
      ],
    ),
  ];

  // Filtered lists based on search query
  List<Token> get _filteredTokens {
    if (_searchQuery.isEmpty) return _tokens;
    
    return _tokens.where((token) => 
      token.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      token.currency.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  // Create a flattened list of all NFTs with their collection names
  List<Map<String, dynamic>> get _allNFTsWithCollections {
    final List<Map<String, dynamic>> result = [];
    
    for (final NFTCollection collection in _nftCollections) {
      for (final NFT nft in collection.nfts) {
        result.add({
          'nft': nft,
          'collectionName': collection.name,
          'itemCount': collection.count,
        });
      }
    }
    
    return result;
  }
  
  // Filtered NFTs based on search query
  List<Map<String, dynamic>> get _filteredNFTs {
    if (_searchQuery.isEmpty) {
      // Convert collections to the map format used in the list view
      final List<Map<String, dynamic>> result = [];
      for (final NFTCollection collection in _nftCollections) {
        result.add({
          'name': collection.name,
          'price': collection.nfts.isNotEmpty ? collection.nfts.first.price : r'$0.00',
          'value': '${collection.count} Items',
          'change': '+1.02%',
          'imagePath': collection.nfts.isNotEmpty ? collection.nfts.first.imageUrl : 'assets/images/Mask group.png',
          'isCollection': true,
        });
      }
      return result;
    }
    
    // Search in collections and NFTs
    return _allNFTsWithCollections
      .where((item) => 
        (item['collectionName']?.toString() ?? '').toLowerCase().contains(_searchQuery.toLowerCase()) ||
        (item['nft'].id?.toString() ?? '').toLowerCase().contains(_searchQuery.toLowerCase())
      )
      .map((item) => {
        'name': item['nft'].id,
        'collectionName': item['collectionName'],
        'price': item['nft'].price,
        'value': '${item['itemCount']} Items',
        'change': '+1.02%',
        'imagePath': item['nft'].imageUrl,
        'isCollection': false,
      })
      .toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Add listener to tab controller to handle tab changes
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          // Update UI when tab changes
        });
      }
    });
    
    _searchController.addListener(_onTextChange);
    _searchFocusNode.addListener(_onFocusChange);

    // Initialize animation controllers
    _tokenSectionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Shorter duration for collapsing
    );
    
    _nftSectionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Shorter duration for collapsing
    );
    
    _tokenSectionAnimation = CurvedAnimation(
      parent: _tokenSectionController,
      curve: Curves.easeInOut, // Smoother curve for both expansion and collapse
      reverseCurve: Curves.easeIn, // Specific curve for collapsing
    );
    
    _nftSectionAnimation = CurvedAnimation(
      parent: _nftSectionController,
      curve: Curves.easeInOut, // Smoother curve for both expansion and collapse
      reverseCurve: Curves.easeIn, // Specific curve for collapsing
    );
    
    // Start with fully expanded sections
    _tokenSectionController.value = 1.0;
    _nftSectionController.value = 1.0;

    // Simulate loading for 1-2 seconds
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController..removeListener(_onTextChange)
    ..dispose();
    _searchFocusNode.removeListener(_onFocusChange); // Remove focus listener
    _searchFocusNode.dispose(); // Dispose focus node
    _tabController.removeListener(() {});
    _tabController.dispose();
    _tokenSectionController.dispose();
    _nftSectionController.dispose();
    super.dispose();
  }

  // Add focus change listener
  void _onFocusChange() {
    setState(() {
      _isTextFieldFocused = _searchFocusNode.hasFocus;
    });
  }

  // Update the _onTextChange method for better animation control

void _onTextChange() {
  final String query = _searchController.text;
  
  // Pre-calculate filtered lists
  final List<Token> matchingTokens = _tokens.where((token) => 
    token.name.toLowerCase().contains(query.toLowerCase()) ||
    token.currency.toLowerCase().contains(query.toLowerCase())
  ).toList();
  
  final List<Map<String, dynamic>> matchingNFTs = _allNFTsWithCollections.where((item) => 
    (item['collectionName']?.toString() ?? '').toLowerCase().contains(query.toLowerCase()) ||
    (item['nft'].id?.toString() ?? '').toLowerCase().contains(query.toLowerCase())
  ).toList();
  
  final bool hasTokenResults = matchingTokens.isNotEmpty;
  final bool hasNFTResults = matchingNFTs.isNotEmpty;
  
  // If starting a search and sections need to collapse, pre-animate before updating state
  if (query.isNotEmpty && _searchQuery.isEmpty) {
    // Starting a new search from empty state
    if (!hasTokenResults) {
      // Begin token section collapse animation immediately
      _tokenSectionController.duration = const Duration(milliseconds: 200);
      _tokenSectionController.animateTo(0.0, curve: Curves.easeOut);
    }
    
    if (!hasNFTResults) {
      // Begin NFT section collapse animation immediately
      _nftSectionController.duration = const Duration(milliseconds: 200);
      _nftSectionController.animateTo(0.0, curve: Curves.easeOut);
    }
  }
  
  setState(() {
    _searchQuery = query;
    
    // Handle token section visibility
    if (hasTokenResults && !_shouldShowTokenSection) {
      _shouldShowTokenSection = true;
      _tokenSectionController.duration = const Duration(milliseconds: 400);
      _tokenSectionController.forward();
    } else if (!hasTokenResults && _shouldShowTokenSection && query.isNotEmpty) {
      _shouldShowTokenSection = false;
      // Already handled the animation start before setState if starting from empty
      if (_searchQuery.isNotEmpty) {
        _tokenSectionController.duration = const Duration(milliseconds: 200);
        _tokenSectionController.animateTo(0.0, curve: Curves.easeOut);
      }
    }
    
    // Handle NFT section visibility
    if (hasNFTResults && !_shouldShowNFTSection) {
      _shouldShowNFTSection = true;
      _nftSectionController.duration = const Duration(milliseconds: 400);
      _nftSectionController.forward();
    } else if (!hasNFTResults && _shouldShowNFTSection && query.isNotEmpty) {
      _shouldShowNFTSection = false;
      // Already handled the animation start before setState if starting from empty
      if (_searchQuery.isNotEmpty) {
        _nftSectionController.duration = const Duration(milliseconds: 200);
        _nftSectionController.animateTo(0.0, curve: Curves.easeOut);
      }
    }
  });
}

  void _clearText() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Search bar row
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 22.w),
                        child: GestureDetector(
                          onTap: _searchFocusNode.requestFocus,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 244, 244, 246),
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                // Centered hint text when text field is not focused and empty
                                // if (!_isTextFieldFocused && _searchQuery.isEmpty)
                                //   Row(
                                //     mainAxisSize: MainAxisSize.min,
                                //     children: <Widget>[
                                //       Gap(8.w), // Control the gap here
                                //       Text(
                                //         'Search for assets',
                                //         style: TextStyle(
                                //           color: AppColors.greyLight,
                                //           fontSize: 16.sp,
                                //           fontWeight: FontWeight.w500,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // TextField and animated icon
                                Stack(
                                  children: <Widget>[
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        // Animated Positioned for Search Icon
                                        AnimatedPositioned(
                                          duration: const Duration(milliseconds: 600),
                                          curve: Curves.easeInOut,
                                          left: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                              ? 12.w
                                              : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 - 20.w,
                                          top: 12.5.h,
                                          child: Hero(
                                            tag: 'searchIconHero',
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Icon(
                                                PhosphorIconsBold.magnifyingGlass,
                                                color: AppColors.greyLight,
                                                size: 20.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Animated Positioned for "Search for assets" Text
                                        AnimatedPositioned(
                                          duration: const Duration(milliseconds: 600),
                                          curve: Curves.easeInOut,
                                          left: (_isTextFieldFocused || _searchQuery.isNotEmpty)
                                              ? 40.w // Adjust this value to align with the search icon
                                              : (MediaQuery.of(context).size.width - 44.w - 22.w - 8.w - 150.w) / 2 + 10.w,
                                          top: 12.5.h,
                                          child: AnimatedOpacity(
                                            duration: const Duration(milliseconds: 1500),
                                            opacity: (!_isTextFieldFocused && _searchQuery.isEmpty) ? 1.0 : 0.0,
                                            child: Text(
                                              'Search for assets',
                                              style: TextStyle(
                                                color: AppColors.greyLight,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // TextField and animated icon
                                        Row(
                                          children: <Widget>[
                                            SizedBox(width: 40.w), // Reserve space for the icon
                                            Expanded(
                                              child: TextField(
                                                focusNode: _searchFocusNode, // Use the focus node
                                                // ignore: avoid_redundant_argument_values
                                                autofocus: false, // Don't autofocus
                                                showCursor: _isTextFieldFocused || _searchQuery.isNotEmpty, // Only show cursor when focused or has text
                                                controller: _searchController,
                                                onChanged: (String value) {
                                                  setState(() {
                                                    _searchQuery = value;
                                                  });
                                                },
                                                style: TextStyle(
                                                  color: AppColors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: _searchQuery.isNotEmpty ? TextAlign.left : TextAlign.center,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: '', // Empty hint since we show it manually
                                                  contentPadding: EdgeInsets.symmetric(vertical: 11.h),
                                                  suffixIcon: _searchQuery.isNotEmpty
                                                      ? IconButton(
                                                          icon: CircleAvatar(
                                                            backgroundColor: const Color.fromARGB(255, 189, 189, 189),
                                                            radius: 10.r,
                                                            child: Center(
                                                              child: Icon(
                                                                PhosphorIconsBold.x,
                                                                color: AppColors.white,
                                                                size: 12.sp,
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: _clearText,
                                                        )
                                                      : null,
                                                  suffixIconConstraints: const BoxConstraints(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(4.h),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          CustomTabBar(
                            tabController: _tabController,
                            tabs: const <String>[
                              'All(12)',
                              'Token(23)',
                              'NFT(20)',
                            ],
                          ),
                          // Add the divider line
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 350.w,
                              height: 1,
                              color: AppColors.greyVeryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(12.h),
                  ],
                ),
                // TabBar Views
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const BouncingScrollPhysics(), // Enable smooth swiping
                    children: <Widget>[
                      // All Tab - shows both tokens and NFTs
                      _buildAllTab(),
                      
                      // Tokens Tab - shows only tokens
                      if (_isLoading) const Center(child: CircularProgressIndicator()) else _filteredTokens.isEmpty && _searchQuery.isNotEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      PhosphorIconsBold.coins,
                                      size: 48.sp,
                                      color: Colors.grey[300],
                                    ),
                                    Gap(12.h),
                                    Text(
                                      'No tokens found',
                                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                                    ),
                                    if (_searchQuery.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h),
                                        child: Text(
                                          'for "$_searchQuery"',
                                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                                        ),
                                      ),
                                  ],
                                ),
                              )
                            : SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _filteredTokens.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final Token token = _filteredTokens[index];
                                        return ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                                          leading: Image.asset(token.imagePath, width: 40.w, height: 40.h),
                                          title: Text(
                                            token.name,
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                                          ),
                                          subtitle: Text(
                                            '${token.amount} ${token.currency}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: const Color.fromARGB(255, 151, 157, 170),
                                            ),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                token.price,
                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                                              ),
                                              Text(
                                                token.change,
                                                style: TextStyle(
                                                  color: AppColors.green,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              
                      // NFTs Tab - shows only NFTs
                      if (_isLoading) const Center(child: CircularProgressIndicator()) else _filteredNFTs.isEmpty && _searchQuery.isNotEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      PhosphorIconsBold.image,
                                      size: 48.sp,
                                      color: Colors.grey[300],
                                    ),
                                    Gap(12.h),
                                    Text(
                                      'No NFTs found',
                                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                                    ),
                                    if (_searchQuery.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.h),
                                        child: Text(
                                          'for "$_searchQuery"',
                                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                                        ),
                                      ),
                                  ],
                                ),
                              )
                            : SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: _filteredNFTs.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        final Map<String, dynamic> nft = _filteredNFTs[index];
                                        return ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                                          leading: Image.asset(nft['imagePath'] as String, width: 40.w, height: 40.h),
                                          title: Text(
                                            nft['name'] as String,
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                                          ),
                                          subtitle: Text(
                                            // ignore: use_if_null_to_convert_nulls_to_bools
                                            (nft['isCollection'] as bool?) == true 
                                                ? (nft['value'] as String) 
                                                : 'Collection: ${nft['collectionName'] as String}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              color: const Color.fromARGB(255, 151, 157, 170),
                                            ),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                nft['price'] as String,
                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                                              ),
                                              Text(
                                                nft['change'] as String,
                                                style: TextStyle(
                                                  color: AppColors.green,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildRecentTab() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 17.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (_searchQuery.isNotEmpty) Gap(8.h),
                Text(
                  'Recent History',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.greyLight),
                ),
              ],
            ),
          ),
          SizedBox(height: 145.h, child: _buildTokensTab()),
          SizedBox(height: 150.h, child: _buildNFTsTab()),
        ],
      );

  // Update the _buildAllTab method to include "See All" buttons

Widget _buildAllTab() {
  if (_searchQuery.isEmpty) {
    // Show regular categorized view when not searching
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Tokens section with "See All" in the header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 6.h),
                child: Text(
                  'Tokens',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 17.w, top: 6.h),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    _tabController.animateTo(1);
                  },
                  child: Text(
                    'See All(${_tokens.length})',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 195.h, 
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _tokens.length,
              itemBuilder: (context, index) {
                final Token token = _tokens[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                  leading: Image.asset(token.imagePath, width: 40.w, height: 40.h),
                  title: Text(
                    token.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                  ),
                  subtitle: Text(
                    '${token.amount} ${token.currency}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 151, 157, 170),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        token.price,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                      ),
                      Text(
                        token.change,
                        style: TextStyle(
                          color: AppColors.green,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          // NFTs section with "See All" in the header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 6.h),
                child: Text(
                  'NFTs',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 17.w, top: 6.h),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    _tabController.animateTo(2);
                  },
                  child: Text(
                    'See All(${_nftCollections.length})',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _nftCollections.length,
            itemBuilder: (context, index) {
              final NFTCollection collection = _nftCollections[index];
              final Map<String, dynamic> nft = {
                'name': collection.name,
                'price': collection.nfts.isNotEmpty ? collection.nfts.first.price : r'$0.00',
                'value': '${collection.count} Items',
                'change': '+1.02%',
                'imagePath': collection.nfts.isNotEmpty ? collection.nfts.first.imageUrl : 'assets/images/Mask group.png',
                'isCollection': true,
              };
              
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                leading: Image.asset(nft['imagePath'] as String, width: 44.w, height: 44.h),
                title: Text(
                  nft['name'] as String,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                ),
                subtitle: Text(
                  nft['value'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: const Color.fromARGB(255, 151, 157, 170),
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      nft['price'] as String,
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                    ),
                    Text(
                      nft['change'] as String,
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          
          // Add some bottom padding
          SizedBox(height: 16.h),
        ],
      ),
    );
  } else {
    // For search results also add "See All" buttons
    final bool hasTokenResults = _filteredTokens.isNotEmpty;
    final bool hasNFTResults = _filteredNFTs.isNotEmpty;
    
    if (!hasTokenResults && !hasNFTResults) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              PhosphorIconsBold.magnifyingGlass,
              size: 48.sp,
              color: Colors.grey[300],
            ),
            Gap(12.h),
            Text(
              'No results found for "$_searchQuery"',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }
    
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Tokens Section - Only show if we have tokens
          if (_filteredTokens.isNotEmpty)
            AnimatedBuilder(
              animation: _tokenSectionAnimation,
              builder: (context, child) {
                if (_tokenSectionController.isDismissed) return const SizedBox.shrink();
                
                return SizeTransition(
                  sizeFactor: _tokenSectionAnimation,
                  axisAlignment: -1.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Header with "See All" button
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 17.w),
                              child: Text(
                                'Tokens (${_filteredTokens.length})',
                                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 17.w),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  _tabController.animateTo(1);
                                },
                                child: Text(
                                  'See All(${_filteredTokens.length})',
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Token list
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _filteredTokens.length,
                        itemBuilder: (context, index) {
                          final Token token = _filteredTokens[index];
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                            leading: Image.asset(token.imagePath, width: 40.w, height: 40.h),
                            title: Text(
                              token.name,
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                            ),
                            subtitle: Text(
                              '${token.amount} ${token.currency}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: const Color.fromARGB(255, 151, 157, 170),
                              ),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  token.price,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                                ),
                                Text(
                                  token.change,
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            ),
          
          // NFTs Section - Only show if we have NFTs
          if (_filteredNFTs.isNotEmpty)
            AnimatedBuilder(
              animation: _nftSectionAnimation,
              builder: (context, child) {
                if (_nftSectionController.isDismissed) return const SizedBox.shrink();
                
                return SizeTransition(
                  sizeFactor: _nftSectionAnimation,
                  axisAlignment: -1.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Header with "See All" button
                      Padding(
                        padding: EdgeInsets.only(
                          top: hasTokenResults ? 20.h : 6.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 17.w),
                              child: Text(
                                'NFTs (${_filteredNFTs.length})',
                                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.greyLight),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 17.w),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  _tabController.animateTo(2);
                                },
                                child: Text(
                                  'See All(${_filteredNFTs.length})',
                                  style: TextStyle(
                                    color: AppColors.blue,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // NFT list
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _filteredNFTs.length,
                        itemBuilder: (context, index) {
                          final Map<String, dynamic> nft = _filteredNFTs[index];
                          return ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
                            leading: Image.asset(nft['imagePath'] as String, width: 40.w, height: 40.h),
                            title: Text(
                              nft['name'] as String,
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
                            ),
                            subtitle: Text(
                              (nft['isCollection'] as bool?) == true ? (nft['value'] as String) : 'Collection: ${nft['collectionName'] as String}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: const Color.fromARGB(255, 151, 157, 170),
                              ),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  nft['price'] as String,
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                                ),
                                Text(
                                  nft['change'] as String,
                                  style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }
            ),
            
          // Add some bottom padding
         Gap(8.h),
        ],
      ),
    );
  }
}

// Update the _buildTokensTab method to ensure it only shows tokens

Widget _buildTokensTab() {
  if (_isLoading) {
    // Keep your existing shimmer code for token tab
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
          leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.r),
            ),
          ),
          title: Container(
            width: 100.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          subtitle: Container(
            width: 80.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 60.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                width: 40.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Token> tokens = _filteredTokens;
  
  // Show empty state if no results
  if (tokens.isEmpty && _searchQuery.isNotEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIconsBold.coins,
            size: 48.sp,
            color: Colors.grey[300],
          ),
          Gap(12.h),
          Text(
            'No tokens found',
            style: TextStyle(color: Colors.grey, fontSize: 16.sp),
          ),
          if (_searchQuery.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                'for "$_searchQuery"',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ),
        ],
      ),
    );
  }

  // Full-page scrollable list of tokens
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: tokens.length,
    itemBuilder: (BuildContext context, int index) {
      final Token token = tokens[index];
      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
        leading: Image.asset(token.imagePath, width: 40.w, height: 40.h),
        title: Text(
          token.name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
        ),
        subtitle: Text(
          '${token.amount} ${token.currency}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: const Color.fromARGB(255, 151, 157, 170),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              token.price,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            Text(
              token.change,
              style: TextStyle(
                color: AppColors.green,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    },
  );
}

// Similarly update the _buildNFTsTab method
Widget _buildNFTsTab() {
  if (_isLoading) {
    // Keep your existing shimmer code for NFT tab
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
          leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          title: Container(
            width: 100.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          subtitle: Container(
            width: 80.w,
            height: 14.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 60.w,
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                width: 40.w,
                height: 14.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> nfts = _filteredNFTs;
  
  // Show empty state if no results
  if (nfts.isEmpty && _searchQuery.isNotEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            PhosphorIconsBold.image,
            size: 48.sp,
            color: Colors.grey[300],
          ),
          Gap(12.h),
          Text(
            'No NFTs found',
            style: TextStyle(color: Colors.grey, fontSize: 16.sp),
          ),
          if (_searchQuery.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                'for "$_searchQuery"',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ),
        ],
      ),
    );
  }

  // Full-page scrollable list of NFTs
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    itemCount: nfts.length,
    itemBuilder: (BuildContext context, int index) {
      final Map<String, dynamic> nft = nfts[index];
      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
        leading: Image.asset(nft['imagePath'] as String, width: 40.w, height: 40.h),
        title: Text(
          nft['name'] as String,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp, color: AppColors.black),
        ),
        subtitle: Text(
          (nft['isCollection'] as bool?) == true ? (nft['value'] as String) : 'Collection: ${nft['collectionName'] as String}',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            color: const Color.fromARGB(255, 151, 157, 170),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              nft['price'] as String,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
            ),
            Text(
              nft['change'] as String,
              style: TextStyle(
                color: AppColors.green,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    },
  );
}

  Widget _buildEmptyContent() => Center(
        child: Text(
          'No content available',
          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
        ),
      );
}

class Token {
  final String name;
  final double balance;
  final double amount;
  final String currency;
  final double percentageChange;
  final String price;
  final String change;
  final String imagePath;

  Token({
    required this.name,
    required this.balance,
    required this.amount,
    required this.currency,
    required this.percentageChange,
    required this.price,
    required this.change,
    required this.imagePath,
  });
}

class NFT {
  final String id;
  final String price;
  final String imageUrl;

  NFT({
    required this.id,
    required this.price,
    required this.imageUrl,
  });
}

class NFTCollection {
  final String name;
  final int count;
  final List<NFT> nfts;

  NFTCollection({
    required this.name,
    required this.count,
    required this.nfts,
  });
}
