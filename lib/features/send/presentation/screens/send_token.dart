import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

import '../../../../config/theme/colors.dart';
import '../../domain/models/selectable_item_model.dart';
import '../../domain/models/token_model.dart';
import '../../domain/models/user_model.dart';
import '../providers/send_provider.dart';
import '../widgets/send/swipe_to_send_button.dart';

class SendToken<T extends SelectableItem> extends StatefulWidget {
  final List<T> selectedToItems;
  final Token selectedToken;

  const SendToken({
    Key? key,
    required this.selectedToItems,
    required this.selectedToken,
  }) : super(key: key);

  @override
  State<SendToken> createState() => _SendTokenState();
}

class _SendTokenState extends State<SendToken> {
  bool _isSwapped = false;
  String _amount = r'$0';
  String _amount2 = '0';

  void _swap() {
    setState(() {
      _isSwapped = !_isSwapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              const Gap(20),
              _buildAppBar(),
              const Gap(20),
              _buildRecipientBar(),
              const Gap(40),
              _buildAmountDisplay(width),
              const Spacer(),
              _buildTokenSelector(),
              const Gap(12),
              _buildNumpad(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomSwipeButton(onSwipeCompleted: _continueToLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
              color: Colors.black,
              size: 24,
            ),
          ),
          const Text(
            'Send',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          const SizedBox.shrink(),
        ],
      );

  Widget _buildRecipientBar() => Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: <Widget>[
            const Gap(16),
            const Text(
              'To',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Gap(20),
            _buildRecipientAvatars(),
            const Gap(4),
            Text(
              _buildSelectedText()!,
              style: const TextStyle(fontSize: 16, color: AppColors.greyLight),
            ),
            const Spacer(),
            _buildAddRecipientButton(),
          ],
        ),
      );

  Widget _buildRecipientAvatars() => RowSuper(
        innerDistance: -24,
        children: widget.selectedToItems.map((SelectableItem item) {
          String assetPath = '';
          if (item is UserModel) {
            assetPath = item.asset;
          } else if (item is Contact)
            assetPath = item.avatar!;
          else if (item is Token)
            assetPath = item.tokenImage!;
          else if (item is Friend)
            assetPath = item.avatar!;
          else if (item is Wallet) assetPath = item.asset;
          return Image(height: 32, width: 32, image: AssetImage(assetPath));
        }).toList(),
      );

  Widget _buildAddRecipientButton() => Padding(
        padding: const EdgeInsets.all(11.0),
        child: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Icon(
              PhosphorIcons.plus(PhosphorIconsStyle.bold),
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      );

  Widget _buildAmountDisplay(double width) => Container(
        height: 180,
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              bottom: _isSwapped ? 0 : 55,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: width * 0.6,
                    height: 100,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: List.generate(_amount.length, (int index) {
                          final String char = _amount[index];
                          return AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              fontFamily: 'SfCompactRounded',
                              fontWeight: _isSwapped
                                  ? FontWeight.w400
                                  : FontWeight.w600,
                              color: _isSwapped
                                  ? const Color(0xff646d80)
                                  : Colors.black,
                              fontSize: _isSwapped
                                  ? 14
                                  : (72 - (_amount.length * 3))
                                      .clamp(24.0, 72.0)
                                      .toDouble(),
                            ),
                            child: Text(char),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              bottom: !_isSwapped ? 0 : 55,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: width * 0.6,
                    height: 100,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: List.generate(_amount2.length, (int index) {
                          final String char = _amount2[index];
                          return AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 200),
                            style: TextStyle(
                              fontWeight: !_isSwapped
                                  ? FontWeight.w500
                                  : FontWeight.w700,
                              color: !_isSwapped
                                  ? const Color(0xff646d80)
                                  : Colors.black,
                              fontSize: !_isSwapped
                                  ? 14
                                  : (80 - (_amount2.length * 3))
                                      .clamp(24.0, 80.0)
                                      .toDouble(),
                            ),
                            child: Text(char),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 40,
              left: 100,
              right: 0,
              child: GestureDetector(
                onTap: _swap,
                child: AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  turns: _isSwapped ? 0.5 : 0,
                  child: const Icon(
                    PhosphorIconsBold.arrowsDownUp,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildTokenSelector() => Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.greyVeryLight,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildTokenInfo(),
              _buildMaxButton(),
            ],
          ),
        ),
      );

  Widget _buildTokenInfo() => Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              Image(
                height: 44,
                width: 44,
                image: AssetImage(widget.selectedToken.tokenImage!),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.selectedToken.tokenName!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.selectedToken.tokenBalance!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildMaxButton() => Container(
        height: 34,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(
          child: Text(
            'Max',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      );

  Widget _buildNumpad() => Column(
        children: <Widget>[
          _buildNumpadRow(<String>['1', '2', '3']),
          _buildNumpadRow(<String>['4', '5', '6']),
          _buildNumpadRow(<String>['7', '8', '9']),
          _buildNumpadRow(<String>['.', '0', 'cancel']),
        ],
      );

  Widget _buildNumpadRow(List<String> buttons) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons.map(_buildNumpadButton).toList(),
        ),
      );

  Widget _buildNumpadButton(String label) => Expanded(
        child: InkWell(
          onTap: () => _onNumpadTap(label),
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: label != 'cancel'
                  ? Text(
                      label,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    )
                  : const Icon(PhosphorIconsBold.backspace),
            ),
          ),
        ),
      );

  Future<void> _onNumpadTap(String label) async {
    await HapticFeedback.lightImpact();
    if (_isSwapped) {
      _updateAmount(label, isFirstAmount: false);
    } else {
      _updateAmount(label, isFirstAmount: true);
    }
  }

  void _updateAmount(String label, {required bool isFirstAmount}) {
    setState(() {
      if (label == 'cancel') {
        if (isFirstAmount) {
          _amount = _amount.length > 1
              ? _amount.substring(0, _amount.length - 1)
              : r'$0';
        } else {
          _amount2 = _amount2.length > 1
              ? _amount2.substring(0, _amount2.length - 1)
              : '0';
        }
      } else {
        if (isFirstAmount) {
          if (_amount == r'$0') {
            _amount = r'$' + label;
          } else {
            _amount += label;
          }
        } else {
          if (_amount2 == '0') {
            _amount2 = label;
          } else {
            _amount2 += label;
          }
        }
      }
    });
  }

  String? _buildSelectedText() {
    final SelectableItem firstItem = widget.selectedToItems.first;
    String name = '';
    if (firstItem is UserModel) {
      name = firstItem.userName;
    } else if (firstItem is Friend)
      name = firstItem.friendName;
    else if (firstItem is Contact)
      name = firstItem.contactName;
    else if (firstItem is Wallet)
      name = firstItem.walletName;
    else if (firstItem is Token) name = firstItem.tokenName!;

    return widget.selectedToItems.length > 1
        ? '$name +${widget.selectedToItems.length - 1} others'
        : name;
  }

  void _continueToLoading() {
    // Implement the logic for continuing to the loading screen
  }
}
