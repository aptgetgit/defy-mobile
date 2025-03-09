import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Activity',
              style: context.headlineLarge,
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Text(
              'This section displays recent activities and interactions within the app. You can present logs, user interactions, or any recent actions taken by the user or the system.',
              style: context.bodyMedium,
            ),
            SizedBox(height: context.screenHeight * 0.025),
            // Example activity list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10, // Replace with actual item count
              itemBuilder: (BuildContext context, int index) => ListTile(
                  leading: const Icon(Icons.event),
                  title: Text('Activity ${index + 1}', style: context.titleMedium),
                  subtitle: Text('Description of activity ${index + 1}', style: context.bodySmall),
                ),
            ),
          ],
        ),
      ),
    );
}
