import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../domain/entities/aptos_network.dart';
import '../../domain/usecases/get_active_network_usecase.dart';
import '../../domain/usecases/set_active_network_usecase.dart';
import 'usecase_provider.dart';

part 'generated/active_network_provider.g.dart';

@riverpod
class ActiveNetwork extends _$ActiveNetwork {
  @override
  Future<AptosNetwork> build() async {
    final GetActiveNetworkUseCase getActiveNetworkUsecase = ref.read(
      getActiveNetworkUseCaseProvider,
    );
    final Either<ExceptionWithStackTrace, Option<AptosNetwork>>
    activeNetworkOptionEither = await getActiveNetworkUsecase.call();

    if (activeNetworkOptionEither.isLeft()) {
      final ExceptionWithStackTrace left =
          activeNetworkOptionEither.getLeft().toNullable()!;
      return Future<AptosNetwork>.error(left.exception, left.stackTrace);
    }

    final Option<AptosNetwork> activeNetworkOption =
        activeNetworkOptionEither.getRight().toNullable()!;

    if (activeNetworkOption.isNone()) {
      final SetActiveNetworkUseCase setActiveNetworkUseCase = ref.read(
        setActiveNetworkUseCaseProvider,
      );

      final Either<ExceptionWithStackTrace, Unit> setActiveNetworkEither =
          await setActiveNetworkUseCase.call(
            network: const AptosNetwork.testnet(),
          );

      if (setActiveNetworkEither.isLeft()) {
        final ExceptionWithStackTrace left =
            setActiveNetworkEither.getLeft().toNullable()!;
        return Future<AptosNetwork>.error(left.exception, left.stackTrace);
      }

      return const AptosNetwork.testnet();
    }

    return activeNetworkOption.toNullable()!;
  }

  Future<void> setActiveNetwork({required AptosNetwork network}) async {
    final SetActiveNetworkUseCase setActiveNetworkUseCase = ref.read(
      setActiveNetworkUseCaseProvider,
    );

    state = const AsyncValue<AptosNetwork>.loading();

    final Either<ExceptionWithStackTrace, Unit> setActiveNetworkEither =
        await setActiveNetworkUseCase.call(network: network);

    state = setActiveNetworkEither.fold(
      (ExceptionWithStackTrace left) =>
          AsyncValue<AptosNetwork>.error(left.exception, left.stackTrace),
      (_) => AsyncValue<AptosNetwork>.data(network),
    );
  }
}
