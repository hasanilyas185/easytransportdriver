class NotificationsModel {
  int notificationId;
  String title;
  String description;
  String validFrom;
  String validTill;
  String status;

  NotificationsModel({
    required this.notificationId,
    required this.title,
    required this.description,
    required this.validFrom,
    required this.validTill,
    required this.status,
  });

  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      notificationId: map['NotificationId'],
      title: map['Title'],
      description: map['Description'],
      validFrom: map['ValidFrom'],
      validTill: map['ValidTill'],
      status: map['Status'],
    );
  }

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel.fromMap(json);
  }

  Map<String, dynamic> toMap() {
    return {
      'NotificationId': notificationId,
      'Title': title,
      'Description': description,
      'ValidFrom': validFrom,
      'ValidTill': validTill,
      'Status': status,
    };
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}
