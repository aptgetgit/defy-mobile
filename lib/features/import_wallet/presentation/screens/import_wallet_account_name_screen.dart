import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../common/presentation/widgets/black_button.dart';

class ImportWalletAccountNameScreen extends ConsumerStatefulWidget {
  const ImportWalletAccountNameScreen({
    required this.accountName,
    required this.onAccountNameUpdated,
    required this.onContinue,
    required this.onSkip,
    super.key,
  });
  final String accountName;
  final void Function(String) onAccountNameUpdated;
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ImportWalletAccountNameScreenState();
      
        @override
        void debugFillProperties(DiagnosticPropertiesBuilder properties) {
          super.debugFillProperties(properties);
          properties..add(StringProperty('accountName', accountName))
          ..add(ObjectFlagProperty<void Function(String p1)>.has('onAccountNameUpdated', onAccountNameUpdated))
          ..add(ObjectFlagProperty<VoidCallback>.has('onContinue', onContinue))
          ..add(ObjectFlagProperty<VoidCallback>.has('onSkip', onSkip));
        }
}

class ImportWalletAccountNameScreenState
    extends ConsumerState<ImportWalletAccountNameScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isNameEntered = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller
      ..text = widget.accountName
      ..addListener(_onTextChanged);
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller..removeListener(_onTextChanged)
    ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final bool nameEntered = _controller.text.trim().isNotEmpty;
    if (nameEntered != _isNameEntered) {
      setState(() {
        _isNameEntered = nameEntered;
      });
    }
    widget.onAccountNameUpdated(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double topPosition = 100 - (keyboardHeight > 0 ? 70 : 0);

    final bool showSkipForNow =
        !_isNameEntered && !_focusNode.hasFocus && keyboardHeight == 0;

    return Padding(
      padding: EdgeInsets.zero,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Name Your Wallet',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Ex : Business, Personal, etc',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyLight,
                  ),
                ),
                const Spacer(),
                if (showSkipForNow)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        widget

                            .onSkip();
                      },
                      child: const Text(
                        'Skip for now',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                BlackButtonXL(
                  onClick: _isNameEntered ? widget.onContinue : () {},
                  title: 'Continue',
                  horizontalPadding: false,
                  color: _isNameEntered ? Colors.black : Colors.grey,
                ).animate().scale(),
              ],
            ),
          ),
          Positioned(
            right: -100,
            top: topPosition,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: AppColors.blue,
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/wallet-creation-wallet-background-wallet-component.png',
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.greyDark.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 110, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          child: TextField(
                            cursorHeight: 16,
                            cursorWidth: 1,
                            cursorColor: AppColors.white,
                            controller: _controller,
                            focusNode: _focusNode,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const Text(
                          'Wallet Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
