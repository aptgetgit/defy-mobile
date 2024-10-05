import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/domain/usecases/user_blockchain_account_usecase.dart';
import 'package:defy/features/shared/presentation/providers/blockchain_network_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_notifier.dart';
import 'package:defy/features/authentication/domain/entities/session_entity.dart';
import 'package:defy/core/routes/router.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authenticationNotifierProvider);
    final syncNetworks = ref.watch(syncBlockchainNetworksUseCaseProvider);
    final saveLocalUserBlockchainAccount =
        ref.watch(saveLocalUserBlockchainAccountUseCaseProvider);
    final listLocalUserBlockchainAccounts =
        ref.watch(listLocalUserBlockchainAccountsUseCaseProvider);

    // Function to trigger the sync and save a new account
    Future<void> syncBlockchainNetworks() async {
      await syncNetworks.call();
      saveLocalUserBlockchainAccount.call(UserBlockchainAccount(
        id: "01925a28-aa96-7b49-b5cd-6e011db5db58",
        accountAddress:
            "0xed8c46bec9dbc2b23c60568f822b95b87ea395f7e3fdb5e3adc0a30c55c0a60e",
        blockchainNetworkId: "018df480-9d84-7c21-8e74-cd2adba0a0c1",
      ));
      // Refresh the UI to show the newly added account
      ref.refresh(listLocalUserBlockchainAccountsUseCaseProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: syncBlockchainNetworks,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await ref.read(authenticationNotifierProvider.notifier).logout();
              if (context.mounted) {
                AuthenticationRoute().pushReplacement(context);
              }
            },
          ),
        ],
      ),
      body: authState.when(
        data: (state) => state.maybeWhen(
          authenticated: (session) => _buildAuthenticatedView(session, listLocalUserBlockchainAccounts),
          orElse: () => const Center(child: Text('Not authenticated')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildAuthenticatedView(SessionEntity session, ListLocalUserBlockchainAccountsUseCase listAccounts) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome, ${session.identity.id}!',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('Session ID: ${session.id}'),
            Text('Expires at: ${session.expiresAt}'),
            Text('Authentication Level: ${session.authenticatorAssuranceLevel}'),
            const SizedBox(height: 20),
            const Text('Local Blockchain Accounts:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildLocalAccountsList(listAccounts),
          ],
        ),
      ),
    );
  }

  Widget _buildLocalAccountsList(ListLocalUserBlockchainAccountsUseCase listAccounts) {
    final accounts = listAccounts.call();
    
    if (accounts.isEmpty) {
      return const Text('No local blockchain accounts found.');
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: accounts.length,
      itemBuilder: (context, index) {
        final account = accounts[index];
        return Card(
          child: ListTile(
            title: Text('Account ${index + 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${account.id}'),
                Text('Address: ${account.accountAddress}'),
                Text('Network ID: ${account.blockchainNetworkId}'),
              ],
            ),
          ),
        );
      },
    );
  }
}