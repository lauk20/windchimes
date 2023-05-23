import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:windchimes/weather/weather.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:windchimes/weather/view/search_view.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({required WeatherRepository weatherRepository, super.key})
      : _weatherRepository = weatherRepository;

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _weatherRepository,
      child: const WeatherAppView()
    );
  }
}

class WeatherAppView extends StatelessWidget {
  const WeatherAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit> (
      create: (context) => WeatherCubit(context.read<WeatherRepository>()),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const WeatherPage(),
      )
    );
  }
}
