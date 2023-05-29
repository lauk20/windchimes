import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';

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
      padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              day, 
              style: theme.textTheme.labelSmall
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                      size: 15,
                    ),
                    Text('$precipitation%'),
                  ],
                ),
                weathercode.getIcon(),
              ],
            ),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("$maxTemp°", style: theme.textTheme.labelSmall),
                  Text("$minTemp°", style: theme.textTheme.labelSmall),
                ]
              ),
          )
        ],
      )
    );
  }
}