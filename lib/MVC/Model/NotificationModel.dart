import 'dart:convert';

class NotificationModel {
  String title;
  String description;

  NotificationModel({required this.title, required this.description});

  factory NotificationModel.fromJson(Map<String, dynamic> jsonData) {
    return NotificationModel(
      title: jsonData['title'],
      description: jsonData['description'],
    );
  }

  static Map<String, dynamic> toMap(NotificationModel notificationModel) => {
        'title': notificationModel.title,
        'description': notificationModel.description,
      };

  static String encode(List<NotificationModel> notifiaction) => json.encode(
        notifiaction
            .map<Map<String, dynamic>>(
                (notification) => NotificationModel.toMap(notification))
            .toList(),
      );

  static List<NotificationModel> decode(String notification) =>
      (json.decode(notification) as List<dynamic>)
          .map<NotificationModel>((item) => NotificationModel.fromJson(item))
          .toList();
}
