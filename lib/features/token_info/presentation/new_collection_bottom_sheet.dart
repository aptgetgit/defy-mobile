import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:defy/features/token_info/presentation/watchlist_bottom_sheet.dart';
import 'package:defy/features/token_info/providers/watchlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NewCollectionWidget extends ConsumerWidget {
  const NewCollectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(watchlistControllerProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      state.newTokenCollectionFocusNode.requestFocus();
    });

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.02,
        horizontal: context.screenWidth * 0.025,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.0125,
          vertical: context.screenHeight * 0.0125,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const WatchlistBottomSheet(),
                    );
                  },
                  icon: const Icon(PhosphorIconsBold.caretLeft),
                ),
                Text(
                  'New Token Collection',
                  style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(PhosphorIconsBold.x),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'Collections help you to group tokens and keep\ntrack of them',
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'Collection Name',
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.0125),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF4F4F6),
              ),
              child: TextField(
                controller: state.newTokenCollectionController,
                focusNode: state.newTokenCollectionFocusNode,
                style: context.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.025),
              child: ActiveButton(
                label: 'Create Collection',
                onTap: () {
                  Navigator.pop(context);
                },
                active: true,
                size: ButtonSize.large,
              ),
            ),
          ],
        ),
      ),
    );
  }
}