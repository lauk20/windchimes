import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationListTile extends StatelessWidget {
  final Location location;

  const LocationListTile({
    required this.location,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      title: Text(location.name, style: theme.textTheme.labelMedium),
      subtitle: Text('${location.admin1}, ${location.country}', style: theme.textTheme.bodySmall),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          final WeatherCubit wc = BlocProvider.of<WeatherCubit>(context);
          if (wc.state.selectedCities.length == 1) {
            return;
          }
          wc.removeLocation(location.name);
        }
      ),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        final WeatherCubit wc = BlocProvider.of<WeatherCubit>(context);
        wc.setLocation(location);
        wc.getWeather(location);
        Navigator.pop(context);
      },
    );
  }
}