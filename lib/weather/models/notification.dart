import 'package:json_annotation/json_annotation.dart';
import 'package:timezone/timezone.dart' as tz;
import 'models.dart';
import 'package:flutter/material.dart';

part 'notification.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Notification {
  final int notificationID;
  final List<tz.TZDateTime> dateAndTimes = [];
  final Location location;
  final String name = '';
  bool on = false;

  Notification({
    required this.notificationID,
    required this.location,
  });

  void addDateAndTimes(List<tz.TZDateTime> times) {

    for (int i = 0; i < times.length; i++) {
      dateAndTimes.add(times[i]);
    }
  }

  static List<tz.TZDateTime> getDateTime({
    required sunday,
    required monday,
    required tuesday,
    required wednesday,
    required thursday,
    required friday,
    required saturday,
    required TimeOfDay selectedTime,
  }) {
    List<tz.TZDateTime> result = [];
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    
    // get next instance of selected time
    tz.TZDateTime scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    // Sunday
    if (sunday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.sunday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    // Monday
    if (monday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.monday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    // Tuesday
    if (tuesday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.tuesday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    // Wednesday
    if (wednesday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.wednesday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    // Thursday
    if (thursday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.thursday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    // Friday
    if (friday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.friday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    // Saturday
    if (saturday) {
      tz.TZDateTime scheduled = scheduledTime;
      while (scheduled.weekday != DateTime.saturday) {
        scheduled = scheduled.add(const Duration(days: 1));
      }
      result.add(scheduled);
    }

    return result;
  }

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}