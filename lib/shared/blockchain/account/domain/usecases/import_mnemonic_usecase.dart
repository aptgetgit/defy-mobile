import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/mnemonic_utils.dart';
import '../repositories/entropy_repository_interface.dart';

class ImportMnemonicUseCase {
  const ImportMnemonicUseCase({required IEntropyRepository repository})
    : _repository = repository;

  final IEntropyRepository _repository;

  Future<Either<ExceptionWithStackTrace, Uint8List>> call({
    required String mnemonic,
  }) =>
      TaskEither<ExceptionWithStackTrace, Uint8List>(() {
        if (mnemonic.trim().isEmpty) {
          throw ArgumentError('Mnemonic cannot be empty');
        }

        if (!isValidMnemonic(mnemonic)) {
          throw StateError('Invalid mnemonic phrase');
        }

        final Uint8List entropy = mnemonicToEntropy(mnemonic);
        return _repository.store(entropy: entropy).run();
      }).run();
}
