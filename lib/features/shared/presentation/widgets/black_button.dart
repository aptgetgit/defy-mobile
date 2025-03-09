import 'package:flutter/material.dart';

import '../../../../config/theme/colors.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({super.key, this.title = 'Try Now'});
  final String title;

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(45),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white,),
          ),
        ),
      ),
    );
}

class BlackButtonXL extends StatelessWidget {
  const BlackButtonXL(
      {super.key, this.title = 'Try Now', required this.onClick,});
  final String title;
  final Function onClick;

  @override
  Widget build(BuildContext context) => Align(
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: AppColors.black, borderRadius: BorderRadius.circular(45),),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,),
              ),
            ),
          ),
        ),
      ),
    );
}
