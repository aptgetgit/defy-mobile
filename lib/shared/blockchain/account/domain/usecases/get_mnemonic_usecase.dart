// import 'dart:typed_data';

// import '../../../../utils/mnemonic_utils.dart';
// import '../repositories/entropy_repository_interface.dart';

// class GetMnemonicUseCase {
//   const GetMnemonicUseCase({required IEntropyRepository repository})
//       : _repository = repository;

//   final IEntropyRepository _repository;

//   Future<String> call({required Uint8List entropyHash}) async {
//     if (entropyHash.isEmpty) {
//       throw ArgumentError('Entropy hash cannot be empty');
//     }

//     final Uint8List? entropy = await _repository.get(hash: entropyHash);
//     if (entropy == null) {
//       throw StateError('Mnemonic not found');
//     }

//     try {
//       return entropyToMnemonic(entropy);
//     } catch (e) {
//       throw StateError('Failed to convert entropy to mnemonic: $e');
//     }
//   }
// }
import 'dart:typed_data';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../../../utils/mnemonic_utils.dart';
import '../repositories/entropy_repository_interface.dart';

class GetMnemonicUseCase {
  const GetMnemonicUseCase({required IEntropyRepository repository})
    : _repository = repository;

  final IEntropyRepository _repository;

  Future<Either<ExceptionWithStackTrace, String>> call({
    required Uint8List entropyHash,
  }) =>
      TaskEither<ExceptionWithStackTrace, String>(() async {
        if (entropyHash.isEmpty) {
          throw ArgumentError('Entropy hash cannot be empty');
        }

        final Either<ExceptionWithStackTrace, Option<Uint8List>> entropyResult =
            await _repository.get(hash: entropyHash).run();

        if (entropyResult.isLeft()) {
          return left(entropyResult.getLeft().toNullable()!);
        }

        final Option<Uint8List> entropyOption =
            entropyResult.getRight().toNullable()!;

        if (entropyOption.isNone()) {
          throw StateError('Mnemonic not found');
        }

        final Uint8List entropy = entropyOption.toNullable()!;

        return right(entropyToMnemonic(entropy));
      }).run();
}
