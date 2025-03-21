import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/providers/services/shared_preferences_service_provider.dart';
import '../../../../../core/services/shared_preference_service.dart';
import '../../data/repositories/active_network_repository_implementation.dart';
import '../../data/sources/local/active_network_local_data_source.dart';
import '../../domain/repositories/active_network_repository_interface.dart';
import '../../domain/usecases/clear_active_network_usecase.dart';
import '../../domain/usecases/get_active_network_usecase.dart';
import '../../domain/usecases/has_active_network_usecase.dart';
import '../../domain/usecases/set_active_network_usecase.dart';

part 'generated/usecase_provider.g.dart';

@riverpod
IActiveNetworkRepository activeNetworkRepository(Ref ref) {
  final SharedPreferencesService sharedPreferences =
      ref.read(sharedPreferencesServiceProvider).requireValue;
  final ActiveNetworkLocalDataSource activeNetworkLocalDataSource =
      ActiveNetworkLocalDataSource(sharedPreferences: sharedPreferences);

  return ActiveNetworkRepository(localDataSource: activeNetworkLocalDataSource);
}

@riverpod
GetActiveNetworkUseCase getActiveNetworkUseCase(Ref ref) =>
    GetActiveNetworkUseCase(
      repository: ref.read(activeNetworkRepositoryProvider),
    );

@riverpod
SetActiveNetworkUseCase setActiveNetworkUseCase(Ref ref) =>
    SetActiveNetworkUseCase(
      repository: ref.read(activeNetworkRepositoryProvider),
    );

@riverpod
HasActiveNetworkUseCase hasActiveNetworkUseCase(Ref ref) =>
    HasActiveNetworkUseCase(
      repository: ref.read(activeNetworkRepositoryProvider),
    );

@riverpod
ClearActiveNetworkUseCase clearActiveNetworkUseCase(Ref ref) =>
    ClearActiveNetworkUseCase(
      repository: ref.read(activeNetworkRepositoryProvider),
    );
