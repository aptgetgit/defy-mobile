// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/transaction/swap/domain/entities/tokens_entity.dart';
import 'package:defy/features/transaction/swap/domain/repositories/tokens_repository.dart';

class TokensUsecase {
  final TokensRepository _repository;
  TokensUsecase(this._repository);

  Future<List<TokenEntity>?> call() {
    return _repository.fetchTokens();
  } 
}
