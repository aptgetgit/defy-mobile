import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../domain/models/selectable_item_model.dart';
import '../../domain/models/user_model.dart';
import '../providers/send_provider.dart';
import 'send_asset_selection.dart';

class SendScreen extends ConsumerStatefulWidget {
  const SendScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SendScreenState();
}

class _SendScreenState extends ConsumerState<SendScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;
  bool _isSearchFocused = false;
  List<UserModel> _filteredUsers = <UserModel>[];
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOutCubic,
    );
    _searchFocusNode.addListener(_onFocusChange);
    _filteredUsers = <UserModel>[];
  }

  @override
  void dispose() {
    _expandController.dispose();
    _searchFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isSearchFocused = _searchFocusNode.hasFocus;
    });
  }

  void _performSearch(String query, List<UserModel> users) {
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = users;
      } else {
        _filteredUsers = users
            .where(
              (UserModel user) =>
                  user.userName.toLowerCase().contains(query.toLowerCase()) ||
                  user.walletAddress
                      .toLowerCase()
                      .contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final SendScreenProvider sendController =
        ref.watch(sendScreenProviderProvider.notifier);
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Icon(
            PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
            color: Colors.black,
            size: 20,
          ),
          title: const Text(
            'Send',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildSearchBar(sendState, sendController, users),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _isSearchFocused
                              ? const SizedBox.shrink()
                              : Column(
                                  children: <Widget>[
                                    const SizedBox(height: 12),
                                    _buildWalletTiles(),
                                    const SizedBox(height: 20),
                                    _buildSelfTransferSection(),
                                    const SizedBox(height: 16),
                                    _buildContactsSection(
                                      sendState,
                                      sendController,
                                    ),
                                  ],
                                ),
                        ),
                        _buildRecentSection(
                          _isSearchFocused ? _filteredUsers : users,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(
    SendScreenState sendState,
    SendScreenProvider sendController,
    List<UserModel> users,
  ) =>
      Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: <Widget>[
            const Gap(16),
            const Text(
              'To',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Gap(20),
            Expanded(
              child: TextField(
                focusNode: _searchFocusNode,
                controller: sendState.searchController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Address',
                  hintStyle: TextStyle(
                    color: AppColors.greyLight,
                    fontSize: 16,
                  ),
                  alignLabelWithHint: false,
                  contentPadding: EdgeInsets.only(bottom: 4),
                ),
                textAlignVertical: TextAlignVertical.top,
                onChanged: (String value) {
                  _performSearch(value, users);
                  setState(() {});
                },
              ),
            ),
            GestureDetector(
              onTap: sendController.pasteFromClipboard,
              child: Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Center(
                  child: Text(
                    'Paste',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ),
            const Gap(7),
          ],
        ),
      );

  Widget _buildWalletTiles() => Column(
        children: <Widget>[
          _buildWalletTile(
            icon: PhosphorIconsRegular.scan,
            title: 'Scan QR Code',
            subTitle: 'Tap to Scan QR Address',
            onTap: () {},
            backgroundColor: AppColors.greyVeryLight,
            iconColor: AppColors.greyLight,
          ),
          const Gap(20),
          _buildWalletTile(
            icon: PhosphorIconsRegular.scan,
            title: 'Phone Contacts',
            subTitle: 'Send crypto via phone number',
            backgroundColor: AppColors.greyVeryLight,
            iconColor: AppColors.greyLight,
          ),
        ],
      );
  Widget _buildWalletTilesForSearch() => Column(
        children: <Widget>[
          _buildWalletTile(
            icon: PhosphorIconsRegular.scan,
            title: 'Scan QR Code',
            subTitle: 'Tap to Scan QR Address',
            onTap: () {},
            backgroundColor: AppColors.greyVeryLight,
            iconColor: AppColors.greyLight,
          ),
          const Gap(20),
          _buildWalletTile(
            icon: PhosphorIconsRegular.scan,
            title: 'Phone Contacts',
            subTitle: 'Send crypto via phone number',
            backgroundColor: AppColors.greyVeryLight,
            iconColor: AppColors.greyLight,
          ),
          const Gap(20),
        ],
      );

  Widget _buildWalletTile({
    required IconData icon,
    required String title,
    required String subTitle,
    required Color backgroundColor,
    required Color iconColor,
    VoidCallback? onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: backgroundColor,
              ),
              child: Icon(icon, size: 20, color: iconColor),
            ),
            const Gap(6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(subTitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      );

  Widget _buildSelfTransferSection() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Self Transfer',
            style: TextStyle(
              color: AppColors.greyLight,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(12),
          Divider(thickness: 1.5, height: 1.5, color: Color(0xffF4F4F6)),
        ],
      );

  Widget _buildContactsSection(
    SendScreenState sendState,
    SendScreenProvider sendController,
  ) =>
      Column(
        children: <Widget>[
          _buildRecentContacts(
            context,
            sendState.seeMore,
            sendController.toggleSeeMore,
          ),
          const Gap(16),
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (BuildContext context, Widget? child) => ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: _expandAnimation.value,
                child: child,
              ),
            ),
            child:
                _buildAdditionalContacts(context, sendController.toggleSeeMore),
          ),
        ],
      );

  Widget _buildRecentContacts(
    BuildContext context,
    bool seeMore,
    void Function() toggleSeeMore,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildContactTile(
            context,
            imagePath: 'assets/images/avatar-6.png',
            label: 'Allan',
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<SendAssetSelection<SelectableItem>>(
                  builder: (BuildContext context) =>
                      SendAssetSelection<SelectableItem>(
                    isMulti: false,
                    selectedToItems: <SelectableItem>[
                      UserModel(
                        asset: 'assets/images/avatar-6.png',
                        userName: 'Allan',
                        walletAddress: '0x01',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          _buildContactTile(
            context,
            imagePath: 'assets/images/star-struck.gif',
            label: 'Business',
            backgroundColor: const Color(0xff2071EE),
          ),
          _buildContactTile(
            context,
            imagePath: 'assets/images/avatar-7.png',
            label: 'Business',
          ),
          if (!seeMore) _buildSeeMoreTile(context, toggleSeeMore),
          if (seeMore)
            _buildContactTile(
              context,
              imagePath: 'assets/images/avatar-5.png',
              label: 'Ryan',
            ),
        ],
      );

  Widget _buildAdditionalContacts(
    BuildContext context,
    void Function() toggleSeeMore,
  ) =>
      Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildContactTile(
                context,
                imagePath: 'assets/images/avatar-1.png',
                label: 'Jane ',
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute<SendAssetSelection<SelectableItem>>(
                      builder: (BuildContext context) =>
                          SendAssetSelection<SelectableItem>(
                        isMulti: false,
                        selectedToItems: <SelectableItem>[
                          UserModel(
                            asset: 'assets/images/avatar-1.png',
                            userName: 'Jane',
                            walletAddress: '0x01',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              _buildContactTile(
                context,
                imagePath: 'assets/images/star-struck.gif',
                label: 'Family',
                backgroundColor: const Color(0xffFA7AA2),
              ),
              _buildContactTile(
                context,
                imagePath: 'assets/images/avatar-3.png',
                label: 'Thomas',
              ),
              _buildContactTile(
                context,
                imagePath: 'assets/images/avatar-4.png',
                label: 'Chris',
              ),
            ],
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildContactTile(
                context,
                imagePath: 'assets/images/avatar-5.png',
                label: 'Ryan',
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute<SendAssetSelection<SelectableItem>>(
                      builder: (BuildContext context) =>
                          SendAssetSelection<SelectableItem>(
                        isMulti: false,
                        selectedToItems: <SelectableItem>[
                          UserModel(
                            asset: 'assets/images/avatar-5.png',
                            userName: 'Ryan',
                            walletAddress: '0x01',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              _buildSeeLessTile(context, toggleSeeMore),
              SizedBox(width: MediaQuery.of(context).size.width * 0.135),
              SizedBox(width: MediaQuery.of(context).size.width * 0.135),
            ],
          ),
        ],
      );

  Widget _buildSeeMoreTile(
    BuildContext context,
    void Function() toggleSeeMore,
  ) =>
      GestureDetector(
        onTap: () {
          toggleSeeMore();
          _expandController.forward();
        },
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.12,
              width: MediaQuery.of(context).size.width * 0.12,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xffD2E3FC),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(PhosphorIcons.arrowCircleDown(), size: 30),
            ),
            const Gap(6),
            const Text(
              'See More',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ).animate().slideY(
            begin: 0.075,
            end: 0,
            duration: 300.ms,
            curve: Curves.easeInOutCubic,
          );

  Widget _buildSeeLessTile(
    BuildContext context,
    void Function() toggleSeeMore,
  ) =>
      GestureDetector(
        onTap: () {
          toggleSeeMore();
          _expandController.reverse();
        },
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.12,
              width: MediaQuery.of(context).size.width * 0.12,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xffFFD2D2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                PhosphorIcons.arrowCircleUp(),
                size: 30,
                color: const Color(0xffFF4D4D),
              ),
            ),
            const Gap(6),
            const Text(
              'See Less',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ).animate().slideY(
            begin: 0,
            end: -0.075,
            duration: 300.ms,
            curve: Curves.easeInOutCubic,
          );

  Widget _buildContactTile(
    BuildContext context, {
    required String imagePath,
    required String label,
    VoidCallback? onTap,
    Color backgroundColor = Colors.transparent,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.width * 0.12,
              padding: backgroundColor == Colors.transparent
                  ? null
                  : const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: backgroundColor == Colors.transparent
                    ? null
                    : backgroundColor,
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const Gap(6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      );

  Widget _buildRecentSection(List<UserModel> users) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (_isSearchFocused) const SizedBox(height: 20),
          if (_isSearchFocused &&
              ref
                  .read(sendScreenProviderProvider)
                  .searchController
                  .text
                  .isEmpty)
            _buildWalletTilesForSearch(),
          const Text(
            'Recent',
            style: TextStyle(color: AppColors.greyLight),
          ),
          const Gap(12),
          const Divider(
            thickness: 1.5,
            height: 1.5,
            color: Color(0xffF4F4F6),
          ),
          const Gap(16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _isSearchFocused ? _filteredUsers.length : users.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              final UserModel contact =
                  _isSearchFocused ? _filteredUsers[index] : users[index];
              return ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                visualDensity: const VisualDensity(vertical: -4),
                onTap: () {},
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
        ],
      );
}
