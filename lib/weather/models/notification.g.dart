// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      notificationID: json['notification_i_d'] as int,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    )..on = json['on'] as bool;

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'notification_i_d': instance.notificationID,
      'location': instance.location,
      'on': instance.on,
    };
