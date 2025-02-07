import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:defy/config/theme/colors.dart';

class MultiSelectButton extends ConsumerStatefulWidget {
  final int selectedCount;
  final Function() onTap;
  final String item;

  const MultiSelectButton({
    required this.item,
    required this.selectedCount,
    required this.onTap,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MultiSelectButtonState();
}

class _MultiSelectButtonState extends ConsumerState<MultiSelectButton> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: widget.selectedCount == 0
                ? AppColors.black.withOpacity(0.5)
                : AppColors.black,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                        color: widget.selectedCount == 0
                            ? Colors.white
                            : const Color(0xff1f71EE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          widget.selectedCount.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: widget.selectedCount == 0
                                ? AppColors.black
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Select ${widget.item}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Row(),
              ],
            ),
          ),
        ),
      );
}
