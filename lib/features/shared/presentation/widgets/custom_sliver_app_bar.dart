import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';

class CustomSliverAppBar extends StatefulWidget { 

  const CustomSliverAppBar({
    super.key,
    required this.imageUrls,
    required this.appBarTitle,
    this.flexibleSpaceWidgets,
    this.flexibleSpaceFooter,
  });
  final List<String> imageUrls;
  final String appBarTitle; 
  final List<Widget>? flexibleSpaceWidgets; 
  final Widget? flexibleSpaceFooter;

  @override
  CustomSliverAppBarState createState() => CustomSliverAppBarState();
}

class CustomSliverAppBarState extends State<CustomSliverAppBar> {
  bool _showTitle = false;

  void _scrollListener(ScrollController scrollController) {
    if (scrollController.hasClients) {
      setState(() {
        _showTitle = scrollController.offset > 100;
      });
    }
  }

  @override
  Widget build(BuildContext context) => NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollUpdateNotification) {
          _scrollListener(scrollNotification.metrics as ScrollController);
        }
        return true;
      },
      child: SliverAppBar(
        expandedHeight: 200.h,
        pinned: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            PhosphorIconsBold.caretLeft, 
            color: AppColors.black,
            size: 24.sp,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              PhosphorIconsBold.share, 
              color: AppColors.black,
              size: 24.sp,
            ),
            onPressed: () {
              // Handle share action
            },
          ),
          SizedBox(width: 8.w),
        ],
        title: AnimatedOpacity(
          opacity: _showTitle ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: <Widget>[
              _buildPoolLogo(imageUrls: widget.imageUrls, small: true),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  widget.appBarTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontSize: 16.sp,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 56.h, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildPoolLogo(imageUrls: widget.imageUrls),
                  SizedBox(height: 20.h),
                  if (widget.flexibleSpaceWidgets != null)
                    ...widget.flexibleSpaceWidgets!,
                  const Spacer(),
                 
                  if (widget.flexibleSpaceFooter != null)
                    widget.flexibleSpaceFooter!,
                ],
              ),
            ),
          ),
        ),
      ),
    );

  Widget _buildPoolLogo({
    required List<String> imageUrls,
    bool small = false,
  }) {
    final bool isDual = imageUrls.length > 1;

    if (isDual) {
      return RowSuper(
        innerDistance: -20,
        children: imageUrls.map<Widget>((String logoUrl) => logoUrl.endsWith('.svg')
              ? SvgPicture.network(logoUrl, height: small ? 24.h : 40.h)
              : Image.network(logoUrl, height: small ? 24.h : 40.h),).toList(),
      );
    } else if (imageUrls.isNotEmpty) {
      final String logoUrl = imageUrls.first;
      return logoUrl.endsWith('.svg')
          ? SvgPicture.network(logoUrl, height: small ? 24.h : 40.h)
          : Image.network(logoUrl, height: small ? 24.h : 40.h);
    } else {
      return Image.asset(
        'assets/icons/staking-default.png',
        height: small ? 24.h : 40.h,
      );
    }
  }
}
