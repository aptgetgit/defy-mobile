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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
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
      body: Center(
        child: authState.when(
          data: (state) => state.maybeWhen(
            authenticated: (session) => _buildAuthenticatedView(session),
            orElse: () => const Text('Not authenticated'),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
    );
  }

  Widget _buildAuthenticatedView(SessionEntity session) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Welcome, ${session.identity.id}!',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text('Session ID: ${session.id}'),
        const SizedBox(height: 10),
        Text('Expires at: ${session.expiresAt}'),
        const SizedBox(height: 10),
        Text('Authentication Level: ${session.authenticatorAssuranceLevel}'),
        const SizedBox(height: 20),
        const Text('This is a placeholder home screen for testing.',
            style: TextStyle(fontStyle: FontStyle.italic)),
      ],
    );
  }
}