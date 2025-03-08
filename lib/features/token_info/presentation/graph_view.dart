import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/src/graphql_client.dart';


import '../../../core/providers/graphql_provider.dart';
import '../providers/token_info_controller.dart';

class GraphView extends ConsumerWidget {
  const GraphView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TokensState state = ref.watch(tokensControllerProvider);
    final TokensController controller = ref.read(tokensControllerProvider.notifier);
    final GraphQLClient client = ref.read(defyGraphQlClientProvider);

    return Scaffold(
      body: Center(
        child: Text('Graph View'),
      ),
    );
  }
}
