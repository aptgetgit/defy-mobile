// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../config/environment/env.dart';

// part 'generated/graphql_provider.g.dart';

// @Riverpod(keepAlive: true)
// class DefyGraphQlClient extends _$DefyGraphQlClient {
//   @override
//   GraphQLClient build() => GraphQLClient(
//       link: HttpLink(Env.defyGraphQlEndpoint, defaultHeaders: {
//         'x-hasura-admin-secret': Env.defyAdminSecret,
//       }),
//       cache: GraphQLCache(store: InMemoryStore()),
//       defaultPolicies: DefaultPolicies(
//           query: Policies(
//               fetch: FetchPolicy.cacheAndNetwork,
//               cacheReread: CacheRereadPolicy.ignoreAll)),
//     );
// }