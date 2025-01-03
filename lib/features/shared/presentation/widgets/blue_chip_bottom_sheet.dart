import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlueChipBottomSheet extends ConsumerStatefulWidget {
  const BlueChipBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlueChipBottomSheetState();
}

class _BlueChipBottomSheetState extends ConsumerState<BlueChipBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}