import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';

class HourlyWeatherCard extends StatelessWidget {
  final int temperature;
  final int precipitation;
  final String weathercode;
  final String time;

  const HourlyWeatherCard({
    super.key,
    required this.temperature,
    required this.precipitation,
    required this.weathercode,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SizedBox(
        width: 65,
        child: Column(
          children: [
            Text(
              time, 
              style: theme.textTheme.labelSmall
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  child: weathercode.getIcon(),
                )
              )
            ),
            Text(
              "${temperature.toString()}°", 
              style: theme.textTheme.labelMedium
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop_outlined,
                  size: 15,
                ),
                Text(
                  "${precipitation.toString()}%", 
                  style: theme.textTheme.labelSmall
                ),
              ],
            )
          ],
        )
      )
    );
  }
}