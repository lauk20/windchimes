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
    return ListTile(
      title: Text(location.name),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        Navigator.pop(context);
      },
    );
  }
}