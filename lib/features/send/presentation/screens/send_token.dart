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
            children: [
              _buildAppBar(),
              const Gap(20),
              _buildRecipientBar(),
              const Gap(18),
              _buildAmountDisplay(width),
              const Spacer(),
              _buildTokenSelector(),
              const Gap(12),
              _buildNumpad(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
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
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                color: Colors.black, size: 18),
          ),
          const Text('Send',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
          Icon(PhosphorIcons.paperPlaneTilt(PhosphorIconsStyle.bold),
              color: Colors.black, size: 21),
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
          children: [
            const Gap(16),
            const Text('To',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const Gap(20),
            _buildRecipientAvatars(),
            const Gap(4),
            Text(_buildSelectedText()!,
                style:
                    const TextStyle(fontSize: 16, color: AppColors.greyLight)),
            const Spacer(),
            _buildAddRecipientButton(),
          ],
        ),
      );

  Widget _buildRecipientAvatars() => RowSuper(
        innerDistance: -24,
        children: widget.selectedToItems.map((item) {
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
              color: Colors.black, borderRadius: BorderRadius.circular(24)),
          child: Center(
              child: Icon(PhosphorIcons.plus(PhosphorIconsStyle.bold),
                  color: Colors.white, size: 15)),
        ),
      );

  Widget _buildAmountDisplay(double width) => Container(
        height: 180,
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        child: Stack(children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            bottom: _isSwapped ? 0 : 55,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.6,
                  height: 100,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: List.generate(20, (index) {
                          final String char =
                              index < _amount.length ? _amount[index] : "";
                          bool isNotVisible = (_amount.length > _amount.length
                              ? index >= _amount.length
                              : index >= _amount.length);
                          return AnimatedSlide(
                            duration: const Duration(milliseconds: 150),
                            offset:
                                (!isNotVisible) ? Offset(0, 0) : Offset(0, 0.5),
                            child: AnimatedOpacity(
                              opacity: (!isNotVisible) ? 1 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                    fontFamily: 'SfCompactRounded',
                                    fontWeight: _isSwapped
                                        ? FontWeight.w500
                                        : FontWeight.w700,
                                    color: _isSwapped
                                        ? Color(0xff646d80)
                                        : Colors.black,
                                    fontSize: _isSwapped
                                        ? 14
                                        : 80 - (_amount.length * 3)),
                                child: Text(char),
                              ),
                            ),
                          );
                        }),
                      )),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            bottom: !_isSwapped ? 0 : 55,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.6,
                  height: 100,
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                          children: List.generate(20, (index) {
                        final String char =
                            index < _amount2.length ? _amount2[index] : "";
                        bool isNotVisible = (_amount2.length > _amount2.length
                            ? index >= _amount2.length
                            : index >= _amount2.length);
                        return AnimatedSlide(
                          duration: const Duration(milliseconds: 150),
                          offset:
                              (!isNotVisible) ? Offset(0, 0) : Offset(0, 0.5),
                          child: AnimatedOpacity(
                            opacity: (!isNotVisible) ? 1 : 0,
                            duration: const Duration(milliseconds: 200),
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style: TextStyle(
                                  fontWeight: !_isSwapped
                                      ? FontWeight.w500
                                      : FontWeight.w700,
                                  color: !_isSwapped
                                      ? Color(0xff646d80)
                                      : Colors.black,
                                  fontSize: !_isSwapped
                                      ? 14
                                      : 80 - (_amount2.length * 3)),
                              child: Text(char),
                            ),
                          ),
                        );
                      }))),
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
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                  turns: _isSwapped ? 0.5 : 0,
                  child: Icon(
                    PhosphorIconsBold.arrowsDownUp,
                    size: 18,
                  ),
                ),
              ))
        ]),
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
            children: [
              _buildTokenInfo(),
              _buildMaxButton(),
            ],
          ),
        ),
      );

  Widget _buildTokenInfo() => Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Image(
                  height: 32,
                  width: 32,
                  image: AssetImage(widget.selectedToken.tokenImage!)),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.selectedToken.tokenName!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(widget.selectedToken.tokenBalance!,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyDark)),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildMaxButton() => Container(
        height: 38,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(child: Text('Max')),
      );

  Widget _buildNumpad() => Column(
        children: [
          _buildNumpadRow(['1', '2', '3']),
          _buildNumpadRow(['4', '5', '6']),
          _buildNumpadRow(['7', '8', '9']),
          _buildNumpadRow(['.', '0', 'cancel']),
        ],
      );

  Widget _buildNumpadRow(List<String> buttons) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: buttons.map((e) => _buildNumpadButton(e)).toList(),
        ),
      );

  Widget _buildNumpadButton(String label) => Expanded(
        child: InkWell(
          onTap: () => _onNumpadTap(label),
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: label != 'cancel'
                  ? Text(label,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 22))
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
        if ((isFirstAmount ? _amount : _amount2).length >= 12) return;
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
