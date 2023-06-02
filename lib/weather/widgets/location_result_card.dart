import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class LocationResultCard extends StatelessWidget {
  final String name;
  final String admin1;
  final String countryName;
  final Location location;

  const LocationResultCard({
      required this.name,
      required this.admin1,
      required this.countryName,
      required this.location,
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
            onPressed: () {
              final wc = BlocProvider.of<WeatherCubit>(context);
              developer.log(wc.state.toString() + "ASDFSADFSDF");
              if (wc.state.selectedCities.contains(location)) return;
              wc.addLocation(location);
            }, 
            icon: const Icon(
              Icons.add
            )
          )
        ],
      )
    );
  }
}