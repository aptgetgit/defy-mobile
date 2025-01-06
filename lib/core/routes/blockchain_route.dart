part of 'router.dart';

@TypedGoRoute<AccountDashboardScreenRoute>(path: '/account')
class AccountDashboardScreenRoute extends GoRouteData {
  const AccountDashboardScreenRoute();
  @override
  Widget build(context, state) => AccountDashboardScreen();
}

@TypedGoRoute<WalletCreationScreenRoute>(path: '/wallet-creation')
class WalletCreationScreenRoute extends GoRouteData {
  const WalletCreationScreenRoute();
  @override
  Widget build(context, state) => const WalletCreationScreen();
}

@TypedGoRoute<SeedSelectionScreenRoute>(path: '/seed-selection')
class SeedSelectionScreenRoute extends GoRouteData {
  const SeedSelectionScreenRoute();
  @override
  Widget build(context, state) => const SeedSelectionScreen();
}

@TypedGoRoute<ImportPrivateKeyScreenRoute>(path: '/import-private-key')
class ImportPrivateKeyScreenRoute extends GoRouteData {
  const ImportPrivateKeyScreenRoute();

  @override
  Widget build(context, state) => const ImportPrivateKey();
}

@TypedGoRoute<ImportSeedKeyScreenRoute>(path: '/import-seed-key')
class ImportSeedKeyScreenRoute extends GoRouteData {
  const ImportSeedKeyScreenRoute();

  @override
  Widget build(context, state) => const ImportSeedKeyScreen();
}

@TypedGoRoute<WalletUiScreenRoute>(path: '/wallet')
class WalletUiScreenRoute extends GoRouteData {
  WalletUiScreenRoute();
  @override
  Widget build(context, state) => WalletUiScreen();
}

@TypedGoRoute<SecurityScreenRoute>(path: '/security')
class SecurityScreenRoute extends GoRouteData {
  SecurityScreenRoute();
  @override
  Widget build(context, state) => SecurityScreen();
}

@TypedGoRoute<ManageWalletScreenRoute>(path: '/manage')
class ManageWalletScreenRoute extends GoRouteData {
  ManageWalletScreenRoute();
  @override
  Widget build(context, state) => ManageWalletScreen();
}

@TypedGoRoute<RotateKeyScreenRoute>(path: '/rotate-key')
class RotateKeyScreenRoute extends GoRouteData {
  RotateKeyScreenRoute();
  @override
  Widget build(context, state) => RotateKeyScreen();
}

@TypedGoRoute<ConnectionScreenRoute>(path: '/connections')
class ConnectionScreenRoute extends GoRouteData {
  ConnectionScreenRoute();
  @override
  Widget build(context, state) => ConnectionScreen();
}