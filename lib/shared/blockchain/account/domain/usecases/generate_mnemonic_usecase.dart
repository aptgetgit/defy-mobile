import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/mnemonic_utils.dart';
import '../repositories/entropy_repository_interface.dart';


class GenerateMnemonicUseCase {
  const GenerateMnemonicUseCase({required IEntropyRepository repository})
    : _repository = repository;

  final IEntropyRepository _repository;

  TaskEither<ExceptionWithStackTrace, Uint8List> call({
    int strength = 128,
  }) => TaskEither<ExceptionWithStackTrace, Uint8List>(() async {
    if (!isValidEntropyStrength(strength)) {
      throw ArgumentError(
        'Invalid strength: $strength. Must be one of ${validEntropyStrengths.join(", ")} bits',
      );
    }

    try {
      final Uint8List entropy = generateEntropyWithStrength(strength);
      return _repository.store(entropy: entropy).run();
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });
}
