import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../config/theme/colors.dart';

class ReceiveShareScreen extends StatelessWidget {
  const ReceiveShareScreen({super.key});

  final String walletAddress = '0x1234567890abcdef'; // Wallet address

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  QrImageView( // Use QrImageView
                    data: walletAddress, // The data for the QR code
                    size: 300, // Adjust size as needed
                    embeddedImageStyle: const QrEmbeddedImageStyle( // Style embedded image
                      size: Size(99, 99), // Size of embedded image
                    ),
                    embeddedImage:
                        const AssetImage('assets/images/avatar-7.png'), // Embedded image
                  ),
                ],
              ),
            ),
            const Gap(32),
            const Text(
              'Expires in 24 hours.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Gap(14),
            // Link Display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'defy.app/request/10/maharsipatel',
                    style: TextStyle(fontSize: 16, color: AppColors.greyLight),
                    textAlign: TextAlign.start,
                  ),
                  Icon(
                    PhosphorIconsBold.clipboard,
                    color: AppColors.greyLight,
                    size: 24,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
}
