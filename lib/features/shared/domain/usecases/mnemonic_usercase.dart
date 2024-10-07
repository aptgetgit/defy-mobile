import 'dart:typed_data';

import 'package:defy/features/shared/data/repositories/mnemonic_repository_implementation.dart';

class GenerateMnemonicUseCase {
  final MnemonicRepository _repository;

  GenerateMnemonicUseCase(this._repository);

  String call({int strength = 128}) {
    return _repository.generateMnemonic(strength: strength);
  }
}

class ValidateMnemonicUseCase {
  final MnemonicRepository _repository;

  ValidateMnemonicUseCase(this._repository);

  bool call(String phrase) {
    return _repository.validateMnemonic(phrase);
  }
}

class ToSeedUseCase {
  final MnemonicRepository _repository;

  ToSeedUseCase(this._repository);

  Uint8List call(String phrase, {String passphrase = ''}) {
    return _repository.mnemonicToSeed(phrase, passphrase: passphrase);
  }
}

class ToSeedHexUseCase {
  final MnemonicRepository _repository;

  ToSeedHexUseCase(this._repository);

  String call(String phrase, {String passphrase = ''}) {
    return _repository.mnemonicToSeedHex(phrase, passphrase: passphrase);
  }
}

class SaveMnemonicUseCase {
  final MnemonicRepository _repository;

  SaveMnemonicUseCase(this._repository);

  Future<String> call(String identityId, String phrase) {
    return _repository.saveMnemonic(identityId, phrase);
  }
}

class GetMnemonicUseCase {
  final MnemonicRepository _repository;

  GetMnemonicUseCase(this._repository);

  Future<String?> call(String mnemonicId) {
    return _repository.getMnemonic(mnemonicId);
  }
}

class DeleteMnemonicUseCase {
  final MnemonicRepository _repository;

  DeleteMnemonicUseCase(this._repository);

  Future<void> call(String mnemonicId) {
    return _repository.deleteMnemonic(mnemonicId);
  }
}