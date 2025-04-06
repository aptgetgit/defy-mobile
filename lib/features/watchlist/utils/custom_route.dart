import 'package:flutter/material.dart';
import '../widgets/watchlist_newList_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewListTilePageRoute extends PageRouteBuilder {
  final Widget page;
  final Rect sourceRect;
  final GlobalKey destinationKey;
  
  NewListTilePageRoute({
    required this.page,
    required this.sourceRect,
    required this.destinationKey,
  }) : super(
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) => page,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return Stack(
        children: [
          // Fade in the destination screen
          FadeTransition(
            opacity: animation,
            child: child,
          ),
          
          // Animated tile that moves from source to destination
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              // Get the position of the destination in the next screen
              // Default position if not available yet
              Rect destinationRect = sourceRect;
              
              // Try to get actual position once the destination is rendered
              if (destinationKey.currentContext != null) {
                final RenderBox renderBox = destinationKey.currentContext!.findRenderObject() as RenderBox;
                final Offset position = renderBox.localToGlobal(Offset.zero);
                destinationRect = Rect.fromLTWH(
                  position.dx,
                  position.dy,
                  renderBox.size.width,
                  renderBox.size.height,
                );
              } else {
                // If destination context isn't available yet, provide a good default
                // This will be the approximate position in the new collection screen
                destinationRect = Rect.fromLTWH(
                  (MediaQuery.of(context).size.width - 164.w) / 2,  // Center horizontally
                  20.h + 80.h,                                       // Top margin + space for title
                  164.w,                                             // Standard width
                  164.h                                              // Standard height
                );
              }
              
              // Interpolate between source and destination positions
              final double left = Tween<double>(begin: sourceRect.left, end: destinationRect.left)
                  .evaluate(animation);
              final double top = Tween<double>(begin: sourceRect.top, end: destinationRect.top)
                  .evaluate(animation);
              final double width = Tween<double>(begin: sourceRect.width, end: destinationRect.width)
                  .evaluate(animation);
              final double height = Tween<double>(begin: sourceRect.height, end: destinationRect.height)
                  .evaluate(animation);
              
              return Positioned(
                left: left,
                top: top,
                width: width,
                height: height,
                child: FadeTransition(
                  opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      // Keep it visible for longer during the animation (0.8 instead of 0.6)
                      curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
                    ),
                  ),
                  child: child,
                ),
              );
            },
            child: Material(
              color: Colors.transparent,
              child: WatchlistNewListTile(forceEmptyState: true),
            ),
          ),
        ],
      );
    },
    transitionDuration: const Duration(milliseconds: 600),  // Slightly longer for better visibility
  );
}