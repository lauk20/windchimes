part of 'notification_cubit.dart';

@JsonSerializable()
class NotificationState extends Equatable {
  final List<Notification> notifications;
  static int idCounter = 0;

  const NotificationState({
    required this.notifications,
  });

  factory NotificationState.fromJson(Map<String, dynamic> json) => _$NotificationStateFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationStateToJson(this);

  NotificationState copyWith({
    List<Notification>? notifications,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object> get props => [notifications];
}