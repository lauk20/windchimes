import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';

class LocationResultCard extends StatelessWidget {
  final String name;
  final String admin1;
  final String countryName;

  const LocationResultCard({
      required this.name,
      required this.admin1,
      required this.countryName,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name, 
                  style: theme.textTheme.labelMedium
                ),
                Text(
                  "$admin1, $countryName",
                  style: theme.textTheme.bodySmall
                )
              ]
            ),
          ),
          IconButton(
            onPressed: () => 1, 
            icon: const Icon(
              Icons.add
            )
          )
        ],
      )
    );
  }
}