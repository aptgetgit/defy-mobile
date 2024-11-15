// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/transaction/swap/data/sources/remote/swap_data_remote_source.dart';
import 'package:defy/features/transaction/swap/domain/entities/swap_data_entity.dart';
import 'package:defy/features/transaction/swap/domain/repositories/swap_data_repository.dart';

class SwapDataRepositoryImplementation extends SwapDataRepository {
  final SwapDataRemoteSource _remoteSource;
  SwapDataRepositoryImplementation(this._remoteSource);
  @override
  Future<SwapEntity?> fetchSwapData(String fromToken, String toToken, int amount) async {
      final swapDataRes = await _remoteSource.fetchSwapData(fromToken, toToken, amount);
      return swapDataRes?.toDomain();
  }
}
