import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/borrow/presentation/screens/borrow_amount_screen.dart';
import '../../features/borrow/presentation/screens/borrow_screen.dart';
import '../../features/explore/presentation/scrceens/create_token_screen.dart';

import '../../features/explore/presentation/scrceens/explore_dapps_screen.dart';
import '../../features/explore/presentation/scrceens/explore_leaderboard.dart';
import '../../features/explore/presentation/scrceens/explore_market_screen.dart';
import '../../features/explore/presentation/scrceens/explore_nft_screen.dart';
import '../../features/explore/presentation/scrceens/explore_pump_fun_screen.dart';
import '../../features/explore/presentation/scrceens/explore_pump_fun_token_transactions_screen.dart';
import '../../features/explore/presentation/scrceens/explore_screen.dart';

import '../../features/explore/presentation/scrceens/explore_token_screen.dart';
import '../../features/explore/presentation/scrceens/pump_fun_token_preview_screen.dart';
import '../../features/explore/presentation/scrceens/search_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/lend/presentation/screens/lend_amount_screen.dart';
import '../../features/lend/presentation/screens/lend_screen.dart';
import '../../features/nft_info/presentation/nft_audio_screen.dart';
import '../../features/nft_info/presentation/nft_info_screen.dart';
import '../../features/nft_info/presentation/nft_video_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/receive/screens/receive_amount_screen.dart';
import '../../features/receive/screens/receive_screen.dart';
import '../../features/receive/screens/receive_select_screen.dart';
import '../../features/receive/screens/receive_share_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/stake/presentation/stake_amount_screen.dart';
import '../../features/stake/presentation/stake_amount_delegate_screen.dart';
import '../../features/stake/presentation/stake_screen.dart';
import '../../features/swap/presentation/screens/swap_screen.dart';
import '../../features/token_info/presentation/tokens_info_screen.dart';
import '../../features/wallet/presentation/wallet_more_screen.dart';
import '../../features/wallet/presentation/wallet_screen.dart';
import '../../features/wallet/presentation/wallet_search.dart';

import '../../features/watchlist/presentation/watch_list_screen.dart';

part 'explore_route.dart';
part 'generated/router.freezed.dart';
part 'generated/router.g.dart';
part 'home_route.dart';
part 'nft_route.dart';
part 'onboarding_route.dart';
part 'receive_route.dart';
part 'splash_route.dart';
part 'stake_route.dart';
part 'tokens_route.dart';
part 'wallet_route.dart';
part 'lend_route.dart';
part 'borrow_route.dart';
part 'swap_route.dart';

@freezed
class AppRoute with _$AppRoute {
  const factory AppRoute.public({
    required Widget Function(BuildContext, GoRouterState) builder,
    String? redirectIfAuthenticated,
  }) = PublicRoute;
  const factory AppRoute.protected({
    required Widget Function(BuildContext, GoRouterState) builder,
  }) = ProtectedRoute;
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) => GoRouter(
      initialLocation: const TokensInfoRoute().location,
      routes: $appRoutes,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    );