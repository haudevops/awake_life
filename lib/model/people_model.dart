class PeopleModel{
  PeopleModel({this.data});

  factory PeopleModel.fromJson(Map<String, dynamic> json){
    return PeopleModel(
      data: (json['data'] != null)
          ? List<PeopleData>.from(
          json['data'].map((x) => PeopleData.fromJson(x)))
          : null,
    );
  }

  List<PeopleData>? data;
}

class PeopleData{
  PeopleData({this.title, this.day, this.name});

  factory PeopleData.fromJson(Map<String, dynamic> json){
    return PeopleData(
      title: json['title'],
      name: json['name'],
      day: json['day']
    );
  }

  String? title;
  String? name;
  String? day;
}

