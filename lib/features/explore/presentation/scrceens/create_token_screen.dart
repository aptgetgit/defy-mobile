import 'package:defy/app/routes/router.dart';
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';

import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CreateTokenScreen extends StatefulWidget {
  const CreateTokenScreen({super.key});

  @override
  State<CreateTokenScreen> createState() => _CreateTokenScreenState();
}

class _CreateTokenScreenState extends State<CreateTokenScreen> {
  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Token',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const Gap(8),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: width * .3,
                        height: width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greyVeryLight2),
                        child: Icon(PhosphorIconsFill.image,
                            color: AppColors.greyLight, size: 38),
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Token image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(6),
                          Text(
                            'Formats: PNGs, JPGs',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                          ),
                          Text(
                            '1024px X 1024px',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                          ),
                          Text(
                            'Max file size 5mb',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(22),
                  _buildTextInput(context, 'Token Name', 'Enter Token Name'),
                  _buildTextInput(context, 'Symbol', 'Enter Symbol'),
                  _buildTextInput(context, 'Description', 'Enter Description',
                      isDescription: true),
                  _buildTextInput(
                      context, 'Twitter Link(Optional)', 'Enter Twitter Link'),
                  _buildTextInput(context, 'Telegram Link(Optional)',
                      'Enter Telegram Link'),
                  _buildTextInput(
                      context, 'Website (Optional)', 'Enter Website'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ActiveButton(
                label: 'Continue',
                onTap: () {
                  PumpFunTokenPreviewScreenRoute().push(context);
                },
                size: ButtonSize.large,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextInput(
      BuildContext context, String headerTitle, String hintText,
      {bool isDescription = false}) {
    final height = context.screenHeight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerTitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.greyDark,
            ),
          ),
          const Gap(3),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            height: isDescription ? height * .1 : height * .055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.greyVeryLight2,
            ),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.greyMedium,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
