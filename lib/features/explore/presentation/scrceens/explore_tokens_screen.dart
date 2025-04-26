import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/theme/colors.dart';
import '../data/models/explore_models.dart';
import '../providers/explore_provider.dart';
import 'explore_token_info_screen.dart';

class ExploreTokensScreen extends ConsumerStatefulWidget {
    const ExploreTokensScreen({super.key});

    @override
    ConsumerState<ExploreTokensScreen> createState() => _ExploreTokensScreenState();
}

class _ExploreTokensScreenState extends ConsumerState<ExploreTokensScreen> with SingleTickerProviderStateMixin {
    final TextEditingController _searchController = TextEditingController();
    final ValueNotifier<int> currentPage = ValueNotifier<int>(0);
    final PageController pageController = PageController();

    @override
    void initState() {
        super.initState();
        _searchController.addListener(_onSearchChanged);

        // Auto-scroll the cards every 2 seconds instead of 5
        Timer.periodic(const Duration(seconds: 2), (timer) {
            if (mounted) {
                final nextPage = (currentPage.value + 1) % 3;
                pageController.animateToPage(
                    nextPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                );
            } else {
                timer.cancel(); // Make sure to cancel the timer if widget is unmounted
            }
        });
    }

    void _onSearchChanged() {
        ref.read(exploreNotifierProvider.notifier).searchTokens(_searchController.text);
    }

