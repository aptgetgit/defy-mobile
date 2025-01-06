import 'package:defy/features/transaction/swap/domain/entities/tokens_entity.dart';

abstract class TokensRepository {
  Future<List<TokenEntity>?> fetchTokens();
}