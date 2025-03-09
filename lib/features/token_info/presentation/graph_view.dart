import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:graphql/src/graphql_client.dart';

// import '../../../core/providers/graphql_provider.dart';
// import '../providers/token_info_controller.dart';

class GraphView extends ConsumerWidget {
  const GraphView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Scaffold(
      body: Center(
        child: Text('Graph View'),
      ),
    );
}
