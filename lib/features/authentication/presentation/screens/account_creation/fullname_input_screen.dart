// ignore_for_file: depend_on_referenced_packages
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/presentation/providers/account_data_state_provider.dart';
import 'package:defy/features/authentication/presentation/widgets/fading_text.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FullNameInputScreen extends ConsumerStatefulWidget {
  const FullNameInputScreen({super.key, required this.nextPage});

  final Function(int) nextPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FullNameInputScreenState();
}

class _FullNameInputScreenState extends ConsumerState<FullNameInputScreen> {
  TextEditingController controller = TextEditingController();
  bool activeButton = false;
  final formKey = GlobalKey<FormState>();

  void confirm() {
    ref.read(accountDataStateProvider.notifier).setFirstName(controller.text);
    widget.nextPage(1);
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = context.isDarkMode;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(PhosphorIconsBold.identificationCard),
                Gap(8),
                FadingText(
                  text: 'Enter your full name',
                  duration: Duration(milliseconds: 2500),
                ),
              ],
            ),
            const Gap(40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                'Full name',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
            const Gap(3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (name) {
                    if (name.isNotEmpty) {
                      controller.text = name;
                    }
                    bool current = name.isNotEmpty;
                    if (current != activeButton) {
                      setState(() {
                        activeButton = current;
                      });
                    }
                  },
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: darkMode ? AppColors.greyLight : AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    constraints:
                        BoxConstraints.tight(const Size.fromHeight(50)),
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    fillColor: darkMode
                        ? const Color(0xff252525)
                        : const Color(0xfff4f4f6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'This will be displayed as your name for other users',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: darkMode ? const Color(0xff656565) : AppColors.greyLight,
                ),
              ),
            ),
            const Spacer(),
            ActiveButton(
              label: 'Confirm',
              onTap: confirm,
              size: ButtonSize.large,
              active: activeButton,
            )
          ],
        ),
      ),
    );
  }
}
