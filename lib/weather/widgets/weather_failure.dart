import 'package:flutter/material.dart';

class WeatherFailure extends StatelessWidget {
  const WeatherFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Something went wrong!',
            style: theme.textTheme.titleLarge
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Try reloading the app or checking your connection!',
              style: theme.textTheme.titleSmall
            ),
          ),
        ],
      )
    );
  }
}