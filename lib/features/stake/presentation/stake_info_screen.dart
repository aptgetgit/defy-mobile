import 'dart:math' show pi;

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';


import '../../../config/theme/colors.dart';
import '../../../core/navigation/routes/router.dart';
import '../../shared/presentation/widgets/custom_bottom_nav_bar_with_holders.dart';
import '../../shared/presentation/widgets/custom_tab_bar.dart';
import '../widgets/stake_chart.dart';

class StakeInfoScreen extends StatefulWidget {
  const StakeInfoScreen({
    required this.name,
    required this.logoPath,
    required this.percentage,
    required this.investors,
    required this.returnPeriod,
    this.isDelegate = false,
    super.key,
  });

  final String name;
  final String logoPath;
  final String percentage;
  final String investors;
  final String returnPeriod;
  final bool isDelegate;

  @override
  StakeInfoScreenState createState() => StakeInfoScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(StringProperty('name', name))
    ..add(StringProperty('logoPath', logoPath))
    ..add(StringProperty('percentage', percentage))
    ..add(StringProperty('investors', investors))
    ..add(StringProperty('returnPeriod', returnPeriod))
    ..add(DiagnosticsProperty<bool>('isDelegate', isDelegate));
  }
}

class StakeInfoScreenState extends State<StakeInfoScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  double _investmentAmount = 10000;
  String _timePeriod = '1M';
  double _scrollProgress = 0.0;
  double _currentPrice = 225.45;
  double _baselinePrice = 225.45;
  bool _useAnimatedPrice = false;
  double _arrowAngle = 0;
  Color _arrowColor = Colors.green;
  bool _isAboveBaseline = true;
  bool _showInAppBar = false;

  late AnimationController _arrowAnimationController;
  late Animation<double> _arrowRotationAnimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(_handleScroll);

    _arrowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _arrowRotationAnimation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _arrowAnimationController,
      curve: Curves.easeInOut,
    ),);

    _isAboveBaseline = _currentPrice >= _baselinePrice;
    _arrowAngle = _isAboveBaseline ? 0.0 : pi;
    _arrowColor = _isAboveBaseline ? Colors.green : Colors.red;
  }

  void _handleScroll() {
    final double scrollProgress = (_scrollController.offset / 200.0).clamp(0.0, 1.0);
    final bool newShowInAppBar = scrollProgress >= 0.5;

    setState(() {
      if (newShowInAppBar != _showInAppBar) {
        _showInAppBar = newShowInAppBar;
      }
      _scrollProgress = scrollProgress;
    });
  }

  @override
  void dispose() {
    _scrollController..removeListener(_handleScroll)..dispose();
    _tabController.dispose();
    _arrowAnimationController.dispose();
    super.dispose();
  }

  void _updateArrowAngle(double newPrice) {
    final double difference = newPrice - _baselinePrice;
    const double threshold = 0.01;
    final double switchZone = _baselinePrice * threshold;
    final bool newIsAboveBaseline = newPrice >= _baselinePrice;
    double newAngle;
    Color newColor;

    if (_baselinePrice == 0) {
      newAngle = 0.0;
      newColor = Colors.green;
    } else {
      newAngle = newIsAboveBaseline ? 0.0 : pi;
      newColor = newIsAboveBaseline ? Colors.green : Colors.red;

      final bool inSwitchZone = difference.abs() < switchZone;
      final bool stateChanged = newIsAboveBaseline != _isAboveBaseline;

      if (inSwitchZone || stateChanged) {
        newColor = inSwitchZone ? Colors.grey : newColor;
        setState(() {
          _arrowRotationAnimation = Tween<double>(
            begin: _arrowAngle,
            end: newAngle,
          ).animate(CurvedAnimation(
            parent: _arrowAnimationController,
            curve: Curves.easeInOut,
          ),);
          _arrowAngle = newAngle;
          _arrowColor = newColor;
          _isAboveBaseline = newIsAboveBaseline;
        });

        if (_arrowAnimationController.isAnimating) {
          _arrowAnimationController.forward(from: _arrowAnimationController.value);
        } else {
          _arrowAnimationController.forward(from: 0);
        }
      } else {
        setState(() {
          _arrowAngle = newAngle;
          _arrowColor = newColor;
          _isAboveBaseline = newIsAboveBaseline;
        });
      }
    }
  }

  void _updatePrice(double price, {bool animate = false}) {
    final double newPrice = price * 100;

    setState(() {
      _currentPrice = newPrice;

      if (animate) {
        _useAnimatedPrice = true;

        Future<void>.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            setState(() {
              _useAnimatedPrice = false;
            });
          }
        });
      } else {
        _useAnimatedPrice = false;
      }
    });

    _updateArrowAngle(newPrice);
  }

  void _updateBaseline(double baselineValue) {
    final double newBaseline = baselineValue * 100;
    setState(() {
      _baselinePrice = newBaseline;
    });
    _updateArrowAngle(_currentPrice);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 60.h,
            leading: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Icon(
                  PhosphorIconsBold.caretLeft,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            pinned: true,
            title: AnimatedOpacity(
              opacity: _scrollProgress,
              duration: const Duration(milliseconds: 300),
              child: _buildAppBarTitle(),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: IconButton(
                  icon: Icon(PhosphorIconsRegular.bell, size: 24.sp),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                  icon: Icon(PhosphorIconsRegular.shareNetwork, size: 24.sp),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AnimatedOpacity(
                    opacity: 1.0 - _scrollProgress,
                    duration: const Duration(milliseconds: 300),
                    child: _scrollProgress < 1.0 ? _buildHeaderContent() : const SizedBox.shrink(),
                  ),
                  Transform.translate(
                    offset: Offset(0, -50.h * _scrollProgress),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: StakeChart(
                        onPriceChange: (double price) {
                          _updatePrice(price);
                        },
                        onPriceChangeWithAnimation: (double price) {
                          _updatePrice(price, animate: true);
                        },
                        onBaselineValueChange: (double baselineValue) {
                          _updateBaseline(baselineValue);
                        },
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 38.h - (10.h * _scrollProgress),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildStakeInfoContainer(),
                        Gap(32.h),

                        // Details section
                        if (!widget.isDelegate) _buildDetailsSection(),

                        // If delegate, show unlock info
                        if (widget.isDelegate) _buildUnlockSection(),

                        // Return Calculator section
                        _buildReturnCalculator(),

                        Gap(16.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBarWithHolders(
        buttonText1: 'Stake Now',
        buttonColor1: AppColors.black,
        onTap1: ()  => widget.isDelegate
            ? const StakeAmountDelegateRoute().push(context)
            : const StakeAmountRoute().push(context),
        image1: 'avatar-1.png',
        image2: 'avatar-2.png',
        image3: 'avatar-3.png',
        headerText: 'James, Jane and 14+ hold >',
      ),
    );

  Widget _buildAppBarTitle() => Row(
        children: <Widget>[
          if (_showInAppBar)
            Hero(
              tag: 'stake_logo_${widget.logoPath}',
              child: Image.asset(widget.logoPath, height: 32.h, width: 32.h),
            )
          else
            Image.asset(widget.logoPath, height: 32.h, width: 32.h),
          Gap(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                '\$${_currentPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildHeaderContent() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 50.h,
                  width: 32.w,
                  child: _showInAppBar
                      ? Image.asset(widget.logoPath, height: 32.w, width: 32.w)
                      : Hero(
                          tag: 'stake_logo_${widget.logoPath}',
                          child: Material(
                            color: Colors.transparent,
                            child: TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.bounceOut,
                              tween: Tween<double>(begin: -15, end: 0),
                              builder: (BuildContext context, double value, Widget? child) => Transform.translate(
                                offset: Offset(0, value),
                                child: child,
                              ),
                              child: Image.asset(widget.logoPath, height: 32.w, width: 32.w),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Gap(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (_useAnimatedPrice)
                  AnimatedFlipCounter(
                    value: _currentPrice,
                    prefix: r'$',
                    fractionDigits: 2,
                    textStyle: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )
                else
                  Text(
                    '\$${_currentPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
              ],
            ),
            Gap(8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'APT',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: <Widget>[
                    // Arrow moved to the beginning of the row
                    SizedBox(
                      height: 20.h,
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _arrowAnimationController,
                          builder: (BuildContext context, Widget? child) => Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateZ(_arrowRotationAnimation.value),
                            child: Icon(
                              PhosphorIconsRegular.arrowUp,
                              size: 14.sp,
                              color: _arrowColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(4.w),
                    if (_useAnimatedPrice)
                      AnimatedFlipCounter(
                        value: _baselinePrice > 0 ? ((_currentPrice - _baselinePrice) / _baselinePrice * 100) : 0.0,
                        fractionDigits: 2,
                        suffix: '%',
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: _arrowColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    else
                      Text(
                        '${(_baselinePrice > 0 ? ((_currentPrice - _baselinePrice) / _baselinePrice * 100) : 0.0).toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: _arrowColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );

  Widget _buildStakeInfoContainer() => Container(
        padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h, right: 4.w),
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('100 APT', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
                Text('Invested', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(r'+312.21$', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.green)),
                    Text('PnL', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                  ],
                ),
                Gap(16.w),
                Icon(PhosphorIconsRegular.caretRight, size: 16.sp, color: Colors.grey[600]),
              ],
            ),
          ],
        ),
      );

  Widget _buildDetailsSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Details', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          Gap(20.h),
          Padding(
            padding: EdgeInsets.only(right: 93.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Stakers', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                    Text('14.28M APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Total Stakers', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                    Text('56.7M', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Gap(18.h),
          Padding(
            padding: EdgeInsets.only(right: 90.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Commission', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                    Text('3.02%', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Rewards', style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
                    Text('652.90 APT', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
          Gap(32.h),
        ],
      );

  Widget _buildUnlockSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Next Unlock in', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          Gap(20.h),
          Row(
            children: <Widget>[
              Image.asset('assets/icons/lock.png', width: 38.w),
              Gap(4.w),
              Text('12 D : 11 H : 21 M', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
            ],
          ),
          Gap(32.h),
        ],
      );

  Widget _buildReturnCalculator() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Return Calculator', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          Gap(16.h),
          CustomTabBar(tabController: _tabController, tabs: const <String>['Monthly', 'One Time']),
          SizedBox(
            height: 125.h,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Gap(24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Invested per month', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                        Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Gap(12.h),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4.h,
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Slider(
                          value: _investmentAmount,
                          max: 50000,
                          divisions: 500,
                          label: '\$${_investmentAmount.round()}',
                          onChanged: (double value) => setState(() => _investmentAmount = value),
                          activeColor: AppColors.blue,
                          inactiveColor: AppColors.blue.withOpacity(0.25),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Gap(24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Invested one time', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                        Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Gap(12.h),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4.h,
                        overlayShape: SliderComponentShape.noOverlay,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Slider(
                          value: _investmentAmount,
                          max: 50000,
                          divisions: 500,
                          label: '\$${_investmentAmount.round()}',
                          onChanged: (double value) => setState(() => _investmentAmount = value),
                          activeColor: AppColors.blue,
                          inactiveColor: AppColors.blue.withOpacity(0.25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Over the past', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
              Gap(21.h),
              _buildTimePeriodSelector(),
              Gap(24.h),
              Row(
                children: <Widget>[
                  Text('\$${_investmentAmount.round()}', style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w500)),
                  Gap(4.w),
                  Text('would have become', style: TextStyle(fontSize: 14.sp, color: AppColors.greyLight)),
                  Gap(4.w),
                  Text(r'$432.23', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  Gap(4.w),
                  Text('(+2.12%)', style: TextStyle(fontSize: 14.sp, color: Colors.green, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ],
      );

  Widget _buildTimePeriodSelector() => Row(
        children: <Widget>[
          _buildTimePeriodButton('1M'),
          Gap(13.w),
          _buildTimePeriodButton('3M'),
          Gap(13.w),
          _buildTimePeriodButton('6M'),
          Gap(13.w),
          _buildTimePeriodButton('1Y'),
        ],
      );

  Widget _buildTimePeriodButton(String period) => GestureDetector(
        onTap: () => setState(() => _timePeriod = period),
        child: Container(
          width: 54.w,
          height: 32.h,
          decoration: BoxDecoration(
            border: Border.all(color: _timePeriod == period ? AppColors.blue : AppColors.transparent),
            borderRadius: BorderRadius.circular(40.r),
            color: AppColors.greyVeryLight,
          ),
          child: Center(
            child: Text(
              period,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _timePeriod == period ? Colors.blue : AppColors.greyLight,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      );
}
