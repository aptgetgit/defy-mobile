import 'package:hooks_riverpod/hooks_riverpod.dart';

// Wallet model (move from receive_screen.dart to make it globally accessible)
class Wallet {

  Wallet({
    required this.name,
    required this.balance,
    required this.imagePath,
  });
  final String name;
  final String balance;
  final String imagePath;
}

// Default wallets list
final List<Wallet> defaultWallets = <Wallet>[
  Wallet(
    name: 'Business',
    balance: r'$324.00',
    imagePath: 'assets/icons/star-struck.png',
  ),
  Wallet(
    name: 'Savings',
    balance: r'$60.20',
    imagePath: 'assets/icons/face-blowing-kiss.png',
  ),
  Wallet(
    name: 'Personal',
    balance: r'$124.50',
    imagePath: 'assets/icons/star-struck.png',
  ),
];

// Selected wallet notifier
class SelectedWalletNotifier extends StateNotifier<Wallet> {
  SelectedWalletNotifier() : super(defaultWallets[0]);

  void selectWallet(Wallet wallet) {
    state = wallet;
  }
}

// Provider for the selected wallet
final StateNotifierProvider<SelectedWalletNotifier, Wallet> selectedWalletProvider = StateNotifierProvider<SelectedWalletNotifier, Wallet>(
  (StateNotifierProviderRef<SelectedWalletNotifier, Wallet> ref) => SelectedWalletNotifier(),
);

// Provider for available wallets
final Provider<List<Wallet>> availableWalletsProvider = Provider<List<Wallet>>(
  (Ref<List<Wallet>> ref) => defaultWallets,
);
