import 'package:flutter/material.dart';
import 'package:windchimes/weather/widgets/weather_icons.dart';

class DailyWeatherCard extends StatelessWidget {
  final String day;
  final String precipitation;
  final String weathercode;
  final String maxTemp;
  final String minTemp;

  const DailyWeatherCard({
      required this.day, 
      required this.precipitation,
      required this.weathercode,
      required this.maxTemp,
      required this.minTemp,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 16, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              day, 
              style: theme.textTheme.labelSmall
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop_outlined,
                  size: 15,
                ),
                Text('$precipitation%'),
              ],
            ),
          ),
          const Expanded(
            child: WeatherIcons.sunnyIcon,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("$maxTemp°", style: theme.textTheme.labelMedium),
                Text("$minTemp°", style: theme.textTheme.labelMedium),
              ]
            )
          )
        ],
      )
    );
  }
}