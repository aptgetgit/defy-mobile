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
    required this.onImport,
    super.key,
  });
  final List<String> words;
  final void Function(List<String>) onWordsUpdated;
  final VoidCallback onImport;

  @override
  State<ImportWalletImportSeedPhraseScreen> createState() =>
      _ImportWalletImportSeedPhraseScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function(List<String> p1)>.has(
          'onWordsUpdated', onWordsUpdated,),)
      ..add(ObjectFlagProperty<VoidCallback>.has('onImport', onImport))
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
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final String text = _controller.text;
    if (text.endsWith(' ')) {
      final String word = text.trim().toLowerCase();
      if (word.isNotEmpty) {
        _addWord(word);
      }
      _controller.clear();
    }
  }

  void _addWord(String word) {
    final String trimmedWord = word.trim().toLowerCase();

    if (word.isEmpty || !bip39Wordlist.contains(trimmedWord)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid word: $trimmedWord')),
      );
      _controller.clear();
      return;
    }

    if (widget.words.contains(trimmedWord)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Word already added')),
      );
      _controller.clear();
      return;
    }

    if (widget.words.length >= 24) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seed phrase cannot exceed 24 words')),
      );
      _controller.clear();
      _focusNode.unfocus();
      return;
    }

    final List<String> updatedWords = List<String>.from(widget.words)
      ..add(trimmedWord);
    widget.onWordsUpdated(updatedWords);
    _controller.clear();

    if (updatedWords.length < 24) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double baseHeight = widget.words.isEmpty ? 100 : 60;
    final double dynamicHeight =
        baseHeight + (widget.words.length / 3).ceil() * 40;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Import Seed Phrase 🤫',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          const Text(
            'Enter your 12 or 24-word seed phrase.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
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
                    _buildTextField(),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap:
                widget.words.isNotEmpty ? widget.onImport : _pasteFromClipboard,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                widget.words.isEmpty ? 'Paste from clipboard' : 'Continue',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ).animate().scale(),
          ),
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

  Widget _buildTextField() => SizedBox(
        width: 100,
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            isDense: true,
          ),
          style: const TextStyle(fontSize: 14),
          cursorWidth: 1,
          cursorHeight: 16,
          textAlignVertical: TextAlignVertical.top,
          textInputAction: TextInputAction.done,
          onSubmitted: _addWord,
        ).animate().fadeIn(),
      );

  Future<void> _pasteFromClipboard() async {
    final ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      final List<String> pastedWords = clipboardData.text!
          .toLowerCase()
          .trim()
          .split(RegExp(r'\s+'))
          .where(bip39Wordlist.contains)
          .toList();

      if (pastedWords.isEmpty) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Clipboard does not contain a valid seed phrase'),
          ),
        );
        return;
      }

      if (pastedWords.length > 24) {
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Seed phrase cannot exceed 24 words')),
        );
        return;
      }

      widget.onWordsUpdated(pastedWords);
    }
  }
}
