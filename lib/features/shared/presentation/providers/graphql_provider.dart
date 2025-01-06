import 'package:defy/config/env.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/graphql_provider.g.dart';


@Riverpod(keepAlive: true)
class DefyGraphQlClient extends _$DefyGraphQlClient {
  @override
  GraphQLClient build() {
    return GraphQLClient(
      link: HttpLink(Env.defyGraphQlEndpoint, defaultHeaders: {
        'x-hasura-admin-secret': Env.defyAdminSecret,
      }),
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
          query: Policies(
              fetch: FetchPolicy.cacheAndNetwork,
              cacheReread: CacheRereadPolicy.ignoreAll)),
    );
  }
}

@Riverpod(keepAlive: true)
class AptosGraphQlClient extends _$AptosGraphQlClient {
  @override
  GraphQLClient build() {
    return GraphQLClient(
      link: HttpLink(Env.aptosGraphQlEndpoint),
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
          query: Policies(
              fetch: FetchPolicy.cacheAndNetwork,
              cacheReread: CacheRereadPolicy.ignoreAll)),
    );
  }
}

@Riverpod(keepAlive: true)
class TradePortGraphQlClient extends _$TradePortGraphQlClient {
  @override
  GraphQLClient build() {
    final AuthLink authLinkApiKey = AuthLink(
      getToken: () {
        return 'x-api-key: ${Env.tradePortApiKey}';
      },
    );
    final AuthLink authLinkUser = AuthLink(
      getToken: () {
        return 'x-api-user: ${Env.tradePortApiUser}';
      },
    );
    return GraphQLClient(
      // link: HttpLink(Env.tradePortGraphQlEndpoint, defaultHeaders: {
      //   'x-api-key': Env.tradePortApiKey,
      //   'x-api-user': Env.tradePortApiUser,
      // }),
      link: authLinkApiKey.concat(authLinkUser).concat(HttpLink(Env.tradePortGraphQlEndpoint)),
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: DefaultPolicies(
          query: Policies(
              fetch: FetchPolicy.cacheAndNetwork,
              cacheReread: CacheRereadPolicy.ignoreAll)),
    );
  }
}