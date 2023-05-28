import 'package:flutter/material.dart';
import 'package:windchimes/weather/widgets/weather_icons.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard({super.key});

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
              "12 PM", 
              style: theme.textTheme.labelSmall
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: FittedBox(
                  child: WeatherIcons.sunnyIcon
                )
              )
            ),
            Text(
              "80°", 
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
                  "100%", 
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