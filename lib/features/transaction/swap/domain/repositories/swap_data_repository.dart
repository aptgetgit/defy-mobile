import 'package:defy/features/transaction/swap/domain/entities/swap_data_entity.dart';

abstract class SwapDataRepository {
  Future<SwapEntity?> fetchSwapData(String fromToken,String toToken,int amount);
}