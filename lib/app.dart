import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 100, fontWeight: FontWeight.w500),
            titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            titleMedium: TextStyle(fontSize: 25),
          ),
          colorScheme: const ColorScheme.dark(
            onPrimary: Color.fromARGB(135, 61, 61, 61)
          )
        ),
        home: const WeatherPage(),
      )
    );
  }
}
