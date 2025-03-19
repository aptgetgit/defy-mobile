// lib/features/startup/presentation/widgets/startup_handler_widget.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/providers/startup/app_startup_provider.dart';
import 'startup_error_widget.dart';
import 'startup_loading_widget.dart';

class StartupHandlerWidget extends ConsumerWidget {
  const StartupHandlerWidget({
    required this.onStartupComplete, 
    super.key,
  });

  final WidgetBuilder onStartupComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> startupState = ref.watch(appStartupNotifierProvider);

    return startupState.when(
      loading: () => const StartupLoadingWidget(),
      error: (Object error, StackTrace stackTrace) => StartupErrorWidget(
        errorMessage: error.toString(),
        onRetry: () async {
          await ref.read(appStartupNotifierProvider.notifier).retry();
        },
      ),
      data: (_) => onStartupComplete(context),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<WidgetBuilder>.has('onStartupComplete', onStartupComplete),
    );
  }
}
