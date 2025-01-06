import 'package:defy/features/transaction/swap/data/repositories/swap_data_repository_implementation.dart';
import 'package:defy/features/transaction/swap/data/sources/remote/swap_data_remote_source.dart';
import 'package:defy/features/transaction/swap/domain/entities/swap_data_entity.dart';
import 'package:defy/features/transaction/swap/domain/repositories/swap_data_repository.dart';
import 'package:defy/features/transaction/swap/domain/usecases/swap_data_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/swap_data_provider.g.dart';

@riverpod
SwapDataRepository swapDataRepository(SwapDataRepositoryRef ref) {
  final remoteDataSource = SwapDataRemoteSourceImpl();
  return SwapDataRepositoryImplementation(remoteDataSource);
}

@riverpod
SwapDataUsecase swapDataUsecase(SwapDataUsecaseRef ref) {
  final repository = ref.read(swapDataRepositoryProvider);
  return SwapDataUsecase(repository);
}

//main Provider to use

@riverpod
class SwapData extends _$SwapData {
  @override
  Future<SwapEntity?> build({required String fromToken,required String toToken,required int amount}){
    return _fetchSwapData(fromToken,toToken,amount);
  }

  Future<SwapEntity?> _fetchSwapData(String fromToken,String toToken,int amount) async {
    final swapData = await ref.read(swapDataUsecaseProvider).call(fromToken, toToken, amount);
    return swapData;
  }
}