    @override
    void dispose() {
        _searchController.removeListener(_onSearchChanged);
        _searchController.dispose();
        currentPage.dispose();
        pageController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        final exploreState = ref.watch(exploreNotifierProvider);

        return DefaultTabController(
            length: exploreState.isToggled ? 2 : 4,
            child: Scaffold(
                appBar: AppBar(
                    centerTitle: true,
                    title: Text(
                        'Tokens',
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                        ),
                    ),
                ),
                body: SafeArea(
                    child: Column(
                        children: <Widget>[
                            // Search bar with toggle button
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                child: Row(
                                    children: <Widget>[
                                        // Search Bar
                                        Expanded(
                                            child: Container(
                                                height: 48.h,
                                                decoration: BoxDecoration(
                                                    color: const Color(0xfff4f4f6),
                                                    borderRadius: BorderRadius.circular(58.r),
                                                ),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                        Gap(16.w),
                                                        Icon(
                                                            PhosphorIconsBold.magnifyingGlass,
                                                            color: AppColors.greyMedium,
                                                            size: 18.sp,
                                                        ),
                                                        Gap(8.w),
                                                        Expanded(
                                                            child: TextField(
                                                                controller: _searchController,
                                                                decoration: InputDecoration(
                                                                    border: InputBorder.none,
                                                                    hintText: 'Search or paste URL',
                                                                    hintStyle: TextStyle(
                                                                        color: AppColors.greyMedium,
                                                                        fontSize: 14.sp,
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                        Icon(
                                                            PhosphorIconsBold.cards,
                                                            color: AppColors.greyMedium,
                                                            size: 18.sp,
                                                        ),
                                                        Gap(16.w),
                                                    ],
                                                ),
                                            ),
                                        ),

                                        // Custom Toggle Button with Label
                                        Gap(8.w),
                                        GestureDetector(
                                            onTap: () {
                                                ref.read(exploreNotifierProvider.notifier).toggleRocketMode();
                                            },
                                            child: Column(
                                                children: <Widget>[
                                                    AnimatedContainer(
                                                        duration: const Duration(milliseconds: 300),
                                                        width: 46.w,
                                                        height: 26.h,
                                                        decoration: BoxDecoration(
                                                            color: exploreState.isToggled ? Colors.orange : AppColors.greyMedium,
                                                            borderRadius: BorderRadius.circular(50.r),
                                                            boxShadow: <BoxShadow>[
                                                                BoxShadow(
                                                                    color: Colors.grey.withAlpha(51),
                                                                    spreadRadius: -2.r,
                                                                    offset: Offset(0, 2.h),
                                                                ),
                                                            ],
                                                        ),
                                                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                                                        child: Align(
                                                            alignment: exploreState.isToggled ? Alignment.centerRight : Alignment.centerLeft,
                                                            child: Container(
                                                                width: 22.w,
                                                                height: 22.h,
                                                                decoration: const BoxDecoration(
                                                                    color: Colors.white,
                                                                    shape: BoxShape.circle,
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                    Gap(2.h),
                                                    Text(
                                                        '🚀 mode',
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.orangeAccent,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),

                            // Hot Emoji Card Section (Updated)
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                                child: SizedBox(
                                    height: 220.h, // Increased height to accommodate page indicators
                                    child: PageView(
                                        controller: pageController,
                                        onPageChanged: (index) {
                                            currentPage.value = index;
                                        },
                                        children: [
                                            _buildHotEmojiCard(),
                                            _buildHotWheelsCard(),
                                            _buildNoobRacersCard(),
                                        ],
                                    ),
                                ),
                            ),

                            // Tab Bar section
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                        Expanded(
                                            child: TabBar(
                                                isScrollable: true,
                                                tabAlignment: TabAlignment.start,
                                                labelColor: Colors.black,
                                                unselectedLabelColor: Colors.grey,
                                                indicatorColor: Colors.black,
                                                dividerColor: AppColors.greyVeryLight,
                                                labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                                                unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                                                tabs: exploreState.isToggled
                                                    ? const <Widget>[
                                                        Tab(text: 'Emoji'),
                                                        Tab(text: 'Tokens'),
                                                    ]
                                                    : const <Widget>[
                                                        Tab(text: 'All'),
                                                        Tab(text: 'Emoji'),
                                                        Tab(text: 'Defi'),
                                                        Tab(text: 'Meme'),
                                                    ],
                                            ),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                                PhosphorIconsBold.sortAscending,
                                                color: AppColors.greyMedium,
                                                size: 24.sp,
                                            ),
                                            onPressed: () {
                                                ref.read(exploreNotifierProvider.notifier).showSortSheet();
                                                _showSortOptions(context);
                                            },
                                        ),
                                    ],
                                ),
                            ),

                            // Tab View Content
                            Expanded(
                                child: TabBarView(
                                    children: exploreState.isToggled
                                        ? <Widget>[
                                            _buildTokenList(exploreState.displayedTokens
                                                .where((t) => t.symbol.toString().contains('🌐')).toList()),
                                            _buildTokenList(exploreState.displayedTokens),
                                        ]
                                        : <Widget>[
                                            _buildTokenList(exploreState.displayedTokens),
                                            _buildTokenList(exploreState.displayedTokens
                                                .where((t) => t.symbol.toString().contains('🌐')).toList()),
                                            _buildTokenList(exploreState.displayedTokens
                                                .where((t) => t.name.toString().contains('Pancake')).toList()),
                                            _buildTokenList(exploreState.displayedTokens
                                                .where((t) => t.priceUsd < 3.0).toList()),
                                        ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }

    // Updated Method to Build the Hot Emoji Card
    Widget _buildHotEmojiCard() {
        return Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.greyVeryLight2,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                    ),
                ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                            Colors.orange.withOpacity(0.5),
                                            Colors.orange.withOpacity(0.1),
                                        ],
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                    'Hot Emoji 🔥',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange,
                                    ),
                                ),
                            ),
                            ValueListenableBuilder<int>(
                                valueListenable: currentPage,
                                builder: (context, page, _) {
                                    return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(3, (index) {
                                            return Container(
                                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                                width: page == index ? 10.w : 6.w,
                                                height: page == index ? 10.h : 6.h,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: page == index ? Colors.orange : Colors.grey,
                                                ),
                                            );
                                        }),
                                    );
                                },
                            ),
                        ],
                    ),
                    Gap(16.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            // First Earth Token
                            Column(
                                children: [
                                    Icon(
                                        Icons.language, // Placeholder for the Earth emoji
                                        size: 50.sp,
                                        color: Colors.blue,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'Earth',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                                                color: Colors.green,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '2.5%',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                            // Second Earth Token
                            Column(
                                children: [
                                    Icon(
                                        Icons.language,
                                        size: 50.sp,
                                        color: Colors.blue,
                                    ),
                                    Gap(12.h),
                                    Text(
                                        'Earth',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                                                color: Colors.green,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '1.8%',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                            // Third Earth Token
                            Column(
                                children: [
                                    Icon(
                                        Icons.language,
                                        size: 50.sp,
                                        color: Colors.blue,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'Earth',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                                                color: AppColors.red,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '3.1%',
                                                style: TextStyle(
                                                    color: AppColors.red,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
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
        );
    }

    // New Method to Build the Hot Wheels Card
    Widget _buildHotWheelsCard() {
        return Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.greyVeryLight2,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                    ),
                ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                            Colors.red.withOpacity(0.5),
                                            Colors.red.withOpacity(0.1),
                                        ],
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                    'Hot Wheels 🏎️',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                    ),
                                ),
                            ),
                            ValueListenableBuilder<int>(
                                valueListenable: currentPage,
                                builder: (context, page, _) {
                                    return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(3, (index) {
                                            return Container(
                                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                                width: page == index ? 10.w : 6.w,
                                                height: page == index ? 10.h : 6.h,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: page == index ? Colors.orange : Colors.grey,
                                                ),
                                            );
                                        }),
                                    );
                                },
                            ),
                        ],
                    ),
                    Gap(16.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            // First Car Token
                            Column(
                                children: [
                                    Icon(
                                        PhosphorIcons.car(PhosphorIconsStyle.fill),
                                        size: 50.sp,
                                        color: Colors.red,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'F1 Racer',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                                                color: Colors.green,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '5.2%',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                            // Second Car Token
                            Column(
                                children: [
                                    Icon(
                                        PhosphorIcons.jeep(PhosphorIconsStyle.fill),
                                        size: 50.sp,
                                        color: Colors.red,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'SUV',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                                                color: AppColors.red,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '1.7%',
                                                style: TextStyle(
                                                    color: AppColors.red,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                            // Third Car Token
                            Column(
                                children: [
                                    Icon(
                                        PhosphorIcons.truck(PhosphorIconsStyle.fill),
                                        size: 50.sp,
                                        color: Colors.red,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'Pickup',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                                                color: Colors.green,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '3.8%',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
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
        );
    }

    // New Method to Build the Noob Racers Card
    Widget _buildNoobRacersCard() {
        return Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.greyVeryLight2,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                    ),
                ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                            Colors.blue.withOpacity(0.5),
                                            Colors.blue.withOpacity(0.1),
                                        ],
                                    ),
                                    borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                    'Noob Racers 🎮',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue,
                                    ),
                                ),
                            ),
                            ValueListenableBuilder<int>(
                                valueListenable: currentPage,
                                builder: (context, page, _) {
                                    return Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(3, (index) {
                                            return Container(
                                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                                width: page == index ? 10.w : 6.w,
                                                height: page == index ? 10.h : 6.h,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: page == index ? Colors.orange : Colors.grey,
                                                ),
                                            );
                                        }),
                                    );
                                },
                            ),
                        ],
                    ),
                    Gap(16.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            // First Game Token
                            Column(
                                children: [
                                    Icon(
                                        PhosphorIcons.gameController(PhosphorIconsStyle.fill),
                                        size: 50.sp,
                                        color: Colors.blue,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'RacerX',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                                                color: Colors.green,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '8.3%',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                            // Second Game Token
                            Column(
                                children: [
                                    Icon(
                                        PhosphorIcons.joystick(PhosphorIconsStyle.fill),
                                        size: 50.sp,
                                        color: Colors.blue,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'NeedSpeed',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretUp(PhosphorIconsStyle.bold),
                                                color: Colors.green,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '6.1%',
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                ),
                                            ),
                                        ],
                                    ),
                                ],
                            ),
                            // Third Game Token
                            Column(
                                children: [
                                    Icon(
                                        PhosphorIcons.screencast(PhosphorIconsStyle.fill),
                                        size: 50.sp,
                                        color: Colors.blue,
                                    ),
                                    Gap(8.h),
                                    Text(
                                        'Kart Race',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                    Gap(8.h),
                                    Row(
                                        children: [
                                            Icon(
                                                PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                                                color: AppColors.red,
                                                size: 14.sp,
                                            ),
                                            Text(
                                                '2.4%',
                                                style: TextStyle(
                                                    color: AppColors.red,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
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
        );
    }

    Widget _buildTokenList(List<ExploreToken> tokens) {
        return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: tokens.length,
            itemBuilder: (context, index) {
                final token = tokens[index];
                final isFavorite = ref.watch(exploreNotifierProvider)
                    .favoriteTokenIds.contains(token.id);

                return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(token.logo ?? 'assets/images/default_token.png'),
                        radius: 22.r,
                    ),
                    title: Text(
                        token.name,
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                        token.symbol,
                        style: TextStyle(color: AppColors.grey, fontSize: 14.sp),
                    ),
                    trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Text(
                                        token.priceUsd.toStringAsFixed(2),
                                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                        '${token.changePercentage}%',
                                        style: TextStyle(
                                            color: token.changePercentage > 0 ? Colors.green : Colors.red,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                ],
                            ),
                            IconButton(
                                icon: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                    ref.read(exploreNotifierProvider.notifier)
                                        .toggleTokenFavorite(token.id);
                                },
                            ),
                        ],
                    ),
                    onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ExploreTokenInfoScreen(
                                    name: token.name,
                                    logoPath: token.logo ?? 'assets/images/default_token.png',
                                    percentage: '${token.changePercentage}%',
                                    investors: token.investors.toString(),
                                    returnPeriod: token.returnPeriod,
                                ),
                            ),
                        );
                    },
                );
            },
        );
    }

    void _showSortOptions(BuildContext context) {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
                final state = ref.watch(exploreNotifierProvider);

                return Container(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                            ListTile(
                                title: Text('Sort by Price (High to Low)'),
                                trailing: state.isSortPriceHighToLowSelected
                                    ? const Icon(Icons.check, color: Colors.blue)
                                    : null,
                                onTap: () {
                                    ref.read(exploreNotifierProvider.notifier).setSortOption(
                                        isSortPriceHighToLowSelected: true,
                                    );
                                    Navigator.pop(context);
                                },
                            ),
                            ListTile(
                                title: Text('Sort by Price (Low to High)'),
                                trailing: state.isSortPriceLowToHighSelected
                                    ? const Icon(Icons.check, color: Colors.blue)
                                    : null,
                                onTap: () {
                                    ref.read(exploreNotifierProvider.notifier).setSortOption(
                                        isSortPriceLowToHighSelected: true,
                                    );
                                    Navigator.pop(context);
                                },
                            ),
                            ListTile(
                                title: Text('Sort by Change (24h)'),
                                trailing: state.isSortChangeSelected
                                    ? const Icon(Icons.check, color: Colors.blue)
                                    : null,
                                onTap: () {
                                    ref.read(exploreNotifierProvider.notifier).setSortOption(
                                        isSortChangeSelected: true,
                                    );
                                    Navigator.pop(context);
                                },
                            ),
                        ],
                    ),
                );
            },
        );
    }
}