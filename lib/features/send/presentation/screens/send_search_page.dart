import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../domain/models/user_model.dart';
import '../providers/send_provider.dart';

class SendSearchPage extends ConsumerWidget {
  const SendSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SendScreenProvider sendController = ref.watch(sendScreenProviderProvider.notifier);
    final SendScreenState sendState = ref.watch(sendScreenProviderProvider);
    final List<UserModel> users = <UserModel>[
      UserModel(
        asset: 'assets/images/avatar-6.png',
        userName: 'Allan',
        walletAddress: '0x01',
      ),
      UserModel(
        asset: 'assets/images/avatar-1.png',
        userName: 'Thomas',
        walletAddress: '0x02',
      ),
      UserModel(
        asset: 'assets/images/avatar-2.png',
        userName: 'John',
        walletAddress: '0x03',
      ),
      UserModel(
        asset: 'assets/images/avatar-3.png',
        userName: 'Jane',
        walletAddress: '0x04',
      ),
      UserModel(
        asset: 'assets/images/avatar-4.png',
        userName: 'Ryan',
        walletAddress: '0x05',
      ),
      UserModel(
        asset: 'assets/images/avatar-5.png',
        userName: 'Linda',
        walletAddress: '0x06',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(PhosphorIconsRegular.caretLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Search Users',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Optionally handle search
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.greyVeryLight,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Gap(16),
                    const Text(
                      'To',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextField(
                        cursorHeight: 18,
                        controller: sendState.searchController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Address',
                          hintStyle: TextStyle(
                            color: AppColors.greyLight,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: sendController.pasteFromClipboard,
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                'Paste',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  final UserModel contact = users[index];
                  return ListTile(
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(contact.asset),
                    ),
                    title: Text(
                      contact.userName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      contact.walletAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
