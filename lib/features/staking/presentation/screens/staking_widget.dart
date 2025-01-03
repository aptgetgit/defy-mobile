import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class RedScreenError extends StatelessWidget {
  final String message;

  const RedScreenError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '══╡ EXCEPTION CAUGHT BY WIDGET LIBRARY ╞═══════════════════════════════════════════════════════════',
              style: TextStyle(color: Colors.yellow[200], fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              '════════════════════════════════════════════════════════════════════════════════════════════════════',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'When the exception was thrown, this was the stack:',
              style: TextStyle(color: Colors.yellow[200]),
            ),
            const SizedBox(height: 8),
            Text(
              '#0      Out of Resource \n'
              '#1      Build method of widget\n'
              '#2      ...',
              style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
            ),
            const SizedBox(height: 16),
            const Text(
              '════════════════════════════════════════════════════════════════════════════════════════════════════',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}