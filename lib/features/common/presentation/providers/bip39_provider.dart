import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/bip39_repository_implementation.dart';
import '../../domain/repositories/bip39_repository.dart';
import '../../domain/usecases/validate_bip39_word_usecase.dart';

part 'generated/bip39_provider.g.dart';

@riverpod
BIP39Repository bip39Repository(Ref ref) => BIP39RepositoryImplementation();

@riverpod
ValidateBIP39WordUseCase validateBIP39WordUseCase(Ref ref) {
  final BIP39Repository repository = ref.watch(bip39RepositoryProvider);
  return ValidateBIP39WordUseCase(repository);
}
