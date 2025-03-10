import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; // Add this for provider support
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../presentation/providers/watchlist_provider.dart'; // Add provider import
import 'watchlist_newList_tile.dart';

class WatchListUpdateCollectionScreen extends ConsumerStatefulWidget {
  const WatchListUpdateCollectionScreen({
    required this.initialName,  // Add this parameter
    required this.collectionId, // Add this parameter
    super.key,
  });
  
  final String initialName;
  final String collectionId;

  @override
  ConsumerState<WatchListUpdateCollectionScreen> createState() => _WatchListUpdateCollectionScreenState();
}

class _WatchListUpdateCollectionScreenState extends ConsumerState<WatchListUpdateCollectionScreen> {
  late TextEditingController _controller;
  bool _isKeyboardOpen = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Initialize controller with the initial name
    _controller = TextEditingController(text: widget.initialName);
    _isButtonEnabled = _controller.text.isNotEmpty; // Initialize button state
    
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
          final bool isOpen = MediaQuery.of(context).viewInsets.bottom > 0;
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
          icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.bold), size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              icon: Icon(PhosphorIcons.star(), size: 24),
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
              'Update Your Collection',
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
                        // Update collection name in the provider
                        ref.read(watchlistProvider.notifier)
                           .updateCollectionName(widget.collectionId, _controller.text);
                        
                        // Pop back to previous screen - no need to return a value
                        Navigator.pop(context);
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
                  child: Text(
                    'Update', 
                    style: TextStyle(
                      color: _isButtonEnabled
                        ? Colors.white
                        : AppColors.greyLight,
                    ),
                  ),
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
  LifecycleEventHandler({required this.onChange});
  final VoidCallback onChange;

  @override
  void didChangeMetrics() {
    onChange();
  }
}
