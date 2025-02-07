import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final String title;
  const BlackButton({super.key, this.title = "Try Now"});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(45)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class BlackButtonXL extends StatelessWidget {
  final String title;
  final Function onClick;
  const BlackButtonXL(
      {super.key, this.title = "Try Now", required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: AppColors.black, borderRadius: BorderRadius.circular(45)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}