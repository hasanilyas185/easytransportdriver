part of 'cubit.dart';

@immutable
class ShowNotificationsState extends Equatable {
  static bool match(a, b) => a.showNotifications != b.showNotifications;

  final List<NotificationsModel>? data;
  final String? message;

  const ShowNotificationsState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class ShowNotificationsDefault extends ShowNotificationsState {}

@immutable
class ShowNotificationsLoading extends ShowNotificationsState {
  const ShowNotificationsLoading() : super();
}

@immutable
class ShowNotificationsSuccess extends ShowNotificationsState {
  const ShowNotificationsSuccess({List<NotificationsModel>? data})
      : super(data: data);
}

@immutable
class ShowNotificationsFailed extends ShowNotificationsState {
  const ShowNotificationsFailed({String? message}) : super(message: message);
}

@immutable
class AddNotificationState extends Equatable {
  static bool match(a, b) => a.addNotification != b.addNotification;

  final GeneralResponse? data;
  final String? message;

  const AddNotificationState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class AddNotificationDefault extends AddNotificationState {}

@immutable
class AddNotificationLoading extends AddNotificationState {
  const AddNotificationLoading() : super();
}

@immutable
class AddNotificationSuccess extends AddNotificationState {
  const AddNotificationSuccess({GeneralResponse? data}) : super(data: data);
}

@immutable
class AddNotificationFailed extends AddNotificationState {
  const AddNotificationFailed({String? message}) : super(message: message);
}

@immutable
class DeleteNotificationState extends Equatable {
  static bool match(a, b) => a.deleteNotification != b.deleteNotification;

  final GeneralResponse? data;
  final String? message;

  const DeleteNotificationState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class DeleteNotificationDefault extends DeleteNotificationState {}

@immutable
class DeleteNotificationLoading extends DeleteNotificationState {
  const DeleteNotificationLoading() : super();
}

@immutable
class DeleteNotificationSuccess extends DeleteNotificationState {
  const DeleteNotificationSuccess({GeneralResponse? data}) : super(data: data);
}

@immutable
class DeleteNotificationFailed extends DeleteNotificationState {
  const DeleteNotificationFailed({String? message}) : super(message: message);
}

@immutable
class NotificationState extends Equatable {
  final ShowNotificationsState? showNotifications;
  final AddNotificationState? addNotification;
  final DeleteNotificationState? deleteNotification;

  const NotificationState({
    this.showNotifications,
    this.addNotification,
    this.deleteNotification,
  });

  @override
  List<Object?> get props => [
        showNotifications,
        addNotification,
        deleteNotification,
      ];

  NotificationState copyWith({
    ShowNotificationsState? showNotifications,
    AddNotificationState? addNotification,
    DeleteNotificationState? deleteNotification,
  }) {
    return NotificationState(
      showNotifications: showNotifications ?? this.showNotifications,
      addNotification: addNotification ?? this.addNotification,
      deleteNotification: deleteNotification ?? this.deleteNotification,
    );
  }
}

@immutable
class NotificationStateDefault extends NotificationState {
  const NotificationStateDefault()
      : super(
          showNotifications: const ShowNotificationsState(),
          addNotification: const AddNotificationState(),
          deleteNotification: const DeleteNotificationState()
        );
}
