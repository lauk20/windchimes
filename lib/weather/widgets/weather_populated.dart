import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';
import 'package:windchimes/weather/widgets/weather_icons.dart';

class WeatherPopulated extends StatelessWidget {
  const WeatherPopulated({
    required this.weather,
    required this.units,
    required this.onRefresh,
    required this.location,
    super.key,
  });

  final Weather weather;
  final TemperatureUnits units;
  final ValueGetter<Future<void>> onRefresh;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CurrentWeather currentWeather = weather.currentWeather;
    final HourlyWeather hourlyWeather = weather.hourlyForecast;
    final DailyWeather dailyWeather = weather.dailyForecast;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Weather
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 32),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.name,
                          style: theme.textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        Text(
                          "${currentWeather.temperature.toInt().toString()}°",
                          style: theme.textTheme.displayLarge,
                        ),
                        Text(
                          currentWeather.weathercode,
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: FittedBox(
                      child: WeatherIcons.sunnyIcon
                    )
                  ),
                ]
              )
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
                  ],
                )
              )
            )
          ),

          // Daily Forecast Card
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Card(
              elevation: 0,
              color: theme.colorScheme.onPrimary,
              //color: const Color.fromRGBO(48, 48, 48, 1),
              child: const FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DailyWeatherCard(day: "Monday"),
                            DailyWeatherCard(day: "Tuesday"),
                            DailyWeatherCard(day: "Wednesday"),
                            DailyWeatherCard(day: "Thursday"),
                            DailyWeatherCard(day: "Friday"),
                            DailyWeatherCard(day: "Saturday"),
                            DailyWeatherCard(day: "Sunday"),
                          ]
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

class _WeatherBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.75, 0.90, 1.0],
            colors: [
              color,
              color.brighten(),
              color.brighten(33),
              color.brighten(50),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Color {
  Color brighten([int percent = 10]) {
    assert(
      1 <= percent && percent <= 100,
      'percentage must be between 1 and 100',
    );
    final p = percent / 100;
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}

extension on Weather {
  String formattedTemperature(TemperatureUnits units) {
    return '''${currentWeather.temperature.toStringAsPrecision(2)}°${units == TemperatureUnits.celsius ? 'C' : 'F'}''';
  }
}
