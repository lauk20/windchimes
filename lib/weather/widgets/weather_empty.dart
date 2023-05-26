import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';

class WeatherEmpty extends StatelessWidget {
  const WeatherEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Weather
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "San Francisco",
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "75°",
                  style: theme.textTheme.displayLarge,
                ),
                Text(
                  "Sunny",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            )
          ),

          // Hourly Forecast Card
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Card(
              elevation: 0,
              color: theme.colorScheme.onPrimary,
              //color: const Color.fromRGBO(48, 48, 48, 1),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Container(
                          //color: Colors.red,
                          /*
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                theme.colorScheme.onPrimaryContainer,
                                Colors.transparent,
                                Colors.transparent,
                                theme.colorScheme.onPrimaryContainer,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0, 0.05, 0.95, 1],
                            ),
                          ),
                          */
                          child: FadingListView(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: const [
                                HourlyWeatherCard(),
                                HourlyWeatherCard(),
                                HourlyWeatherCard(),
                                HourlyWeatherCard(),
                                HourlyWeatherCard(),
                                HourlyWeatherCard(),
                                HourlyWeatherCard(),
                              ]
                            )
                          )
                        )
                      )
                    )
                  ],
                )
              )
            )
          )
        ],
      )
    );
  }
}