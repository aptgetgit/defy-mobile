import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import 'watchlist_newList_tile.dart';

class WatchListNewCollectionScreen extends StatefulWidget {
  const WatchListNewCollectionScreen({super.key});

  @override
  State<WatchListNewCollectionScreen> createState() => _WatchListNewCollectionScreenState();
}

class _WatchListNewCollectionScreenState extends State<WatchListNewCollectionScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isKeyboardOpen = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Listen for keyboard visibility changes
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenKeyboardVisibility();
    });

    _controller.addListener(_checkTextField);
  }

  void _checkTextField() {
    setState(() {
      _isButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  void _listenKeyboardVisibility() {
    WidgetsBinding.instance.addObserver(
      LifecycleEventHandler(
        onChange: () {
          final isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          setState(() {
            _isKeyboardOpen = isOpen;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_checkTextField); 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(PhosphorIconsBold.caretLeft, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              icon: const Icon(PhosphorIconsRegular.star, size: 24,),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            const Text(
              'Name Your Collection',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            const Gap(20),
            const Hero(
              tag: 'new_list',
              child: WatchlistNewListTile(),
            ),
            const Gap(30),
            TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                hintText: 'List Name',
                hintStyle: TextStyle(color: AppColors.greyMedium, fontWeight: FontWeight.w600),
                border: InputBorder.none, // Removes the border
              ),
              textAlign: TextAlign.center, // Aligns text to center
            ), 
            const Spacer(),
            AnimatedPadding(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.only(bottom: _isKeyboardOpen ? keyboardPadding : 24),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        // Handle create action
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isButtonEnabled
                      ? Colors.black
                      : AppColors.greyMedium,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  child: Text('Create', style: TextStyle(color: _isButtonEnabled // Change text color too
                            ? Colors.white // White when enabled
                            : AppColors.greyLight,),),
                            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final VoidCallback onChange;
  LifecycleEventHandler({required this.onChange});

  @override
  void didChangeMetrics() {
    onChange();
  }
}