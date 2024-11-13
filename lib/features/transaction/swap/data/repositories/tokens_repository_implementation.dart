// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/transaction/swap/data/sources/remote/tokens_remote_source.dart';
import 'package:defy/features/transaction/swap/domain/entities/tokens_entity.dart';
import 'package:defy/features/transaction/swap/domain/repositories/tokens_repository.dart';

class TokensRepositoryImplementation extends TokensRepository {
  final TokensRemoteSource _remote;
  TokensRepositoryImplementation(this._remote,);

  @override
  Future<List<TokenEntity>?> fetchTokens() async {
    final tokens = await _remote.fetchTokens();
    return tokens?.map((token) => token.toDomain()).toList();
  }
}
