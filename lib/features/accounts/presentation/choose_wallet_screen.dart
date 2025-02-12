// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';
// import 'package:flutter_swiper_view/flutter_swiper_view.dart';

// import '../../../config/theme/colors.dart';
// import '../../../core/logging/app_logger.dart';
// import '../../../shared/account/domain/entities/account_address.dart';
// import '../../../shared/account/domain/entities/aptos_account_with_metadata.dart';
// import '../../../shared/account/domain/entities/authentication_key.dart';
// import '../../../shared/account/domain/entities/authentication_key_scheme.dart';
// import '../../common/presentation/widgets/black_button.dart';

// class ChooseWalletScreen extends ConsumerStatefulWidget {
//   const ChooseWalletScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       ChooseWalletScreenState();
// }

// class ChooseWalletScreenState extends ConsumerState<ChooseWalletScreen> {
//   int _currentIndex = 0;

//   // Temporary mock data
//   final List<AptosAccountWithMetadata> mockWallets = <AptosAccountWithMetadata>[
//     AptosAccountWithMetadata(
//         label: 'Wallet 1',
//         accountAddress: AccountAddress(bytes: Uint8List(32)),
//         iconUri: Uri.parse(''),
//         authenticationKey: AuthenticationKey(bytes: Uint8List(32)),
//         authenticationKeyScheme: AuthenticationKeyScheme.ed25519),
//     AptosAccountWithMetadata(
//         label: 'Wallet 2',
//         accountAddress: AccountAddress(bytes: Uint8List(32)),
//         iconUri: Uri.parse(''),
//         authenticationKey: AuthenticationKey(bytes: Uint8List(32)),
//         authenticationKeyScheme: AuthenticationKeyScheme.ed25519),
//     AptosAccountWithMetadata(
//         label: 'Wallet 3',
//         accountAddress: AccountAddress(bytes: Uint8List(32)),
//         iconUri: Uri.parse(''),
//         authenticationKey: AuthenticationKey(bytes: Uint8List(32)),
//         authenticationKeyScheme: AuthenticationKeyScheme.ed25519),
//   ];

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Choose Wallet',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               color: Colors.black,
//             ),
//           ),
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: const Icon(
//               PhosphorIconsBold.caretLeft,
//               size: 24,
//             ),
//           ),
//         ),
//         body: Column(
//           children: <Widget>[
//             const SizedBox(height: 16),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: Text(
//                 'Swipe to choose the wallet. You can change them anytime',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.greyLight,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: Swiper(
//                 loop: false,
//                 itemBuilder: (BuildContext context, int index) =>
//                     _buildWalletCard(mockWallets[index]),
//                 itemCount: mockWallets.length,
//                 itemWidth: MediaQuery.of(context).size.width * 0.85,
//                 itemHeight: MediaQuery.of(context).size.height * 0.2,
//                 layout: SwiperLayout.CUSTOM,
//                 scrollDirection: Axis.vertical,
//                 onIndexChanged: (int index) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: mockWallets
//                   .asMap()
//                   .entries
//                   .map((MapEntry<int, AptosAccountWithMetadata> entry) =>
//                       Container(
//                         width: 8,
//                         height: 8,
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: _currentIndex == entry.key
//                               ? AppColors.blue
//                               : AppColors.greyLight,
//                         ),
//                       ))
//                   .toList(),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: BlackButtonXL(
//                 onClick: () {
//                   AppLogger.debug(
//                       'Selected wallet: ${mockWallets[_currentIndex].label}');
//                 },
//                 title: 'Continue',
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       );

//   Widget _buildWalletCard(AptosAccountWithMetadata account) => Container(
//         height: 200,
//         decoration: BoxDecoration(
//           color: AppColors.blue,
//           image: const DecorationImage(
//             image: AssetImage(
//               'assets/images/wallet-creation-wallet-background-wallet-component.png',
//             ),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(left: 110, top: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     account.label,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.white,
//                     ),
//                   ),
//                   Text(
//                     _truncateAddress(account.accountAddress.toHex()),
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );

//   String _truncateAddress(String address) {
//     if (address.length > 10) {
//       return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
//     }
//     return address;
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../../core/logging/app_logger.dart';
import '../../../shared/account/domain/entities/aptos_account_with_metadata.dart';
import '../../../shared/account/domain/usecases/list_aptos_account_usecase.dart';
import '../../../shared/account/presentation/providers/usecase_provider.dart';
import '../../common/presentation/widgets/black_button.dart';

class ChooseWalletScreen extends ConsumerStatefulWidget {
  const ChooseWalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ChooseWalletScreenState();
}

class ChooseWalletScreenState extends ConsumerState<ChooseWalletScreen> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    final ListAptosAccountsUseCase listAptosAccountsUseCase =
        ref.watch(listAptosAccountsUseCaseProvider);
    final Future<List<AptosAccountWithMetadata>> accountsFuture =
        listAptosAccountsUseCase.call();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Choose Wallet',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            PhosphorIconsBold.caretLeft,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            const Text(
              'Swipe to choose the wallet. You can change them anytime',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.greyLight,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<AptosAccountWithMetadata>>(
                future: accountsFuture, 
                
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    AppLogger.error(
                        'Error loading accounts: ${snapshot.error}');
                    return Center(child: Text('Error loading accounts'));
                  }
                  final accounts = snapshot.data ?? [];

                  if (accounts.isEmpty) {
                    return const Center(child: Text('No wallets found'));
                  }

                  return CarouselSlider(
                    options: CarouselOptions(height: 200),
                    items: accounts.map(_buildWalletCard).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            BlackButtonXL(
              onClick: () {
                // Handle continue action with selected wallet
              },
              title: 'Continue',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletCard(AptosAccountWithMetadata account) {
    AppLogger.debug('Account Address: ${account.accountAddress.toHex()}');
    AppLogger.debug('Account Label: ${account.label}');
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.blue,
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/wallet-creation-wallet-background-wallet-component.png',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              account.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _truncateAddress(
                account.accountAddress.toHex(),
              ),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateAddress(String address) {
    if (address.length > 10) {
      return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
    }
    return address;
  }
}
