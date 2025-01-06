import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.themeData.scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildRowButtons(['1', '2', '3'], widget.controller),
          _buildRowButtons(['4', '5', '6'], widget.controller),
          _buildRowButtons(['7', '8', '9'], widget.controller),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildButton('.', null, widget.controller),
                  _buildButton('0', null, widget.controller),
                  _buildButton(
                      'cancel', PhosphorIconsBold.backspace, widget.controller),
                ]),
          ),
        ],
      ),
    );
  }

  Widget _buildRowButtons(List<String> rows, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: rows.map((e) => _buildButton(e, null, controller)).toList(),
      ),
    );
  }

  Widget _buildButton(
      String label, IconData? icon, TextEditingController controller) {
    return InkWell(
      onTap: () {
        onTap(label, controller);
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: icon == null ? 14 : 6,
              vertical: icon == null ? 6 : 6),
          // padding: const EdgeInsets.symmetric(vertical: 8),
          child: icon == null
              ? Text(
                  label,
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),
                )
              : Icon(icon)),
    );
  }

  void onTap(String label, TextEditingController controller) {
    if (label == 'cancel') {
      setState(() {
        if (controller.text.isNotEmpty) {
          controller.text =
              controller.text.substring(0, controller.text.length - 1);
        }
      });
    } else {
      controller.text += label;
    }
  }
}
