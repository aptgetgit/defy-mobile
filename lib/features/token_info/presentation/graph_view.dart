import 'package:defy/core/providers/defy_graphql_provider.dart';
import 'package:defy/features/token_info/providers/token_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GraphView extends ConsumerWidget {
  const GraphView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tokensControllerProvider);
    final controller = ref.read(tokensControllerProvider.notifier);
    final client = ref.read(defyGraphQlClientProvider);

    return Scaffold(
      body: Center(
        child: Text('Graph View'),
      ),
    );
  }
}
