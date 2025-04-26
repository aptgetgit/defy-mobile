import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        title: Text(
          'Create Token',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.w),
              child: Column(
                children: <Widget>[
                  Gap(8.h),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: width * .3,
                        height: width * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.greyVeryLight2,),
                        child: Icon(
                          PhosphorIconsFill.image,
                          color: AppColors.greyLight,
                          size: 38.sp,
                        ),
                      ),
                      Gap(12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Token image',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(6.h),
                          Text(
                            'Formats: PNGs, JPGs',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                          ),
                          Text(
                            '1024px X 1024px',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyLight,
                            ),
                          ),
                          Text(
                            'Max file size 5mb',
                            style: TextStyle(
                              fontSize: 14.sp,
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(22.h),
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
              padding: EdgeInsets.all(16.w),
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
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            headerTitle,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.greyDark,
            ),
          ),
          Gap(3.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
            height: isDescription ? height * .1 : height * .055,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.greyVeryLight2,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
