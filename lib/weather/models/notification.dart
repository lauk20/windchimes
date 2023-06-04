import 'package:json_annotation/json_annotation.dart';
import 'package:timezone/timezone.dart' as tz;
import 'models.dart';

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

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}