import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../bin/custom_slider_thumb_circle.dart';

class VaultReturnCalculator extends StatefulWidget {
  const VaultReturnCalculator({Key? key}) : super(key: key);

  @override
  State<VaultReturnCalculator> createState() => _VaultReturnCalculatorState();
}

class _VaultReturnCalculatorState extends State<VaultReturnCalculator> {
  String returnType = "One Time";
  final List<String> returnTypes = ["One Time", "Recurring"];
  String returnTime = "1M";
  final List<String> returnTimes = ["1M", "3M", "6M", "1Y", "ALL"];
  double _value = 40.0;

  void setReturnType(String item) {
    setState(() {
      returnType = item;
    });
  }

  void setReturnTime(String item) {
    setState(() {
      returnTime = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Return Calculator",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(returnTypes.length, (index) {
            final String item = returnTypes[index];
            return Row(
              children: [
                GestureDetector(
                  onTap: () => setReturnType(item),
                  child: Container(
                    decoration: BoxDecoration(
                      color: item == returnType ? AppColors.black : AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: item == returnType ? AppColors.white : AppColors.greyDark,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(24)
              ],
            );
          }),
        ),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "18\$",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Gap(6),
            Text(
              "Invested per month",
              style: TextStyle(fontSize: 16, color: AppColors.greyLight),
            )
          ],
        ),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: SliderComponentShape.noThumb,
                    activeTrackColor: AppColors.blue.withOpacity(1),
                    inactiveTrackColor: const Color(0xffD2E3FC),
                    trackHeight: 6.0,
                    thumbShape: const CustomSliderThumbCircle(
                      thumbRadius: 12,
                      min: 0,
                      max: 100,
                    ),
                    overlayColor: Color(0xffD2E3FC),
                    activeTickMarkColor: AppColors.blue,
                    inactiveTickMarkColor: Color(0xffD2E3FC),
                  ),
                  child: Slider(
                    value: _value,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        const Gap(30),
        Center(
          child: Wrap(
            spacing: 10,
            runSpacing: 8,
            children: List.generate(returnTimes.length, (index) {
              final String item = returnTimes[index];
              return GestureDetector(
                onTap: () => setReturnTime(item),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: item == returnTime ? AppColors.blue : AppColors.greyVeryLight,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: item == returnTime ? AppColors.blue : AppColors.greyDark,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const Gap(30),
        Text(
          "Would have become",
          style: TextStyle(fontSize: 14, color: AppColors.greyLight),
        ),
        const Gap(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\$432.23",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const Gap(4),
            const Icon(
              PhosphorIconsFill.caretUp,
              size: 24,
              color: AppColors.textGreen,
            ),
            const Gap(2),
            Text(
              "2.12%",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textGreen,
              ),
            ),
          ],
        )
      ],
    );
  }
}