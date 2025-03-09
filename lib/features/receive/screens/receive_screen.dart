import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../../../app/routes/router.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  final String walletAddress = '0xWalletAddress';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Receive'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(PhosphorIconsBold.caretLeft),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              const Gap(30),
              const Text(
                'Allan Jerrold',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const Text(
                '@allan_j',
                style: TextStyle(fontSize: 14, color: AppColors.greyLight),
              ),
              const Gap(20),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  QrImageView( 
                    data: walletAddress,
                    size: 245,
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(99, 99),
                    ),
                    embeddedImage:
                        const AssetImage('assets/images/avatar-7.png'),
                  ),
                ],
              ),
              const Gap(15),
              GestureDetector(
                onTap: () {
                  _showWalletBottomSheet(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/star-struck.png',
                      width: 24,
                      height: 24,
                    ),
                    const Gap(7),
                    const Text(
                      'Business',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyDark,
                      ),
                    ),
                    const Gap(5),
                    const Icon(
                      PhosphorIconsRegular.caretDown,
                      size: 16,
                      color: AppColors.greyDark,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Bottom Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Left Icon (Copy)
                  IconButton(
                    icon: const Icon(
                      PhosphorIconsRegular.copy,
                      size: 32,
                      color: AppColors.greyLight,
                    ),
                    onPressed: () {
                      _copyAddressToClipboard(context);
                    },
                  ),
                  // Center Button (Request)
                  FilledButton(
                    onPressed: () => const ReceiveSelectScreenRoute().push(context),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      minimumSize: const Size(239, 56),
                    ),
                    child: const Text(
                      'Request',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Right Icon (Export)
                  GestureDetector(
                    onTap: () {
                      _showShareBottomSheet(context);
                    },
                    child: const Icon(
                      PhosphorIconsRegular.export,
                      size: 32,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  void _showWalletBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Choose wallet',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              PhosphorIconsBold.x,
                              size: 24,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ],
                      ),
                      const Gap(12),

                      // Wallet Options
                      _buildWalletOption(
                        imagePath: 'assets/icons/star-struck.png',
                        title: 'Business',
                        balance: r'$324.00',
                        isDefault: true,
                      ),
                      _buildWalletOption(
                        imagePath: 'assets/icons/face-blowing-kiss.png',
                        title: 'Savings',
                        balance: r'$60.20',
                      ),
                      _buildWalletOption(
                        imagePath: 'assets/icons/star-struck.png',
                        title: 'Business',
                        balance: r'$324.00',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build wallet option
  Widget _buildWalletOption({
    required String imagePath,
    required String title,
    required String balance,
    bool isDefault = false,
  }) => ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        balance,
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.greyLight,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Image.asset(imagePath, width: 32, height: 32),
      trailing: isDefault
          ? const Text(
              'Default',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.greyLight,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      onTap: () {
        // Handle wallet selection
      },
    );

  // Function to copy address to clipboard
  void _copyAddressToClipboard(BuildContext context) {
    const String walletAddress = '0x0'; // Or get the actual address
    Clipboard.setData(const ClipboardData(text: walletAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Address copied to clipboard',
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: 16,
              ),
            ),
            Gap(6),
            Icon(
              PhosphorIconsFill.checkCircle,
              size: 20,
              color: AppColors.green,
            ),
          ],
        ),
        backgroundColor: AppColors.greyVeryLight,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 80, left: 72, right: 72),
        padding: const EdgeInsets.fromLTRB(16, 8,  10, 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  // Function to show the share bottom sheet
  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 24, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Share this page',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(PhosphorIconsRegular.x, size: 24),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Image.asset(
                'assets/images/share-qr.png',
                width: 380,
                height: 502,
              ),
            ),
            const Gap(24),
            // Share Options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: <Widget>[
                    _buildShareOption(
                      icon: PhosphorIconsRegular.downloadSimple,
                      label: 'Save',
                      onPressed: () {},
                    ),
                    const Gap(30),
                    _buildShareOption(
                      icon: PhosphorIconsRegular.clipboard,
                      label: 'Copy',
                      onPressed: () {},
                    ),
                    const Gap(30),
                    _buildShareOption(
                      imagePath: 'assets/icons/whatsapp.png',
                      label: 'Whatsapp',
                      onPressed: () {},
                    ),
                    const Gap(30),
                    _buildShareOption(
                      imagePath: 'assets/icons/telegram.png',
                      label: 'Telegram',
                      onPressed: () {},
                    ),
                    const Gap(30),
                    _buildShareOption(
                      imagePath: 'assets/icons/x.png',
                      label: 'X',
                      onPressed: () {},
                    ),
                    const Gap(30),
                    _buildShareOption(
                      icon: PhosphorIconsFill.dotsThreeOutline,
                      label: 'More',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  // Helper function to build share option buttons
  Widget _buildShareOption({
    required String label,
    required VoidCallback onPressed,
    IconData? icon,
    String? imagePath,
  }) => Column(
      children: <Widget>[
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade200,
          child: ClipOval(
            child: imagePath != null
                ? Image.asset(
                    imagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    icon,
                    size: 24,
                    color: Colors.black,
                  ),
          ),
        ),
        const Gap(8),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
}
