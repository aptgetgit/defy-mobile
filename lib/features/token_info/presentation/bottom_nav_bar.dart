import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.11, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/aptos-logo.png',
                height: context.screenHeight * 0.0375, 
              ),
              SizedBox(width: context.screenWidth * 0.02), 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style: context.labelSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    '69 APT',
                    style: context.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: context.screenHeight * 0.0625,
                width: context.screenWidth * 0.3, 
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Buy',
                    style: context.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.screenWidth * 0.02), 
              Container(
                height: context.screenHeight * 0.0375,
                width: context.screenHeight * 0.0375, 
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(PhosphorIconsBold.dotsThreeVertical),
              ),
            ],
          ),
        ],
      ),
    );
  }
}