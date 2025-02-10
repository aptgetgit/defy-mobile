import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gql_link/gql_link.dart';
import 'dart:developer' as developer;
import 'package:gql/language.dart' as gql;

part 'generated/tradeport_graphql_provider.g.dart';

class LoggingLink extends Link {
  final Link link;

  LoggingLink(this.link);

  @override
  Stream<Response> request(Request request, [forward]) async* {
    final queryString = gql.printNode(request.operation.document);
    developer.log('Outgoing GraphQL request:', name: 'GraphQL', error: '''
Query: $queryString
Variables: ${request.variables}
      ''');

    final response = await link.request(request, forward).first;

    developer.log('Incoming GraphQL response:', name: 'GraphQL', error: '''
Data: ${response.data}
Errors: ${response.errors}
      ''');

    yield response;
  }
}

@riverpod
GraphQLClient tradeportGraphQLClient(TradeportGraphQLClientRef ref) {
  final HttpLink httpLink = HttpLink(
    'https://api.indexer.xyz/graphql',
    defaultHeaders: {
      'Content-Type': 'application/json',
      'x-api-user': "Defy",
      'x-api-key': "s3Z2Xw1.17c86d6a8315fc025e4a475ffd4c6608",
    },
  );

  final Link link = LoggingLink(httpLink);

  return GraphQLClient(
    link: link,
    cache: GraphQLCache(),
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.noCache),
    ),
    // Add this line to prevent automatic __typename fields
  );
}
