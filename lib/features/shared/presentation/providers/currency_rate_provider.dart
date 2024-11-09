import 'package:defy/core/providers/object_box_database_provider.dart';
import 'package:defy/features/shared/data/repositories/currency_rate_repository_implementation.dart';
import 'package:defy/features/shared/data/sources/local/currency_rate_local_source.dart';
import 'package:defy/features/shared/data/sources/remote/currency_rate_remote_source.dart';
import 'package:defy/features/shared/domain/usecases/currency_rate_usecase.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/currency_rate_provider.g.dart';

@riverpod
CurrencyRateRepository currencyRateRepository(CurrencyRateRepositoryRef ref) {
   final dio = Dio(BaseOptions(
    baseUrl: 'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
    // You can adjust these timeouts as needed
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));
  final objectBoxStore = ref.read(objectBoxDbServiceProvider);
  
  final localDataSource = CurrencyRateLocalDataSource(objectBoxStore);
  final remoteDataSource = CurrencyRateRemoteDataSource(dio);
  
  return CurrencyRateRepository(localDataSource, remoteDataSource);
}

@riverpod
ListLocalCurrencyRatesUseCase listLocalCurrencyRatesUseCase(
  ListLocalCurrencyRatesUseCaseRef ref
) {
  final repository = ref.read(currencyRateRepositoryProvider);
  return ListLocalCurrencyRatesUseCase(repository);
}

@riverpod
GetLocalCurrencyRateUseCase getLocalCurrencyRateUseCase(
  GetLocalCurrencyRateUseCaseRef ref
) {
  final repository = ref.read(currencyRateRepositoryProvider);
  return GetLocalCurrencyRateUseCase(repository);
}

@riverpod
SaveLocalCurrencyRateUseCase saveLocalCurrencyRateUseCase(
  SaveLocalCurrencyRateUseCaseRef ref
) {
  final repository = ref.read(currencyRateRepositoryProvider);
  return SaveLocalCurrencyRateUseCase(repository);
}

@riverpod
DeleteLocalCurrencyRateUseCase deleteLocalCurrencyRateUseCase(
  DeleteLocalCurrencyRateUseCaseRef ref
) {
  final repository = ref.read(currencyRateRepositoryProvider);
  return DeleteLocalCurrencyRateUseCase(repository);
}

@riverpod
ListRemoteCurrencyRatesUseCase listRemoteCurrencyRatesUseCase(
  ListRemoteCurrencyRatesUseCaseRef ref
) {
  final repository = ref.read(currencyRateRepositoryProvider);
  return ListRemoteCurrencyRatesUseCase(repository);
}

// @riverpod
// GetRemoteCurrencyRateUseCase getRemoteCurrencyRateUseCase(
//   GetRemoteCurrencyRateUseCaseRef ref
// ) {
//   final repository = ref.read(currencyRateRepositoryProvider);
//   return GetRemoteCurrencyRateUseCase(repository);
// }

@riverpod
SyncCurrencyRatesUseCase syncCurrencyRatesUseCase(
  SyncCurrencyRatesUseCaseRef ref
) {
  final repository = ref.read(currencyRateRepositoryProvider);
  return SyncCurrencyRatesUseCase(repository);
}

// // Optional: Add a provider for auto-refresh functionality
// @riverpod
// class CurrencyRateRefresher extends _$CurrencyRateRefresher {
//   Timer? _refreshTimer;

//   @override
//   Future<void> build() async {
//     // Setup auto-refresh
//     ref.onDispose(() {
//       _refreshTimer?.cancel();
//     });

//     // Initial sync
//     await _sync();

//     // Start periodic sync
//     _refreshTimer = Timer.periodic(
//       const Duration(minutes: 5),
//       (_) => _sync(),
//     );
//   }

//   Future<void> _sync() async {
//     try {
//       final syncUseCase = ref.read(syncCurrencyRatesUseCaseProvider);
//       await syncUseCase();
//     } catch (e) {
//       // Handle errors appropriately
//       debugPrint('Failed to sync currency rates: $e');
//     }
//   }

//   Future<void> forceRefresh() async {
//     await _sync();
//   }
// }