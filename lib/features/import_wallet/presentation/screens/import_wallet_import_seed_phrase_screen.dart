import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/constants/bip39_wordlist.dart';
import '../../../../shared/account/presentation/providers/generate_account_flow.dart';

class ImportWalletImportSeedPhraseScreen extends ConsumerStatefulWidget {
  const ImportWalletImportSeedPhraseScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportWalletImportSeedPhraseScreenState();
}

class _ImportWalletImportSeedPhraseScreenState
    extends ConsumerState<ImportWalletImportSeedPhraseScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _words = <String>[];
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

  void _importMnemonic() async {
    final String mnemonic = _words.join(' ');

    await ref
        .watch(generateAccountFlowProvider.notifier)
        .importMnemonic(mnemonic);
  }

  void _addWord(String word) {
    word = word.trim().toLowerCase();

    if (word.isEmpty || !bip39Wordlist.contains(word)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid word: $word')),
      );
      _controller.clear();
      return;
    }

    if (_words.contains(word)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Word already added')),
      );
      _controller.clear();
      return;
    }

    if (_words.length >= 24) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Seed phrase cannot exceed 24 words')),
      );
      _controller.clear();
      _focusNode.unfocus();
      return;
    }

    setState(() {
      _words.add(word);
      _controller.clear();
    });

    if (_words.length < 24) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double baseHeight = _words.isEmpty ? 100 : 60;
    final double dynamicHeight = baseHeight + (_words.length / 3).ceil() * 40;

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
                  maxWidth: double.infinity, minWidth: double.infinity),
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
                    ..._words.map(_buildWordChip),
                    _buildTextField(),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: _words.isNotEmpty ? _importMnemonic : _pasteFromClipboard,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                _words.isEmpty ? 'Paste from clipboard' : 'Continue',
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
        effects: <Effect>[
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
                  setState(() {
                    _words.remove(word);
                  });
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Clipboard does not contain a valid seed phrase'),
          ),
        );
        return;
      }

      if (pastedWords.length > 24) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Seed phrase cannot exceed 24 words')),
        );
        return;
      }

      setState(() {
        _words
          ..clear()
          ..addAll(pastedWords);
      });
    }
  }
}
