import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/di/providers/startup/app_startup_provider.dart';
import 'app_bootstrap_error_widget.dart';
import 'app_bootstrap_loading_widget.dart';

class AppBootstrapWidget extends ConsumerWidget {
  const AppBootstrapWidget({required this.onLoaded, super.key});

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> appStartupState = ref.watch(
      appStartupNotifierProvider,
    );

    return appStartupState.when(
      loading: () => const AppBootstrapLoadingWidget(),
      error:
          (Object error, StackTrace stackTrace) => AppBootstrapErrorWidget(
            message: error.toString(),
            onRetry: () async {
              await ref.read(appStartupNotifierProvider.notifier).retry();
            },
          ),
      data: (_) => onLoaded(context),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<WidgetBuilder>.has('onLoaded', onLoaded));
  }
}
