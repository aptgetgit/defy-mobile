import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/error/exception_with_stack_trace.dart';
import '../../../../shared/blockchain/account/domain/entities/account_address.dart';
import '../../../../shared/blockchain/account/domain/entities/aptos_derivation_path.dart';
import '../../../../shared/blockchain/account/domain/usecases/get_account_mnemonic_usecase.dart';
import '../../../../shared/blockchain/account/domain/usecases/get_account_private_key_usecase.dart';
import '../../../../shared/blockchain/account/presentation/providers/usecase_provider.dart';
import '../../../common/presentation/widgets/black_button.dart';

class WalletSettingsSecurityScreen extends ConsumerStatefulWidget {
  const WalletSettingsSecurityScreen({required this.accountAddress, super.key});
  final AccountAddress accountAddress;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletSettingsSecurityScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<AccountAddress>('accountAddress', accountAddress),
    );
  }
}

class _WalletSettingsSecurityScreenState
    extends ConsumerState<WalletSettingsSecurityScreen> {
  void _showCustomToast(BuildContext context) {
    final OverlayState overlay = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 84,
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.divider,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text(
              '😉 Copied to Clipboard',
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future<void>.delayed(const Duration(seconds: 2), overlayEntry.remove);
  }

  Future<void> _revealSeedPhrase(BuildContext context, WidgetRef ref) async {
    try {
      final GetAccountMnemonicUseCase getAccountMnemonicUseCase =
          ref.watch(getAccountMnemonicUseCaseProvider);
      final Either<ExceptionWithStackTrace, (String, AptosDerivationPath)>
          result = await getAccountMnemonicUseCase.call(
        accountAddress: widget.accountAddress,
      );

      await result.fold(
        (ExceptionWithStackTrace exception) async {
          if (!mounted) {
            return;
          }
          await showDialog<void>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: Text(exception.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        ((String, AptosDerivationPath) data) async {
          // Handle the success case
          final (String mnemonic, AptosDerivationPath derivationPath) = data;

          if (!mounted) {
            return;
          }

          final List<String> words = mnemonic.split(' ');

          await showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text(
                        'Seed Phrase',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(PhosphorIconsBold.x),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Do not share this with anyone',
                    style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: words.map(_buildWordChip).toList(),
                    ),
                  ),
                  const SizedBox(height: 60),
                  BlackButtonXL(
                    onClick: () {
                      Clipboard.setData(ClipboardData(text: mnemonic));
                      _showCustomToast(context);
                    },
                    title: 'Copy Seed Phrase',
                    margin: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          );
        },
      );
    } on Exception catch (e) {
      if (!mounted) {
        return;
      }
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildWordChip(String word) => Animate(
        effects: <Effect<dynamic>>[
          FadeEffect(duration: 300.ms),
          ScaleEffect(duration: 300.ms),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                word,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );

  Future<void> _revealPrivateKey(BuildContext context, WidgetRef ref) async {
    try {
      final GetAccountPrivateKeyUseCase getAccountPrivateKeyUseCase =
          ref.watch(getAccountPrivateKeyUseCaseProvider);
      final Either<ExceptionWithStackTrace, Uint8List> result =
          await getAccountPrivateKeyUseCase.call(
        accountAddress: widget.accountAddress,
      );

      final Uint8List privateKeyBytes = await result.fold(
        (ExceptionWithStackTrace exception) async {
          throw Exception('An error occurred: $exception');
        },
        (Uint8List privateKey) async => privateKey,
      );

      if (!mounted) {
        return;
      }
      final String privateKeyHex =
          '0x${privateKeyBytes.map((int byte) => byte.toRadixString(16).padLeft(2, '0')).join()}';

      await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    'Private Key',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(PhosphorIconsBold.x),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Do not share this with anyone',
                style: TextStyle(fontSize: 14, color: AppColors.greyLight),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.greyVeryLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  privateKeyHex,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              BlackButtonXL(
                onClick: () {
                  Clipboard.setData(ClipboardData(text: privateKeyHex));
                  _showCustomToast(
                    context,
                  );
                },
                title: 'Copy Private Key',
                margin: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      if (!mounted) {
        return;
      }
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(PhosphorIconsRegular.caretLeft),
          ),
          centerTitle: true,
          title: const Text('Security'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(PhosphorIconsRegular.gear),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Icon(
                    PhosphorIconsRegular.lockOpen,
                    color: AppColors.greyLight,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Manage keys/seed phrase',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyLight,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: AppColors.divider,
                thickness: 3,
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => _revealPrivateKey(context, ref),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: <Widget>[
                      Text(
                        'Reveal Key',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        PhosphorIconsFill.eyeSlash,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async => _revealSeedPhrase(context, ref),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.greyVeryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: <Widget>[
                      Text(
                        'Reveal Seed Phrase',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        PhosphorIconsFill.eyeSlash,
                        color: AppColors.greyLight,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      );
}
