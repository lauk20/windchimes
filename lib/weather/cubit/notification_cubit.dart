import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';
import 'dart:developer' as developer;

part 'notification_state.dart';
part 'notification_cubit.g.dart';

class NotificationCubit extends HydratedCubit<NotificationState> {
  NotificationCubit() : super(const NotificationState(notifications: []));
  
  void addNotification(Notification notif) {
    emit(state.copyWith(notifications: [...state.notifications, notif]));
  }

  void removeNotification(int notificationID) {
    final newList = List<Notification>.from(state.notifications);
    newList.removeWhere((element) => element.notificationID == notificationID);
    emit(state.copyWith(
      notifications: newList,
    ));
  }

   @override
  NotificationState fromJson(Map<String, dynamic> json) => NotificationState.fromJson(json);

  @override
  Map<String, dynamic> toJson(NotificationState state) => state.toJson();
}
