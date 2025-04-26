import 'package:defy/features/send/presentation/providers/send_provider.dart';
import 'package:defy/features/send/presentation/widgets/send/multi_select_button.dart';
import 'package:defy/features/send/presentation/widgets/send/multi_select_menu_button.dart';
import 'package:defy/features/send/presentation/widgets/send/send_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SendToFriendsScreen extends ConsumerWidget {
  const SendToFriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendController = ref.watch(sendToFriendProvider.notifier);
    final sendState = ref.watch(sendToFriendProvider);

    final friends = [
      Friend(avatar: null, friendName: 'Maharsi Patel', defyId: 'maharsi.avex'),
      Friend(avatar: null, friendName: 'Allan Jerrold', defyId: 'allan.avex'),
      Friend(
          avatar: 'assets/images/avatar-6.png',
          friendName: 'Allan Jerrold',
          defyId: 'allan.avex'),
      Friend(
          avatar: 'assets/images/avatar-6.png',
          friendName: 'Allan Jerrold',
          defyId: 'allan.avex'),
      Friend(
          avatar: 'assets/images/avatar-6.png',
          friendName: 'Allan Jerrold',
          defyId: 'allan.avex'),
    ];

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (sendState.isSelectionMode) {
                    sendController.resetSelection();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Icon(
                  PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                  color: Colors.black,
                  size: 18,
                ),
              ),
              const Text(
                "Send",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Icon(
                PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
                color: Colors.black,
                size: 21,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(60)),
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        const Text(
                          "To",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Enter Address",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(60)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Center(
                                child: Text(
                                  "Paste",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.clockClockwise(PhosphorIconsStyle.bold),
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Your Defy Frens",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    Icon(
                      PhosphorIcons.magnifyingGlass(PhosphorIconsStyle.bold),
                      color: Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 20),
                    MultiSelectMenuButton(
                        onTap: () =>
                            sendController.toggleSelectionMode(friends.length),
                        isSelectionMode: sendState.isSelectionMode),
                    const SizedBox(width: 10)
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(
                  thickness: 1.5,
                  height: 1.5,
                  color: Color(0xffF4F4F6),
                ),
                const SizedBox(height: 12),
                ...friends.asMap().entries.map((entry) {
                  final index = entry.key;
                  final friend = entry.value;
                  return SendTile(
                    asset: friend.avatar,
                    heading: friend.friendName,
                    subHeading: friend.defyId,
                    isSelectionMode: sendState.isSelectionMode,
                    tileSelected: sendState.tileSelected.length > index
                        ? sendState.tileSelected[index]
                        : false,
                    selectTile: () => sendController.selectTile(index, friend),
                  );
                }),
                const Spacer(),
                if (sendState.isSelectionMode)
                  MultiSelectButton(
                    item: 'Friends',
                    selectedCount: sendState.selectedCount,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/nextScreen',
                        arguments: sendState.selectedToItems,
                      );
                    },
                  ),
              ],
            ),
          ),
        ));
  }
}
