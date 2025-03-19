import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../error/exception_with_stack_trace.dart';
import '../../logging/app_logger.dart';
import '../../providers/deep_link/deep_link_provider.dart';
import '../routes/router.dart';

class DeepLinkHandler {
  factory DeepLinkHandler() => _instance;

  DeepLinkHandler._internal() {
    _appLinks = AppLinks();
  }

  static final DeepLinkHandler _instance = DeepLinkHandler._internal();

  late final AppLinks _appLinks;
  bool _isInitialized = false;

  Option<StreamSubscription<Uri>> _linkStreamSubscription =
      const Option<StreamSubscription<Uri>>.none();

  // Store initial link temporarily during bootstrap
  static Option<Uri> initialLink = const Option<Uri>.none();

  /// Initializes deep link handling early in the bootstrap process
  /// Called before the app's ProviderScope is created
  TaskEither<ExceptionWithStackTrace, Unit> initEarly() =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          if (_isInitialized) {
            return right(unit);
          }
          final Uri? initialUri = await _appLinks.getInitialLink();
          initialLink = Option<Uri>.fromNullable(initialUri);
          initialLink.map((Uri uri) {
            AppLogger.info('Captured initial deep link: $uri');
          });
          _isInitialized = true;
          return right(unit);
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> transferInitialLink(Ref ref) =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          initialLink.match(() => null, (Uri uri) {
            ref.read(pendingDeepLinkProvider.notifier).set(Option<Uri>.of(uri));
          });

          initialLink = const Option<Uri>.none();

          return right(unit);
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, Unit> setupLinkStream(Ref ref) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          await _linkStreamSubscription.match(
            () {},
            (StreamSubscription<Uri> subscription) => subscription.cancel(),
          );

          _linkStreamSubscription = Option<StreamSubscription<Uri>>.of(
            _appLinks.uriLinkStream.listen(
              (Uri uri) async {
                if (uri.toString().isEmpty) {
                  return;
                }

                ref
                    .read(pendingDeepLinkProvider.notifier)
                    .set(Option<Uri>.of(uri));
                final Either<ExceptionWithStackTrace, bool> eitherProcessed =
                    await _processDeepLink(uri: uri, ref: ref).run();

                eitherProcessed.fold((ExceptionWithStackTrace e) {
                  AppLogger.error(e.exception, stackTrace: e.stackTrace);
                }, (_) {});
              },
              onError: (Object error, StackTrace stackTrace) {
                AppLogger.error(
                  'Deep link stream error',
                  error: error,
                  stackTrace: stackTrace,
                );
              },
              cancelOnError: false,
            ),
          );

          return right(unit);
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  /// Processes any pending deep links
  /// Called from the AppStartupNotifier after initialization is complete
  TaskEither<ExceptionWithStackTrace, Unit> processPendingDeepLinks(Ref ref) =>
      TaskEither<ExceptionWithStackTrace, Unit>(() async {
        try {
          final Option<Uri> pendingDeepLink = ref.read(pendingDeepLinkProvider);

          await pendingDeepLink.match(() => null, (Uri uri) async {
            final Either<ExceptionWithStackTrace, bool> eitherProcessed =
                await _processDeepLink(uri: uri, ref: ref).run();

            eitherProcessed.fold(left<ExceptionWithStackTrace, Unit>, (
              bool processed,
            ) {
              if (processed) {
                ref.read(pendingDeepLinkProvider.notifier).clear();
              }
            });
          });

          return right(unit);
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  IOEither<ExceptionWithStackTrace, Unit> dispose() =>
      IOEither<ExceptionWithStackTrace, Unit>(() {
        try {
          _linkStreamSubscription.fold(
            () {},
            (StreamSubscription<Uri> subscription) => subscription.cancel(),
          );

          _linkStreamSubscription =
              const Option<StreamSubscription<Uri>>.none();
          return right(unit);
        } on Exception catch (error, stackTrace) {
          return left(ExceptionWithStackTrace(error, stackTrace));
        }
      });

  TaskEither<ExceptionWithStackTrace, bool> _processDeepLink({
    required Uri uri,
    required Ref ref,
  }) => TaskEither<ExceptionWithStackTrace, bool>(() async {
    try {
      final String location = _extractLocation(uri);
      if (location.isEmpty) {
        return right(false);
      }

      final GoRouter router = ref.read(routerProvider);

      try {
        await router.push(location);
        return right(true);
      } on Exception {
        try {
          router.go(location);
          return right(true);
        } on Exception {
          return right(false);
        }
      }
    } on Exception catch (error, stackTrace) {
      AppLogger.error(
        'Error processing deep link',
        error: error,
        stackTrace: stackTrace,
      );
      return right(false);
    }
  });

  String _extractLocation(Uri uri) {
    if (uri.scheme == 'defy') {
      return _formatPath(uri.path);
    }

    if (uri.scheme == 'https' && uri.host == 'defy.trading') {
      final String path = uri.path;
      if (path.startsWith('/defy')) {
        final String remainingPath = path.substring(5);
        return _formatPath(remainingPath);
      }
    }
    return '/';
  }

  String _formatPath(String path) {
    String formattedPath = path;
    if (!formattedPath.startsWith('/')) {
      formattedPath = '/$formattedPath';
    }

    if (formattedPath.length > 1 && formattedPath.endsWith('/')) {
      formattedPath = formattedPath.substring(0, formattedPath.length - 1);
    }

    return formattedPath.isEmpty ? '/' : formattedPath;
  }
}
