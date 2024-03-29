import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:notification_service/local_notification_service.dart';
import '../models/models.dart';
import 'dart:developer' as developer;

part 'notification_state.dart';
part 'notification_cubit.g.dart';

class NotificationCubit extends HydratedCubit<NotificationState> {
  NotificationCubit() : super(const NotificationState(notifications: []));
  
  void addNotification(Notification notif) {
    NotificationService.scheduleNotif(
      notif.dateAndTimes,
      notif.notificationID,
      "Notif Title",
      "Notif Body",
    );
    emit(state.copyWith(notifications: [...state.notifications, notif]));
    NotificationState.idCounter += 1;
  }

  void removeNotification(int notificationID) {
    final newList = List<Notification>.from(state.notifications);
    newList.removeWhere((element) => element.notificationID == notificationID);
    NotificationService.removeNotif(notificationID);
    emit(state.copyWith(
      notifications: newList,
    ));
  }

  @override
  NotificationState fromJson(Map<String, dynamic> json) => NotificationState.fromJson(json);

  @override
  Map<String, dynamic> toJson(NotificationState state) => state.toJson();
}
