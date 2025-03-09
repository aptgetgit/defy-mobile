import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import 'receive_amount_screen.dart';
import 'receive_share_screen.dart';

class ReceiveSelectScreen extends ConsumerStatefulWidget {
  const ReceiveSelectScreen({super.key});

  @override
  _ReceiveSelectScreenState createState() => _ReceiveSelectScreenState();
}

class _ReceiveSelectScreenState extends ConsumerState<ReceiveSelectScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showSearchIcon = false;

  // Titles and subtitles for each page
  final List<Map<String, String>> _pageTitles = <Map<String, String>>[
    <String, String>{'title': 'Select Asset', 'subtitle': 'Request tokens'},
    <String, String>{'title': 'Enter Amount', 'subtitle': 'Request tokens'},
    <String, String>{'title': 'Share Link', 'subtitle': 'Request tokens'},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showSearchIcon) {
      setState(() {
        _showSearchIcon = true;
      });
    } else if (_scrollController.offset <= 100 && _showSearchIcon) {
      setState(() {
        _showSearchIcon = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentPage = ref.watch(receivePageProvider);
    final ReceivePageNotifier pageNotifier = ref.read(receivePageProvider.notifier);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(PhosphorIconsBold.caretLeft),
            onPressed: () {
              if (currentPage > 0) {
                pageNotifier.previousPage();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(3, (int index) {
              final bool isActive = (index + 1) == currentPage + 1;
              final bool isVisited = (index + 1) <= currentPage + 1;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: isActive ? 6 : 4,
                width: isActive ? 69 : 42,
                decoration: BoxDecoration(
                  color: isVisited ? AppColors.green : AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Fixed Section (Title, Subtitle, Search Bar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Gap(10),
                  // Dynamic Title and Subtitle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _pageTitles[currentPage]['title']!,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      if (currentPage == 0)
                        AnimatedOpacity(
                          opacity: _showSearchIcon ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: IconButton(
                            icon: const Icon(PhosphorIconsBold.magnifyingGlass, size: 24),
                            onPressed: () {
                              // Handle search icon press
                            },
                          ),
                        ),
                    ],
                  ),
                  const Gap(8),
                  Text(
                    _pageTitles[currentPage]['subtitle']!,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Gap(20),
                ],
              ),
            ),
            if (currentPage == 0)
              AnimatedOpacity(
                opacity: _showSearchIcon ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Search Assets',
                            hintStyle: TextStyle(
                              color: AppColors.greyLight,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                        Positioned(
                          left: 100,
                          child: Icon(
                            PhosphorIconsBold.magnifyingGlass,
                            color: AppColors.greyLight,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const Gap(20),

            // Scrollable Section (PageView)
            Expanded(
              child: PageView(
                controller: pageNotifier.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) {
                  debugPrint('PageView onPageChanged: index = $index');
                  // Only update if the index differs from the provider state.
                  if (index != ref.read(receivePageProvider)) {
                    pageNotifier.setPage(index);
                  }
                },
                children: <Widget>[
                  // Page 1: Asset List
                  KeyedSubtree(
                    key: const ValueKey('assetListPage'),
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemCount: _assets.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Map<String, String> asset = _assets[index];
                        return AssetItem(
                          name: asset['name'],
                          symbol: asset['symbol'],
                          imagePath: asset['imagePath'],
                          onTap: () {
                            debugPrint('AssetItem tapped: ${asset['name']}, currentPage: $currentPage');
                            if (currentPage == 0) { // only trigger if we're on the asset list page
                              pageNotifier.nextPage();
                            } else {
                              debugPrint('Ignoring tap; already navigated.');
                            }
                          },
                        );
                      },
                    ),
                  ),
                  // Page 2: Enter Amount Screen
                  const KeyedSubtree(
                    key: ValueKey('amountPage'),
                    child: ReceiveAmountScreen(),
                  ),
                  // Page 3: Share Link Screen
                  const KeyedSubtree(
                    key: ValueKey('sharePage'),
                    child: ReceiveShareScreen(),
                  ),
                ],
              ),
            ),

            // Next Button (Only shown on pages other than the first page)
            if (currentPage != 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: currentPage == 2 ? () {
                    _showShareBottomSheet(context);
                  } : pageNotifier.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: currentPage == 2 ? AppColors.blue : AppColors.black,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Text(currentPage == 2 ? 'Share Link' : 'Continue'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> _assets = <Map<String, String>>[
    <String, String>{'name': 'Aptos', 'symbol': 'APT', 'imagePath': 'assets/icons/aptos.png'},
    <String, String>{'name': 'Gui inu', 'symbol': 'GUI', 'imagePath': 'assets/icons/gui-inu.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Pancake', 'symbol': 'CAKE', 'imagePath': 'assets/icons/pancake.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
    <String, String>{'name': 'Thala', 'symbol': 'THL', 'imagePath': 'assets/icons/thala.png'},
    <String, String>{'name': 'Bluemove', 'symbol': 'MOVE', 'imagePath': 'assets/icons/bluemove.png'},
  ];

  // Function to show the bottom sheet
  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title
              Padding(
                padding: const EdgeInsets.only(left:20, top: 24, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Share this page',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(PhosphorIconsRegular.x, size: 24),
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Image.asset('assets/images/share-qr.png', width: 380, height: 502,),
              ),
              const Gap(24),
              // Share Options
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: <Widget>[
                      _buildShareOption(
                        icon: PhosphorIconsRegular.downloadSimple, 
                        label:'Save',
                        onPressed: () {},
                      ),
                      const Gap(30),
                      _buildShareOption(
                        icon: PhosphorIconsRegular.clipboard, 
                        label:'Copy',
                        onPressed: () {},
                      ),
                      const Gap(30),
                      _buildShareOption(
                        imagePath: 'assets/icons/whatsapp.png',
                        label:'Whatsapp',
                        onPressed: () {},
                      ),
                      const Gap(30),
                      _buildShareOption(
                        imagePath: 'assets/icons/telegram.png', 
                        label:'Telegram',
                        onPressed: () {},
                      ),
                      const Gap(30),
                      _buildShareOption(
                        imagePath: 'assets/icons/x.png', 
                        label:'X',
                        onPressed: () {},
                      ),
                      const Gap(30),
                      _buildShareOption(
                        icon: PhosphorIconsFill.dotsThreeOutline, 
                        label:'More',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(24),
            ],
          ),
        ),
    );
  }

  // Helper function to build share option buttons
  Widget _buildShareOption({
    IconData? icon, // Optional icon
    String? imagePath, // Optional image path
    required String label,
    required VoidCallback onPressed,
  }) => Column(
      children: <Widget>[
        CircleAvatar(
          radius: 24, // Adjust the size of the circle
          backgroundColor: Colors.grey.shade200, // Background color of the circle
          child: ClipOval(
            child: imagePath != null
                ? Image.asset(
                    imagePath,
                    width: 48, // Adjust the size of the image
                    height: 48,
                    fit: BoxFit.cover, // Fill the circle with the image
                  )
                : Icon(
                    icon,
                    size: 24, // Adjust the size of the icon
                    color: Colors.black, // Icon color
                  ),
          ),
        ),
        const Gap(8), // Space between the circle and the label
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
}

// Widget for Each Asset Item
class AssetItem extends StatelessWidget {
  const AssetItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.imagePath,
    this.onTap,
  });
  final String? name;
  final String? symbol;
  final String? imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imagePath!),
        radius: 22,
      ),
      title: Text(
        name!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        symbol!,
        style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 151, 157, 170)),
      ),
    ),
  );
}
