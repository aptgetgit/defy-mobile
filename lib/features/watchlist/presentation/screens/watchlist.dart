import 'package:defy/config/theme/colors.dart';
import 'package:defy/features/watchlist/presentation/components/nft_tab.dart';
import 'package:defy/features/watchlist/presentation/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(keepScrollOffset: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(PhosphorIconsBold.caretLeft,size: 26,)),
        title: Text('Watchlsit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        actions: [
          Icon(PhosphorIcons.star(),size: 26),
          const SizedBox(width: 16,),
        ]
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, isScrolled) {
                    return [
                      CustomSearchBar(title : 'Search Collections'),
                      const WatchlistTabBar(),
                    ];
                  },
                  body: TabBarView(
                    children: ['NFTs', 'Tokens', 'People'].map((t) {
                      switch (t) {
                        case 'NFTs':
                          return WatchlistNFTTab();
                        case 'Tokens':
                          return Center(child: Text(t));
                        case 'People':
                          return Center(child: Text(t));
                        default:
                          return Center(child: Text('Not Availabe'));
                      }
                    }).toList(),
                  ),
                ),
                                  )
              ],
            ),
          ),
        ),
      ),
        
      );
  }
}


class CustomSearchBar extends StatelessWidget {
  final String title;
  CustomSearchBar({this.title = "Search Token", super.key});

  GlobalKey textFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: TextField(
          key: textFieldKey,
          cursorColor: AppColors.greyLight,
          style: TextStyle(fontSize: 16,
          fontWeight: FontWeight.w500,),
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: AppColors.greyVeryLight,
            hintText: title,
            hintStyle:  TextStyle(fontSize: 16,
          fontWeight: FontWeight.w500,),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(8.0)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(8.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                borderRadius: BorderRadius.circular(8.0)),
            prefixIcon: const Icon(
              PhosphorIconsBold.magnifyingGlass,
              size: 20,
              color: AppColors.greyLight,
            ),
          ),
        ),
      ),
    );
  }
}
