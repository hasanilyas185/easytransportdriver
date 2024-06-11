part of 'cubit.dart';

class NotificationRepository {
  Future<List<NotificationsModel>> showNotifications([Map? map]) =>
      NotificationDataProvider.showNotifications(map);

  Future<GeneralResponse> addNotification([Map? map]) =>
      NotificationDataProvider.addNotification(map);

  Future<GeneralResponse> deleteNotification([Map? map, int? id]) =>
      NotificationDataProvider.deleteNotification(map, id);
}
