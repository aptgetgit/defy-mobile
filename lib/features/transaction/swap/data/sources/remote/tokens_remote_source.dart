import 'dart:convert';

import 'package:defy/features/transaction/swap/data/models/tokens_remote_model.dart';
import 'package:dio/dio.dart';

abstract class TokensRemoteSource {
  Future<List<TokensRemoteModel>?> fetchTokens();
}

class TokensRemoteSourceImplementation extends TokensRemoteSource {
  @override
  Future<List<TokensRemoteModel>?> fetchTokens() async {
    final dio = Dio();
    final response = await dio.get("https://raw.githubusercontent.com/PanoraExchange/Aptos-Tokens/main/token-list.json");
    if(response.statusCode == 200) {
      final body=  jsonDecode(response.data) as List;
      final tokens = body.map((token) {
      final tokenModel = TokensRemoteModel.fromJson(token); 
      return tokenModel;
    }).toList();
    return tokens;
    }
    return null;
  }
}