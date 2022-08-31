class NotificationModel{
  NotificationModel({this.data});

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      data: (json['data'] != null)
          ? List<NotificationData>.from(
          json['data'].map((x) => NotificationData.fromJson(x)))
          : null,
    );
  }

  List<NotificationData>? data;
}

class NotificationData{
  NotificationData({this.name, this.content, this.day});

  factory NotificationData.fromJson(Map<String, dynamic> json){
    return NotificationData(
      name: json['name'],
      content: json['content'],
      day: json['day']
    );
  }

  String? name;
  String? content;
  String? day;
}