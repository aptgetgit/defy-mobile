// ignore_for_file: depend_on_referenced_packages
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/presentation/providers/account_data_state_provider.dart';
import 'package:defy/features/authentication/presentation/widgets/fading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserNameInputScreen extends ConsumerStatefulWidget {
  const UserNameInputScreen({super.key, required this.nextPage});

  final Function(int) nextPage;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserNameInputScreenState();
}

class _UserNameInputScreenState extends ConsumerState<UserNameInputScreen> {
  TextEditingController controller = TextEditingController();
  bool activeButton = false;
  bool isUsernameAvailable = false; //provider
  bool isUsernameTaken = false; //provider
  final formKey = GlobalKey<FormState>();

  void confirm() {
    ref.read(accountDataStateProvider.notifier).setUsername(controller.text);
    signupUser();
    widget.nextPage(1);
  }

  void signupUser() async {
    // final accountData = ref.read(accountDataStateProvider);
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
                Icon(PhosphorIconsRegular.at),
                Gap(8),
                FadingText(
                  text: 'Create your Username',
                  duration: Duration(milliseconds: 2500),
                ),
              ],
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                  isUsernameAvailable
                      ? const Row(
                          children: [
                            Icon(
                              PhosphorIconsFill.checkCircle,
                              color: Colors.green,
                            ),
                            Gap(3),
                            Text(
                              'Available',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            ),
                            Gap(3),
                          ],
                        )
                      : const SizedBox(),
                  isUsernameTaken
                      ? const Row(
                          children: [
                            Icon(
                              PhosphorIconsBold.x,
                              color: Colors.red,
                              size: 22,
                            ),
                            Gap(4),
                            Text(
                              'Already available',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                  fontSize: 13),
                            ),
                            Gap(3),
                          ],
                        )
                      : const SizedBox()
                ],
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
                  onChanged: (username) {
                    if (username.isNotEmpty) {
                      controller.text = username;
                    }
                    bool current = username.isNotEmpty;
                    if (current != activeButton) {
                      setState(() {
                        activeButton = current;
                      });
                    }
                  },
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: darkMode ? AppColors.greyLight : AppColors.black,
                    fontWeight: FontWeight.w600,
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
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment:
                  isUsernameTaken ? Alignment.bottomLeft : Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              child: Text(
                isUsernameTaken
                    ? '${controller.text} is already taken.Try something else'
                    : 'Username should not contain special characters',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      isUsernameTaken ? FontWeight.w500 : FontWeight.w600,
                  color: isUsernameTaken
                      ? Colors.red
                      : darkMode
                          ? const Color(0xff656565)
                          : AppColors.greyLight,
                ),
              ),
            ),
            const Spacer(),
            // ActiveButton(
            //   label: 'Confirm',
            //   onTap: confirm,
            //   size: ButtonSize.large,
            //   active: activeButton,
            // )
          ],
        ),
      ),
    );
  }
}
