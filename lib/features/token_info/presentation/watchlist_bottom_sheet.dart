import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:defy/features/token_info/providers/watchlist_controller.dart';
import 'package:defy/features/token_info/presentation/new_collection_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WatchlistBottomSheet extends ConsumerWidget {
  const WatchlistBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(watchlistControllerProvider);

    return Container(
      padding: EdgeInsets.all(context.screenWidth * 0.04),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.025,
          vertical: context.screenHeight * 0.0125,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Collections',
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
            ...[
              {'collection': 'Safety Tokens🤩', 'description': '4 Tokens'},
              {'collection': 'Avatar NFT', 'description': '8 Tokens'},
              {'collection': 'Cute NFTs 🐣', 'description': '8 NFTs'},
            ].map((type) => ListTile(
                  title: Text(
                    type['collection']!,
                    style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    type['description']!,
                    style: context.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  trailing: Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      side: BorderSide(
                        width: 0.5,
                        style: BorderStyle.solid,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                      value: state.collectionType == type['collection']!,
                      shape: const CircleBorder(),
                      visualDensity: VisualDensity.compact,
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue;
                        }
                        return Colors.white;
                      }),
                      checkColor: Colors.white,
                      onChanged: (bool? value) {
                        if (value == true) {
                          ref
                              .read(watchlistControllerProvider.notifier)
                              .setCollectionType(type['collection']!);
                        }
                      },
                    ),
                  ),
                  onTap: () {
                    ref
                        .read(watchlistControllerProvider.notifier)
                        .setCollectionType(type['collection']!);
                  },
                )),
            SizedBox(height: context.screenHeight * 0.0125),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
              height: context.screenHeight * 0.065,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFF4F4F6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(PhosphorIconsFill.plusCircle),
                  SizedBox(width: context.screenWidth * 0.025),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const NewCollectionWidget(),
                        );
                      },
                      child: TextField(
                        enabled: false,
                        style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Create New Collection',
                          hintStyle: context.titleMedium?.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.025),
            ActiveButton(
              label: 'Add to Watchlist',
              onTap: () {
                Navigator.pop(context);
              },
              active: true,
              size: ButtonSize.large,
            ),
          ],
        ),
      ),
    );
  }
}