part of 'cubit.dart';

class NotificationDataProvider {
  static Future<List<NotificationsModel>> showNotifications([Map? map]) async {
    try {
      final resp = await Api.ins.get("/admin/getAllValidNotifications");
      final List raw = resp.data ?? [];
      return raw.map((e) => NotificationsModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

   static Future<GeneralResponse> addNotification([Map? map]) async {
    try {
      final resp = await Api.ins.post("/admin/addNotification", data: map);
      final Map? raw = resp.data;
      return GeneralResponse.fromMap(raw as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

   static Future<GeneralResponse> deleteNotification([Map? map,int? id]) async {
    try {
      final resp = await Api.ins.delete("/admin/deleteNotification/$id",);
      final Map? raw = resp.data;
      return GeneralResponse.fromMap(raw as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
