// keypad_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Keypad extends StatelessWidget {

  const Keypad({required this.onButtonPress, super.key});
  final Function(String) onButtonPress;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 320,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowButtons(<String>['1', '2', '3']),
                _buildRowButtons(<String>['4', '5', '6']),
                _buildRowButtons(<String>['7', '8', '9']),
                _buildRowButtons(<String>['.', '0', 'cancel']),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 8, right: 8, top: 10),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Simplified, can add logic if needed
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildRowButtons(List<String> items) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((String item) => _buildButton(item, item == 'cancel' ? PhosphorIconsBold.backspace : null)).toList(),
      );

  Widget _buildButton(String label, [IconData? icon]) => Expanded(
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onButtonPress(label);
          },
          onLongPress: label == 'cancel'
              ? () => onButtonPress('cancelLongPress')
              : null,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: icon == null ? 16 : 8, vertical: icon == null ? 12 : 10),
            child: icon == null
                ? Center(child: Text(label, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)))
                : Center(child: Icon(icon)),
          ),
        ),
      );
}
