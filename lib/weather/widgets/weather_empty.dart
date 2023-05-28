import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';
import 'package:windchimes/weather/widgets/weather_icons.dart';

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
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "-",
                          style: theme.textTheme.titleSmall,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        Text(
                          "-",
                          style: theme.textTheme.displayLarge,
                        ),
                        Text(
                          "-",
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