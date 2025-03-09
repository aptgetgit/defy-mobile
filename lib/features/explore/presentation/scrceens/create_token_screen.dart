import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../app/routes/router.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/extensions/button_size_extension.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../shared/presentation/widgets/custom_button.dart';

class CreateTokenScreen extends StatefulWidget {
  const CreateTokenScreen({super.key});

  @override
  State<CreateTokenScreen> createState() => _CreateTokenScreenState();
}

class _CreateTokenScreenState extends State<CreateTokenScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = context.screenWidth;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Token',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  const Gap(8),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: width * .3,
                        height: width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.greyVeryLight2,),
                        child: const Icon(PhosphorIconsFill.image,
                            color: AppColors.greyLight, size: 38,),
                      ),
                      const Gap(12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Token image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(6),
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
                        child: const Text(
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
                      isDescription: true,),
                  _buildTextInput(
                      context, 'Twitter Link(Optional)', 'Enter Twitter Link',),
                  _buildTextInput(context, 'Telegram Link(Optional)',
                      'Enter Telegram Link',),
                  _buildTextInput(
                      context, 'Website (Optional)', 'Enter Website',),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ActiveButton(
                label: 'Continue',
                onTap: () {
                  const PumpFunTokenPreviewScreenRoute().push(context);
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
      {bool isDescription = false,}) {
    final double height = context.screenHeight;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            headerTitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.greyDark,
            ),
          ),
          const Gap(3),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            height: isDescription ? height * .1 : height * .055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.greyVeryLight2,
            ),
            child: TextField(
                decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.greyMedium,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
