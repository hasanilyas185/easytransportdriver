import 'dart:async';
import 'package:easy_transport_driver/models/general.dart';
import 'package:easy_transport_driver/models/notifcation.dart';
import 'package:easy_transport_driver/services/api.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  static NotificationCubit c(BuildContext context, [bool listen = false]) {
    return BlocProvider.of<NotificationCubit>(context, listen: listen);
  }

  NotificationCubit() : super(const NotificationStateDefault());

  final repo = NotificationRepository();

  Future<void> showNotification() async {
    emit(state.copyWith(
      showNotifications: const ShowNotificationsLoading(),
    ));
    try {
      final data = await repo.showNotifications();
      emit(state.copyWith(
        showNotifications: ShowNotificationsSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        showNotifications: ShowNotificationsFailed(message: e.toString()),
      ));
    }
  }

  Future<void> addNotification(Map? map) async {
    emit(state.copyWith(
      addNotification: const AddNotificationLoading(),
    ));
    try {
      final data = await repo.addNotification(map);
      emit(state.copyWith(
        addNotification: AddNotificationSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        addNotification: AddNotificationFailed(message: e.toString()),
      ));
    }
  }

  Future<void> deleteNotification({Map? map, int? id}) async {
    emit(state.copyWith(
      deleteNotification: const DeleteNotificationLoading(),
    ));
    try {
      final data = await repo.deleteNotification(map, id);
      emit(state.copyWith(
        deleteNotification: DeleteNotificationSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        deleteNotification: DeleteNotificationFailed(message: e.toString()),
      ));
    }
  }
}
