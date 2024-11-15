import 'package:defy/features/transaction/swap/data/models/swap_data_model.dart';
import 'package:dio/dio.dart';

abstract class SwapDataRemoteSource {
  Future<SwapModel?> fetchSwapData(String fromToken,String toToken,int amount);
}

class SwapDataRemoteSourceImpl extends SwapDataRemoteSource {
  @override
  Future<SwapModel?> fetchSwapData(String fromToken, String toToken, int amount) async {
    final dio = Dio();
    final queryParameters = {
      "excludeSources" : "bapt_swap_v1,bapt_swap_v2,bapt_swap_v2.1"
    };
    final  swapData = await dio.get(
      "https://api.anqa.ag/v1/quote?srcCoinType=$fromToken&dstCoinType=$toToken&amount=$amount",
      queryParameters: queryParameters,
      );
    final res = swapData.data;
    final swapResponse = SwapModel.fromJson(res);
    return swapResponse;
  }
}

// curl -G \
//   -d "excludeSources=bapt_swap_v1,bapt_swap_v2,bapt_swap_v2.1" \
//   "https://api.anqa.ag/v1/quote?srcCoinType=0xf22bede237a07e121b56d91a491eb7bcdfd1f5907926a9e58338f964a01b17fa::asset::USDC&dstCoinType=0x1::aptos_coin::AptosCoin&amount=1000000"
