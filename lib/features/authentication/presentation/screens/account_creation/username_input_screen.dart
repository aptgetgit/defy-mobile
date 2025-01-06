// ignore_for_file: depend_on_referenced_packages
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/button_size_extension.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/core/logging/app_logger.dart';
import 'package:defy/core/providers/credential_manager_provider.dart';
import 'package:defy/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:defy/features/authentication/presentation/helpers/token_expiry_helper.dart';
import 'package:defy/features/authentication/presentation/providers/account_data_state_provider.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_flow_manager.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_state_notifier.dart';
import 'package:defy/features/authentication/presentation/widgets/fading_text.dart';
import 'package:defy/features/shared/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
    register();
  }

  Future<void> register() async {
    final accountDataState = ref.read(accountDataStateProvider);
    final notifier = ref.read(authenticationNotifierProvider.notifier);
    final credentialManager = ref.read(credentialManagerServiceProvider);
    final flowManager = ref.read(authenticationFlowManagerProvider.notifier);

    //get the idToken
    try {
      String? idToken;
      String? provider;
      final loginOption = flowManager.getCompleteLoginOptions();

      //oidc
      if (loginOption is CompleteLoginOptionsWithOIDC) {
        final oidcOption = loginOption;
        idToken = oidcOption.idToken;
        provider = oidcOption.provider;

        //check if idToken is valid
        final isExpired = isTokenExpired(idToken);

        if (isExpired) {
          //asking for auth again
          if (provider == 'google') {
            final googleIdTokenCredential =
                await credentialManager.saveGoogleCredential();
            if (googleIdTokenCredential != null) {
              idToken = googleIdTokenCredential.idToken;
            } else {
              _showErrorSnackBar('Google Sign-Up failed');
            }
          } else if (provider == 'apple') {
            final credential = await SignInWithApple.getAppleIDCredential(
                scopes: [AppleIDAuthorizationScopes.email],
                nonce: "testertagger");
            if (credential.identityToken != null) {
              idToken = credential.identityToken!;
            } else {
              _showErrorSnackBar('Apple Sign-Up failed');
            }
          }
        } else {
          //continuing with login idToken
          await notifier
              .initiateRegistration(InitiateRegistrationOptions.withOIDC(
            username: accountDataState.username,
            displayName: accountDataState.firstName,
          ));
          flowManager.updateRegistrationFlowWithOIDC(
              provider: provider, idToken: idToken);
          await notifier.completeRegistration();
        }
      }
    } on Exception catch (e) {
      AppLogger.debug(e.toString());
    }
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

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
