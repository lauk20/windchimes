import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';
import 'package:windchimes/weather/widgets/weather_icons.dart';
import 'dart:developer' as developer;

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

    developer.log(hourlyWeather.times.toString());

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
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.5
                    ),
                    //flex: 1,
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
                          overflow: TextOverflow.clip,
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
                            children: hourlyWeather.times.asMap().entries.map((e) {
                              int index = e.key;
                              String time = e.value;
                              
                              return HourlyWeatherCard(
                                temperature: hourlyWeather.temperatures[index].toInt(), 
                                precipitation: hourlyWeather.precipitationProbabilities[index].toInt(),
                                weathercode: hourlyWeather.weatherCodes[index],
                                time: time,
                              );
                            }).toList(),
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
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 320,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: dailyWeather.times.asMap().entries.map((e) {
                            int index = e.key;
                            String time = e.value;
                            
                            return DailyWeatherCard(
                              minTemp: dailyWeather.temperaturesMin[index].toInt().toString(), 
                              maxTemp: dailyWeather.temperaturesMax[index].toInt().toString(),
                              precipitation: hourlyWeather.precipitationProbabilities[index].toInt().toString(),
                              weathercode: hourlyWeather.weatherCodes[index],
                              day: index == 0 ? "Today" : time,
                            );
                          }).toList(),
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

extension on WeatherCode {
  Icon getIcon() {
    switch(this) {
      case (WeatherCode.clearSky):
        return WeatherIcons.sunnyIcon;
      case (WeatherCode.mainlyClear):
        return WeatherIcons.sunnyIcon;
      case (WeatherCode.partlyCloudy):
        return WeatherIcons.partlyCloudyIcon;
      case (WeatherCode.overcast):
        return WeatherIcons.cloudyIcon;
      case (WeatherCode.fog):
        return WeatherIcons.foggyIcon;
      case (WeatherCode.drizzle):
        return WeatherIcons.rainIcon;
      case (WeatherCode.rain):
        return WeatherIcons.rainIcon;
      case (WeatherCode.snow):
        return WeatherIcons.snowIcon;
      case (WeatherCode.thunderstorm):
        return WeatherIcons.thunderstormIcon;
      default:
        return WeatherIcons.sunnyIcon;
    }
  }
}
