import 'package:flutter/material.dart';
import 'package:windchimes/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_service/local_notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:developer' as developer;

class AlertCard extends StatelessWidget {
  final String name;
  final List<tz.TZDateTime> times;
  final int id;

  const AlertCard({
      required this.name,
      required this.times,
      required this.id,
      super.key
    }
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var clocktimeHR = times[0].hour;
    final clocktimePER = clocktimeHR < 12 ? "AM" : "PM";
    final clocktimeMIN = times[0].minute;
    if (clocktimeHR > 12) {
      clocktimeHR = clocktimeHR - 12;
    }
    if (clocktimeHR == 0) {
      clocktimeHR = 12;
    }
    final Map<dynamic, String> map = {
      1: "Mon.",
      2: "Tues.",
      3: "Wed.",
      4: "Thur.",
      5: "Fri.",
      6: "Sat.",
      7: "Sun.",
    };
    var dayOfWeekText = "";
    for (tz.TZDateTime t in times) {
      dayOfWeekText = dayOfWeekText + map[t.weekday]! + " ";
    }


    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$clocktimeHR:${clocktimeMIN.toString().padLeft(2, '0')} $clocktimePER", 
                  style: theme.textTheme.labelMedium
                ),
                Text(
                  dayOfWeekText,
                  style: theme.textTheme.bodySmall
                )
              ]
            ),
          ),
          IconButton(
            onPressed: () {
              final nc = BlocProvider.of<NotificationCubit>(context);
              nc.removeNotification(id);
            }, 
            icon: const Icon(
              Icons.delete
            )
          )
        ],
      )
    );
  }
}