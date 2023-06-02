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
        onPressed: () => 0,
      ),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        Navigator.pop(context);
      },
    );
  }
}