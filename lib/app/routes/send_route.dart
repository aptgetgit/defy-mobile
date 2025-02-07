part of 'router.dart';

@TypedGoRoute<SendScreenRoute>(path: '/send')
class SendScreenRoute extends GoRouteData {
  const SendScreenRoute();
  @override
  Widget build(context, state) => const SendScreen();
}

@TypedGoRoute<SendToSelfScreenRoute>(path: '/send/send-to-self')
class SendToSelfScreenRoute extends GoRouteData {
  const SendToSelfScreenRoute();
  @override
  Widget build(context, state) => const SendToSelfScreen();
}

@TypedGoRoute<SendToContactsScreenRoute>(path: '/send/send-to-contacts')
class SendToContactsScreenRoute extends GoRouteData {
  const SendToContactsScreenRoute();
  @override
  Widget build(context, state) => const SendToContactsScreen();
}

@TypedGoRoute<SendToFriendsScreenRoute>(path: '/send/send-to-friends')
class SendToFriendsScreenRoute extends GoRouteData {
  const SendToFriendsScreenRoute();
  @override
  Widget build(context, state) => const SendToFriendsScreen();
}