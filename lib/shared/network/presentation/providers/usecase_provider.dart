import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/database/objectbox/objectbox.g.dart';
import '../../../../core/di/providers/network/base_dio_service_provider.dart';
import '../../../../core/di/providers/services/object_box_service_provider.dart';
import '../../../../core/di/providers/services/shared_preference_service_provider.dart';

import '../../../../core/services/shared_preference_service.dart';
import '../../data/repositories/active_network_repository_implementation.dart';
import '../../data/repositories/network_config_repository_implementation.dart';
import '../../data/sources/local/network_config_local_data_source.dart';
import '../../data/sources/remote/network_config_remote_data_source.dart';
import '../../domain/repositories/active_network_repository_interface.dart';
import '../../domain/repositories/network_config_repository_interface.dart';
import '../../domain/usecases/delete_many_network_configs_usecase.dart';
import '../../domain/usecases/delete_network_config_usecase.dart';
import '../../domain/usecases/get_active_network_usecase.dart';
import '../../domain/usecases/get_all_network_configs_usecase.dart';
import '../../domain/usecases/get_network_config_usecase.dart';
import '../../domain/usecases/set_active_network_usecase.dart';
import '../../domain/usecases/store_many_network_configs_usecase.dart';
import '../../domain/usecases/store_network_config_usecase.dart';
import '../../domain/usecases/sync_network_configs_usecase.dart';

part 'generated/usecase_provider.g.dart';

@riverpod
IActiveNetworkRepository activeNetworkRepository(Ref ref) {
  final SharedPreferencesService sharedPreferences =
      ref.watch(sharedPreferencesServiceProvider);
  return ActiveNetworkRepository(sharedPreferences: sharedPreferences);
}

@riverpod
INetworkConfigRepository networkConfigRepository(
  Ref ref,
) {
  final Store objectBoxStore = ref.read(objectBoxDbServiceProvider);
  final Dio dio = ref.read(baseDioServiceProvider);
  final NetworkConfigLocalDataSource networkConfigLocalDataSource =
      NetworkConfigLocalDataSource(box: objectBoxStore.box());

  final NetworkConfigRemoteDataSource networkConfigRemoteDataSource =
      NetworkConfigRemoteDataSource(dio);

  return NetworkConfigRepository(
    store: objectBoxStore,
    localDataSource: networkConfigLocalDataSource,
    remoteDataSource: networkConfigRemoteDataSource,
  );
}

@riverpod
GetActiveNetworkUseCase getActiveNetworkUseCase(Ref ref) {
  final IActiveNetworkRepository repository =
      ref.watch(activeNetworkRepositoryProvider);
  return GetActiveNetworkUseCase(repository);
}

@riverpod
SetActiveNetworkUseCase setActiveNetworkUseCase(Ref ref) {
  final IActiveNetworkRepository repository =
      ref.watch(activeNetworkRepositoryProvider);
  return SetActiveNetworkUseCase(repository);
}

@riverpod
SyncNetworkConfigsUseCase syncNetworkConfigsUseCase(
  Ref ref,
) =>
    SyncNetworkConfigsUseCase(ref.watch(networkConfigRepositoryProvider));

@riverpod
GetAllNetworkConfigsUseCase getAllNetworkConfigsUseCase(
  Ref ref,
) =>
    GetAllNetworkConfigsUseCase(ref.watch(networkConfigRepositoryProvider));

@riverpod
GetNetworkConfigUseCase getNetworkConfigUseCase(
  Ref ref,
) =>
    GetNetworkConfigUseCase(ref.watch(networkConfigRepositoryProvider));

@riverpod
StoreNetworkConfigUseCase storeNetworkConfigUseCase(
  Ref ref,
) =>
    StoreNetworkConfigUseCase(ref.watch(networkConfigRepositoryProvider));

@riverpod
StoreManyNetworkConfigsUseCase storeManyNetworkConfigsUseCase(
  Ref ref,
) =>
    StoreManyNetworkConfigsUseCase(ref.watch(networkConfigRepositoryProvider));

@riverpod
DeleteNetworkConfigUseCase deleteNetworkConfigUseCase(
  Ref ref,
) =>
    DeleteNetworkConfigUseCase(ref.watch(networkConfigRepositoryProvider));

@riverpod
DeleteManyNetworkConfigsUseCase deleteManyNetworkConfigsUseCase(
  Ref ref,
) =>
    DeleteManyNetworkConfigsUseCase(ref.watch(networkConfigRepositoryProvider));
