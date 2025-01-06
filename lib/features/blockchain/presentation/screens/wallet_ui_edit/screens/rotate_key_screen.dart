// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RotateKeyScreen extends StatefulWidget {
  const RotateKeyScreen({super.key});

  @override
  State<RotateKeyScreen> createState() => _RotateKeyScreenState();
}

class _RotateKeyScreenState extends State<RotateKeyScreen> {
  final FocusNode focusNode = FocusNode();
  final privateKey =
      TextEditingController(text: '0x7a8b9c012345678deFEDcBa9876543210FEDCBA');
  bool rotated = false;

  @override
  void dispose() {
    privateKey.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void focusKB() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        title: GestureDetector(
          onTap: () {
            setState(() {
              rotated = !rotated;
            });
          },
          child: Visibility(
            visible: rotated,
            replacement: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(PhosphorIconsBold.caretLeft),
                ),
                Text(
                  'Private Key',
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(PhosphorIconsBold.caretLeft),
                ),
                Text(
                  'Rotating Private Key',
                ),
                Opacity(
                  opacity: 0,
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: rotated
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    focusNode: focusNode,
                    enabled: rotated,
                    minLines: 1,
                    maxLines: 5,
                    onTapOutside: (_) {},
                    controller: privateKey,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colorFromHex('#F4F4F6'),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: rotated,
                replacement: GestureDetector(
                  onTap: () async {
                    setState(() => rotated = true);
                    focusKB();
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIcons.arrowsClockwise(),
                      ),
                      const Gap(6),
                      Text(
                        'Rotate Key',
                      ),
                    ],
                  ),
                ),
                child: GestureDetector(
                  onTap: () async {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        PhosphorIcons.shuffle(),
                        color: colorFromHex('#2071EE'),
                      ),
                      const Gap(6),
                      Text(
                        'Generate Randomly',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                backgroundColor: rotated ? colorFromHex('#2071EE') : null,
              ),
              child: Visibility(
                visible: rotated,
                replacement: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(PhosphorIcons.copy()),
                    const Gap(6),
                    const Text('Copy Private Key'),
                  ],
                ),
                child: const Text('Phase From Clipboard'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
