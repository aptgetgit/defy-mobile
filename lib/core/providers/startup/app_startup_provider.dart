import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/connectivity/presentation/providers/connectivity_status_provider.dart';
import '../../error/exception_with_stack_trace.dart';
import '../../logging/app_logger.dart';
import '../../navigation/deep_link/deep_link_handler.dart';
import '../../navigation/routes/router.dart';
import '../device/device_info_provider.dart';
import '../locale/locale_provider.dart';
import '../services/secure_storage_service_provider.dart';
import '../services/shared_preferences_service_provider.dart';
import '../storage/object_box_store_provider.dart';
import '../theme/theme_provider.dart';

part 'generated/app_startup_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStartupNotifier extends _$AppStartupNotifier {
  @override
  Future<void> build() async {
    ref.onDispose(() {
      ref
        ..invalidate(secureStorageServiceProvider)
        ..invalidate(sharedPreferencesServiceProvider)
        ..invalidate(objectBoxStoreProvider)
        ..invalidate(localeNotifierProvider)
        ..invalidate(themeNotifierProvider)
        ..invalidate(routerProvider)
        ..invalidate(connectivityStatusProvider)
        ..invalidate(androidDeviceInfoProvider)
        ..invalidate(iosDeviceInfoProvider);

      DeepLinkHandler().dispose().run().fold((ExceptionWithStackTrace error) {
        AppLogger.error(
          'Deep Link Handler dispose error',
          error: error.exception,
          stackTrace: error.stackTrace,
        );
      }, (_) {});
    });

    final Either<ExceptionWithStackTrace, Unit> eitherInitEarly =
        await DeepLinkHandler().initEarly().run();

    await eitherInitEarly.fold(
      (ExceptionWithStackTrace error) =>
          Future<void>.error(error.exception, error.stackTrace),
      (_) {},
    );

    final Either<ExceptionWithStackTrace, Unit> eitherTransferInitialLink =
        DeepLinkHandler().transferInitialLink(ref).run();

    await eitherTransferInitialLink.fold(
      (ExceptionWithStackTrace error) =>
          Future<void>.error(error.exception, error.stackTrace),
      (_) {},
    );

    final Either<ExceptionWithStackTrace, Unit> eitherSetupLink =
        await DeepLinkHandler().setupLinkStream(ref).run();

    await eitherSetupLink.fold(
      (ExceptionWithStackTrace error) =>
          Future<void>.error(error.exception, error.stackTrace),
      (_) {},
    );

    final Either<ExceptionWithStackTrace, Unit> eitherInitServices =
        await _initializeServices().run();
    await eitherInitServices.fold(
      (ExceptionWithStackTrace error) =>
          Future<void>.error(error.exception, error.stackTrace),
      (_) {},
    );

    final Either<ExceptionWithStackTrace, Unit> eitherProcessLinks =
        await DeepLinkHandler().processPendingDeepLinks(ref).run();
    await eitherProcessLinks.fold(
      (ExceptionWithStackTrace error) =>
          Future<void>.error(error.exception, error.stackTrace),
      (_) {},
    );

    return Future<void>.value();
  }

  TaskEither<ExceptionWithStackTrace, Unit> _initializeServices() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          await Future.wait<void>(<Future<void>>[
            ref.read(sharedPreferencesServiceProvider.future),
            ref.read(objectBoxStoreProvider.future),
            ref.read(connectivityStatusProvider.future),
            if (Platform.isAndroid) ref.read(androidDeviceInfoProvider.future) else ref.read(iosDeviceInfoProvider.future),
          ]);

          ref.read(routerProvider);
          ref.read(secureStorageServiceProvider);

          await Future.wait<void>(<Future<void>>[
            ref.read(localeNotifierProvider.future),
            ref.read(themeNotifierProvider.future),
          ]);

          // ref.read(networkConfigSyncProvider);

          return right(unit);
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  Future<void> retry() async {
    state = const AsyncLoading<void>();

    final Either<ExceptionWithStackTrace, Unit> eitherTransferInitialLink =
        DeepLinkHandler().transferInitialLink(ref).run();

    await eitherTransferInitialLink.fold((ExceptionWithStackTrace error) {
      state = AsyncValue<void>.error(error.exception, error.stackTrace);
      return Future<void>.error(error.exception, error.stackTrace);
    }, (_) {});

    final Either<ExceptionWithStackTrace, Unit> eitherSetupLink =
        await DeepLinkHandler().setupLinkStream(ref).run();
    await eitherSetupLink.fold((ExceptionWithStackTrace error) {
      state = AsyncValue<void>.error(error.exception, error.stackTrace);
      return Future<void>.error(error.exception, error.stackTrace);
    }, (_) {});

    final Either<ExceptionWithStackTrace, Unit> eitherInitServices =
        await _initializeServices().run();

    await eitherInitServices.fold((ExceptionWithStackTrace error) {
      state = AsyncValue<void>.error(error.exception, error.stackTrace);
      return Future<void>.error(error.exception, error.stackTrace);
    }, (_) {});

    final Either<ExceptionWithStackTrace, Unit> eitherProcessLinks =
        await DeepLinkHandler().processPendingDeepLinks(ref).run();

    await eitherProcessLinks.fold((ExceptionWithStackTrace error) {
      state = AsyncValue<void>.error(error.exception, error.stackTrace);
      return Future<void>.error(error.exception, error.stackTrace);
    }, (_) {});

    state = const AsyncValue<void>.data(null);
    return Future<void>.value();
  }
}
