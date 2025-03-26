import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../config/theme/colors.dart';
import '../providers/receive_page_provider.dart';
import '../providers/selected_wallet_option.dart';
import '../widgets/share_sheet.dart';
import 'receive_flow_screen.dart';

class ReceiveScreen extends ConsumerStatefulWidget {
  const ReceiveScreen({super.key});

  @override
  ConsumerState<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends ConsumerState<ReceiveScreen> {
  final String walletAddress = '0xWalletAddress';
  bool _showCopiedMessage = false;
  
  @override
  void initState() {
    super.initState();
    // No need to initialize _selectedWallet here since we use the provider
  }

  @override
  Widget build(BuildContext context) {
    // Get the selected wallet and available wallets from providers
    final Wallet selectedWallet = ref.watch(selectedWalletProvider);
    ref.watch(availableWalletsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive', style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(PhosphorIconsBold.caretLeft, size: 24.sp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: <Widget>[
              Gap(90.h),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      border: Border.all(
                        width: 10.w,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: QrImageView( 
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.all(10.w),
                      data: walletAddress,
                      size: 280.w,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(99.w, 99.h),
                      ),
                      embeddedImage:
                          const AssetImage('assets/icons/qr-logo.png'),
                    ),
                  ),
                ],
              ),
              Gap(21.h),
              //Wallet Option Container
              GestureDetector(
                onTap: () {
                  _showWalletBottomSheet(context);
                },
                child: Container(
                  width: 131.w,
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 217, 217, 217),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        selectedWallet.imagePath, // Use selected wallet from provider
                        width: 24.w,
                        height: 24.h,
                      ),
                      Gap(7.w),
                      Text(
                        selectedWallet.name, // Use selected wallet from provider
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      Gap(5.w),
                      Center(
                        child: Icon(
                          PhosphorIconsRegular.caretDown,
                          size: 16.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(48.h),
              //Address Container
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(14.w, 12.h, 10.w, 12.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (_showCopiedMessage) Text(
                        'Address copied to clipboard',
                        style: TextStyle(
                          fontSize: 16.sp, 
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ) else Text(
                        'Address : 0x31ff....9212dh',
                        style: TextStyle(fontSize: 16.sp, color: AppColors.greyLight),
                        textAlign: TextAlign.start,
                      ),
                      if (_showCopiedMessage) Center(
                        child: Icon(
                          PhosphorIconsFill.checkCircle,
                          color: AppColors.green,
                          size: 30.sp,
                        ),
                      ) else GestureDetector(
                        onTap: _copyAddressToClipboard,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColors.black,
                          child: Center(
                            child: Icon(
                              PhosphorIconsBold.copySimple,
                              color: AppColors.white,
                              size: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Bottom Row
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FilledButton(
                      onPressed: () {
                        Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const ReceiveFlowScreen(),
                        ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        fixedSize: Size(164.w, 56.h),
                      ),
                      child: Text(
                        'Request',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Gap(14.w),
                    FilledButton(
                      onPressed: () => _showShareBottomSheet(context),
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        fixedSize: Size(164.w, 56.h),
                      ),
                      child: Text(
                        'Share',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showWalletBottomSheet(BuildContext context) {
    final Wallet selectedWallet = ref.read(selectedWalletProvider);
    final List<Wallet> wallets = ref.read(availableWalletsProvider);
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Padding(
        // Updated padding to match balance sheet
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 8,
                // Updated border radius to match balance sheet
                borderRadius: BorderRadius.circular(32.r),
                color: Colors.white,
                child: Padding(
                  // Updated padding to match balance sheet
                  padding: EdgeInsets.only(bottom: 22.h, top: 22.h, left: 26.w, right: 26.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Title - Updated font and spacing
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Choose wallet',
                            // Updated font size and weight to match balance sheet
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              PhosphorIconsBold.x,
                              size: 22.sp, // Updated size
                              color: AppColors.black, // Updated color to match
                            ),
                          ),
                        ],
                      ),
                      // Updated gap to match balance sheet
                      Gap(16.h),
                      
                      // Wallet options - unchanged functionality but updated spacing
                      ...List.generate(
                        wallets.length,
                        (int index) {
                          // Add gap between items
                          if (index > 0) {
                            return Column(
                              children: [
                                Gap(16.h), // Added consistent spacing
                                _buildWalletOption(
                                  wallet: wallets[index],
                                  isSelected: selectedWallet.name == wallets[index].name,
                                  onTap: () {
                                    ref.read(selectedWalletProvider.notifier).selectWallet(wallets[index]);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          } else {
                            return _buildWalletOption(
                              wallet: wallets[index],
                              isSelected: selectedWallet.name == wallets[index].name,
                              onTap: () {
                                ref.read(selectedWalletProvider.notifier).selectWallet(wallets[index]);
                                Navigator.pop(context);
                              },
                            );
                          }
                        },
                      ),
                      
                      // Add confirm button with updated styling
                      Gap(22.h), // Updated spacing before button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(44.r),
                          ),
                          backgroundColor: AppColors.blue,
                          minimumSize: Size(double.infinity, 54.h),
                        ),
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: AppColors.white, fontSize: 16.sp),
                        ),
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

  // Updated wallet option builder that takes a Wallet object and onTap callback
  Widget _buildWalletOption({
    required Wallet wallet,
    required bool isSelected,
    required VoidCallback onTap,
  }) => ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.zero,
      title: Text(
        wallet.name,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        wallet.balance,
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color.fromARGB(255, 100, 109, 128),
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Image.asset(wallet.imagePath, width: 36.w, height: 36.h),
      trailing: isSelected
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                  'Selected',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          )
          : null,
      onTap: onTap, // Use the provided callback
    );

  // Function to copy address to clipboard
  void _copyAddressToClipboard() {
    const String walletAddress = '0x0'; // Or get the actual address
    Clipboard.setData(const ClipboardData(text: walletAddress));
    
    // Set state to show copied confirmation
    setState(() {
      _showCopiedMessage = true;
    });
    
    // Reset after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showCopiedMessage = false;
        });
      }
    });
  }

  // Function to show the share bottom sheet
  void _showShareBottomSheet(BuildContext context) {
    ref.watch(receiveProvider);
    const String qrData = '0xWalletAddress';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 24.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Share this page',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(PhosphorIconsRegular.x, size: 24.sp),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
              child: CustomQrShareWidget(qrData: qrData),
            ),
            Gap(24.h),
            // Share Options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Row(
                  children: <Widget>[
                    _buildShareOption(
                      icon: PhosphorIconsRegular.downloadSimple,
                      label: 'Save',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      icon: PhosphorIconsRegular.clipboard,
                      label: 'Copy',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      imagePath: 'assets/icons/whatsapp.png',
                      label: 'Whatsapp',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      imagePath: 'assets/icons/telegram.png',
                      label: 'Telegram',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      imagePath: 'assets/icons/x.png',
                      label: 'X',
                      onPressed: () {},
                    ),
                    Gap(30.w),
                    _buildShareOption(
                      icon: PhosphorIconsFill.dotsThreeOutline,
                      label: 'More',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Gap(24.h),
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
  }) =>
      Column(
        children: <Widget>[
          CircleAvatar(
            radius: 24.r,
            backgroundColor: Colors.grey.shade200,
            child: ClipOval(
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      icon,
                      size: 24.sp,
                      color: Colors.black,
                    ),
            ),
          ),
          Gap(8.h),
          Text(
            label,
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      );
}
