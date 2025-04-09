import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/bip39_wordlist.dart';

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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addWord(String word) {
    if (!widget.words.contains(word) && widget.words.length < 24) {
      final List<String> updatedWords = List<String>.from(widget.words)
        ..add(word);
      widget.onWordsUpdated(updatedWords);
      if (updatedWords.length < 24) {
        _focusNode.requestFocus();
      }
    } else if (widget.words.contains(word)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Word already added')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seed phrase cannot exceed 24 words')),
      );
    }
  }

  void _handleKeyPress(RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.space) {
      final String currentText = _controller.text.trim();
      final List<String> words = currentText.split(RegExp(r'\s+'));
      final String lastWord = words.last.toLowerCase();

      if (lastWord.isNotEmpty) {
        if (bip39Wordlist.contains(lastWord)) {
          _addWord(lastWord);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid word: $lastWord')),
          );
        }
        _controller.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double baseHeight = widget.words.isEmpty ? 100 : 60;
    final double dynamicHeight =
        baseHeight + (widget.words.length / 3).ceil() * 40;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Import Seed Phrase 🤫',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          const Text(
            'Enter your 12 or 24-word seed phrase.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.greyLight,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: dynamicHeight,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.greyMedium),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: <Widget>[
                    ...widget.words.map(_buildWordChip),
                    _buildTextField(
                      widget.words,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildWordChip(String word) => Animate(
        effects: <Effect<dynamic>>[
          FadeEffect(duration: 300.ms),
          ScaleEffect(duration: 300.ms),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.greyVeryLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  final List<String> updatedWords =
                      List<String>.from(widget.words)..remove(word);
                  widget.onWordsUpdated(updatedWords);
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
              const SizedBox(width: 5),
              Text(
                word,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      );

  Widget _buildTextField(List<String> words) => SizedBox(
        width: words.isEmpty ? 220 : 100,
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: _handleKeyPress,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: words.isEmpty ? 'Enter Seed Phrase here ...' : '',
              hintStyle: const TextStyle(
                fontSize: 16,
                color: AppColors.greyLight,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
              isDense: true,
            ),
            style: const TextStyle(fontSize: 14),
            cursorWidth: 1,
            cursorHeight: 16,
            textAlignVertical: TextAlignVertical.top,
            textInputAction: TextInputAction.done,
          ),
        ).animate().fadeIn(),
      );
}
