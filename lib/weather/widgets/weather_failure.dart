import 'package:flutter/material.dart';

class WeatherFailure extends StatelessWidget {
  const WeatherFailure({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Something went wrong!', style: theme.textTheme.headlineMedium)
      ],
    );
  }
}
