import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/exception_with_stack_trace.dart';
import '../../domain/entities/aptos_network.dart';
import '../../domain/repositories/active_network_repository_interface.dart';
import '../sources/local/active_network_local_data_source.dart';

class ActiveNetworkRepository implements IActiveNetworkRepository {
  const ActiveNetworkRepository({
    required ActiveNetworkLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final ActiveNetworkLocalDataSource _localDataSource;

  @override
  TaskEither<ExceptionWithStackTrace, Option<AptosNetwork>>
  getActiveNetwork() =>
      TaskEither<ExceptionWithStackTrace, Option<AptosNetwork>>(() async {
        try {
          final Either<ExceptionWithStackTrace, Option<String>> networkEither =
              await _localDataSource.getActiveNetwork().run();
          return networkEither.fold(
            left,
            (Option<String> networkOption) =>
                right(networkOption.map(AptosNetwork.fromCaipChainId)),
          );
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> setActiveNetwork({
    required AptosNetwork network,
  }) => TaskEither<ExceptionWithStackTrace, Unit>(() async {
    try {
      return await _localDataSource
          .setActiveNetwork(networkId: network.toCaipChainId())
          .run();
    } on Exception catch (error, stackTrace) {
      return left(ExceptionWithStackTrace(error, stackTrace));
    }
  });

  @override
  TaskEither<ExceptionWithStackTrace, Unit> clearActiveNetwork() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          return await _localDataSource.removeActiveNetwork().run();
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  @override
  TaskEither<ExceptionWithStackTrace, bool> hasActiveNetwork() =>
      TaskEither<ExceptionWithStackTrace, bool>(() async {
        try {
          final Either<ExceptionWithStackTrace, Option<String>> networkEither =
              await _localDataSource.getActiveNetwork().run();
          return networkEither.fold(
            left,
            (Option<String> networkOption) => right(networkOption.isSome()),
          );
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });
}
