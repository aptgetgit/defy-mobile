// lib/features/startup/presentation/widgets/startup_loading_widget.dart
import 'package:flutter/material.dart';

class StartupLoadingWidget extends StatelessWidget {
  const StartupLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}
