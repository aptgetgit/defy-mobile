// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/environment/env.dart';
import 'dio_init_provider.dart';

part 'generated/node_api_dio_service_provider.g.dart';

@Riverpod(keepAlive: true)
Dio nodeApiDioService(Ref ref) =>
    ref.watch(dioInitializerProvider(Env.aptosNodeApiBaseUrl))
      ..interceptors.add(
        DioCacheInterceptor(
          options: CacheOptions(
            store: MemCacheStore(
              maxEntrySize: 1024 * 1024 * 10, // 10MB
              maxSize: 1024 * 1024 * 100, // 100MB
            ),
            policy: CachePolicy.request,
            priority: CachePriority.high,
            allowPostMethod: false,
            cipher: null,
            maxStale: const Duration(days: 7),
            hitCacheOnErrorExcept: <int>[401, 403],
            keyBuilder: CacheOptions.defaultCacheKeyBuilder,
          ),
        ),
      );
