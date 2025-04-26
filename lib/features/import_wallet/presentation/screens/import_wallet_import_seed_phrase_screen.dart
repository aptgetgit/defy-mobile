import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/bip39_wordlist.dart';
import '../../../../core/logging/app_logger.dart';

class ImportWalletImportSeedPhraseScreen extends StatefulWidget {
  const ImportWalletImportSeedPhraseScreen({
    required this.words,
    required this.onWordsUpdated,
    super.key,
  });
  final List<String> words;
  final void Function(List<String>) onWordsUpdated;

  @override
  State<ImportWalletImportSeedPhraseScreen> createState() =>
      _ImportWalletImportSeedPhraseScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
        ObjectFlagProperty<void Function(List<String> p1)>.has(
          'onWordsUpdated',
          onWordsUpdated,
        ),
      )
      ..add(IterableProperty<String>('words', words));
  }
}

class _ImportWalletImportSeedPhraseScreenState
    extends State<ImportWalletImportSeedPhraseScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<TextEditingController> _controllers =
      List<TextEditingController>.generate(24, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(24, (_) => FocusNode());
  bool _isInvalidWord = false;
  bool _isWordAlreadyAdded = false;
  Timer? _borderColorTimer;
  String? _invalidWordText;
  @override
  void dispose() {
    for (final TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (final FocusNode focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _borderColorTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _addWord(String word, int index) {
    AppLogger.debug('_addWord called with word: $word, index: $index');
    if (!widget.words.contains(word) && widget.words.length < 24) {
      final List<String> updatedWords = List<String>.from(widget.words)
        ..add(word);
      AppLogger.debug('Updating words: $updatedWords');
      widget.onWordsUpdated(updatedWords);
      if (updatedWords.length < 24) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusNodes[updatedWords.length].requestFocus();
          scrollToTop();
        });
      }
    } else if (widget.words.contains(word)) {
      AppLogger.debug('Word already added: $word');
      setState(() {
        _isWordAlreadyAdded = true;
        _invalidWordText = 'Word already added';
      });
      _borderColorTimer?.cancel();
      _borderColorTimer = Timer(const Duration(seconds: 2), () {
        setState(() {
          _isWordAlreadyAdded = false;
          _invalidWordText = null;
        });
      });
    }
  }

  void scrollToTop() {
    if (widget.words.length < 12 && _scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 40;
    const double itemSpacing = 8;
    const int itemsPerRow = 3;
    const int baseRows = 2;

    int rowCount = ((widget.words.length + 1) / itemsPerRow).ceil();
    rowCount = rowCount.clamp(baseRows, 4);

    const double baseHeight =
        (itemHeight * baseRows) + (itemSpacing * (baseRows - 1)) + 24;
    final double gridHeight =
        (itemHeight * rowCount) + (itemSpacing * (rowCount - 1)) + 24;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Import Seed Phrase 🤫',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          const Text(
            'Enter your 12 or 24-word seed phrase.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.greyLight,
            ),
          ),
          const SizedBox(height: 16),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: widget.words.length < baseRows * itemsPerRow
                ? baseHeight
                : gridHeight,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isInvalidWord || _isWordAlreadyAdded
                    ? Colors.red
                    : AppColors.greyMedium,
              ),
            ),
            child: ListView.builder(
              controller: _scrollController,
              physics: widget.words.length <= 12
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              itemCount: (24 / itemsPerRow).ceil(),
              itemBuilder: (BuildContext context, int rowIndex) =>
                  _buildRow(rowIndex, itemsPerRow),
            ),
          ),
          if (_invalidWordText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _invalidWordText!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildRow(int rowIndex, int itemsPerRow) => Row(
        children: List<Widget>.generate(itemsPerRow, (int columnIndex) {
          final int index = rowIndex * itemsPerRow + columnIndex;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: _buildGridItem(index),
            ),
          );
        }),
      );

  Widget _buildGridItem(int index) {
    if (index < widget.words.length) {
      return _buildWordChip(widget.words[index], index);
    } else if (index == widget.words.length) {
      return _buildTextField(index);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildWordChip(String word, int index) => Animate(
        effects: <Effect<dynamic>>[
          FadeEffect(duration: 300.ms),
          ScaleEffect(duration: 300.ms),
        ],
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  final List<String> updatedWords =
                      List<String>.from(widget.words)..removeAt(index);
                  widget.onWordsUpdated(updatedWords);
                  scrollToTop();
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppColors.greyMedium,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 12,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Center(
                  child: Text(
                    word,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildTextField(int index) => TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        cursorHeight: 12,
        cursorColor: AppColors.greyLight,
        cursorWidth: 1,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(
            RegExp(r'^[a-zA-Z ]*$'),
          ),
        ],
        decoration: InputDecoration(
          hintText: index == 0 ? 'Enter here...' : null,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.greyLight,
          ),
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          isDense: true,
        ),
        style: const TextStyle(fontSize: 14),
        textInputAction: TextInputAction.next,
        enableInteractiveSelection:
            true, 
        contextMenuBuilder: (BuildContext context, EditableTextState state) => Container(),
        onChanged: (String value) {
          AppLogger.debug('TextField onChanged: $value');
          if (value.isEmpty) {
            return;
          }

          final String word = value.trim().toLowerCase();
          if (word.isNotEmpty && value.endsWith(' ')) {
            AppLogger.debug('Processing word: $word');
            if (bip39Wordlist.contains(word)) {
              AppLogger.debug('Valid word: $word');
              setState(() {
                _isInvalidWord = false;
                _invalidWordText = null;
              });
              _addWord(word, index);
              _controllers[index].clear();
              if (index < 23) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _focusNodes[index + 1].requestFocus();
                });
              }
            } else {
              AppLogger.debug('Invalid word: $word');
              setState(() {
                _isInvalidWord = true;
                _invalidWordText = '$word is not a valid word';
              });
              _borderColorTimer?.cancel();
              _borderColorTimer = Timer(const Duration(seconds: 2), () {
                setState(() {
                  _isInvalidWord = false;
                  _invalidWordText = null;
                });
              });
            }
          }
        },
      );
}
