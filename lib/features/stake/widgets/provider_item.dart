// provider_item.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProviderItem extends StatelessWidget {

  const ProviderItem({
    super.key,
    required this.name,
    required this.percentage,
    required this.imagePath,
    this.isLocked = false,
    this.isLiquid = false,
    this.onTap,
  });
  final String name;
  final String percentage;
  final String imagePath;
  final bool isLocked;
  final bool isLiquid;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: Image.asset(imagePath).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  if (isLocked) ...<Widget>[
                    const Text(
                      'Locked',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                  if (isLiquid) ...<Widget>[
                    const Text(
                      'Liquid',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
            Text(
              percentage,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),
  );
}
