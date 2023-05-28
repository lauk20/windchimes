import 'package:flutter/material.dart';
import 'package:windchimes/weather/widgets/weather_icons.dart';

class DailyWeatherCard extends StatelessWidget {
  final String day;
  const DailyWeatherCard({required this.day, super.key});

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.water_drop_outlined,
                size: 15,
              ),
              Text("100%"),
            ],
          ),
          WeatherIcons.sunnyIcon,
          Text("80° 80°", style: theme.textTheme.labelMedium),
        ],
      )
    );
  }
}