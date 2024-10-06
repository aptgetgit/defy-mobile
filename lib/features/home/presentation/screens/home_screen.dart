import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:defy/features/authentication/presentation/providers/authentication_notifier.dart';
import 'package:defy/features/authentication/domain/entities/session_entity.dart';
import 'package:defy/core/routes/router.dart';
import 'package:defy/features/shared/presentation/providers/blockchain_network_notifier_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_notifier_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_group_notifier_provider.dart';
import 'package:defy/features/shared/presentation/providers/user_blockchain_account_group_assignment_notifier_provider.dart';
import 'package:defy/features/shared/domain/entities/blockchain_network.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group.dart';
import 'package:defy/features/shared/domain/entities/user_blockchain_account_group_assignment.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authenticationNotifierProvider);
    final networksState = ref.watch(blockchainNetworkNotifierProvider);
    final accountsState = ref.watch(userBlockchainAccountNotifierProvider);
    final groupsState = ref.watch(userBlockchainAccountGroupNotifierProvider);
    final assignmentsState = ref.watch(userBlockchainAccountGroupAssignmentNotifierProvider);

    Future<void> syncAllData() async {
      ref.read(blockchainNetworkNotifierProvider.notifier).refresh();
      ref.read(userBlockchainAccountNotifierProvider.notifier).refresh();
      ref.read(userBlockchainAccountGroupNotifierProvider.notifier).refresh();
      ref.read(userBlockchainAccountGroupAssignmentNotifierProvider.notifier).refresh();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: syncAllData,
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
          authenticated: (session) => _buildAuthenticatedView(context, session, networksState, accountsState, groupsState, assignmentsState),
          orElse: () => const Center(child: Text('Not authenticated')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildAuthenticatedView(
    BuildContext context,
    SessionEntity session,
    AsyncValue<List<BlockchainNetwork>> networksState,
    AsyncValue<List<UserBlockchainAccount>> accountsState,
    AsyncValue<List<UserBlockchainAccountGroup>> groupsState,
    AsyncValue<List<UserBlockchainAccountGroupAssignment>> assignmentsState
  ) {
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
            _buildDataSection('Blockchain Networks', networksState),
            _buildDataSection('Blockchain Accounts', accountsState),
            _buildGroupsSection(groupsState, accountsState, assignmentsState),
          ],
        ),
      ),
    );
  }

  Widget _buildDataSection<T>(String title, AsyncValue<List<T>> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        state.when(
          data: (data) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(data[index].toString()),
                subtitle: Text('ID: ${(data[index] as dynamic).id}'),
              ),
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGroupsSection(
    AsyncValue<List<UserBlockchainAccountGroup>> groupsState,
    AsyncValue<List<UserBlockchainAccount>> accountsState,
    AsyncValue<List<UserBlockchainAccountGroupAssignment>> assignmentsState
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Blockchain Account Groups', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        groupsState.when(
          data: (groups) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: groups.length,
            itemBuilder: (context, index) => _buildGroupTile(groups[index], accountsState, assignmentsState),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ],
    );
  }

  Widget _buildGroupTile(
    UserBlockchainAccountGroup group,
    AsyncValue<List<UserBlockchainAccount>> accountsState,
    AsyncValue<List<UserBlockchainAccountGroupAssignment>> assignmentsState
  ) {
    return ExpansionTile(
      title: Text(group.name),
      children: [
        accountsState.when(
          data: (accounts) => assignmentsState.when(
            data: (assignments) {
              final groupAssignments = assignments.where((assignment) => assignment.blockchainAccountGroupId == group.id).toList();
              final groupAccounts = accounts.where((account) => 
                groupAssignments.any((assignment) => assignment.blockchainAccountId == account.id)
              ).toList();
              
              return Column(
                children: groupAccounts.map((account) => ListTile(
                  title: Text(account.accountAddress),
                  subtitle: Text('Network ID: ${account.blockchainNetworkId}'),
                )).toList(),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ],
    );
  }
}