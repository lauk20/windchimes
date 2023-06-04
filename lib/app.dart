import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:windchimes/weather/weather.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:windchimes/weather/view/main_view.dart';
import 'package:windchimes/weather/models/notification.dart' as notif;
import 'dart:developer' as developer;

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          lazy: false,
          create: (context) {
            developer.log("inside");
            WeatherCubit wc = WeatherCubit(context.read<WeatherRepository>());
            developer.log(wc.state.toString());
            wc.getWeather(wc.state.selectedCity);
            developer.log(wc.state.weather.toString());
            return wc;
          },
        ),
        BlocProvider<NotificationCubit>(
          lazy: false,
          create: (context) {
            NotificationCubit nc = NotificationCubit();
            final notification = notif.Notification(notificationID: 123, location: Location(
                                    latitude: 12,
                                    longitude: 12,
                                    name: "",
                                    countryId: 123,
                                    admin1: "a",
                                    country: "a",
                                  ));
            nc.addNotification(notification);
            return nc;
          }
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 100, fontWeight: FontWeight.w500),
            titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
            titleMedium: TextStyle(fontSize: 25),
            titleSmall: TextStyle(fontSize: 20),
            labelSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            labelMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Color.fromARGB(255, 255, 255, 255),
            onPrimary: Color.fromARGB(135, 61, 61, 61)
          ),
        ),
        home: const NavigationExample(),
      )
    );
  }
}
