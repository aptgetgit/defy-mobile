import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
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
        expandedHeight: 200,
        pinned: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(PhosphorIconsBold.caretLeft, color: AppColors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(PhosphorIconsBold.share, color: AppColors.black),
            onPressed: () {
              // Handle share action
            },
          ),
        ],
        title: AnimatedOpacity(
          opacity: _showTitle ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: <Widget>[
              _buildPoolLogo(imageUrls: widget.imageUrls, small: true),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.appBarTitle,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
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
              padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildPoolLogo(imageUrls: widget.imageUrls),
                  const SizedBox(height: 20),
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
              ? SvgPicture.network(logoUrl, height: small ? 24.0 : 40.0)
              : Image.network(logoUrl, height: small ? 24.0 : 40.0),).toList(),
      );
    } else if (imageUrls.isNotEmpty) {
      final String logoUrl = imageUrls.first;
      return logoUrl.endsWith('.svg')
          ? SvgPicture.network(logoUrl, height: small ? 24.0 : 40.0)
          : Image.network(logoUrl, height: small ? 24.0 : 40.0);
    } else {
      return Image.asset('assets/icons/staking-default.png',
          height: small ? 24.0 : 40.0,);
    }
  }
}
