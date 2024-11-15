// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:defy/features/transaction/swap/domain/entities/swap_data_entity.dart';
import 'package:defy/features/transaction/swap/domain/repositories/swap_data_repository.dart';

class SwapDataUsecase {
  final SwapDataRepository _repository;
  SwapDataUsecase(this._repository);

  Future<SwapEntity?> call(String fromToken,String toToken,int amount) {
      return _repository.fetchSwapData(fromToken, toToken, amount);
  }
}
