import 'package:flutter/material.dart';

class AppBootstrapLoadingWidget extends StatelessWidget {
  const AppBootstrapLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    home: Scaffold(body: Center(child: CircularProgressIndicator())),
  );
}
