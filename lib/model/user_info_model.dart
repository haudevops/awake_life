class UserInfo {
  UserInfo(
      {this.name,
      this.age,
      this.email,
      this.phone,
      this.dayOfBirth,
      this.imgAvatar});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        name: json['name'],
        age: json['age'],
        email: json['email'],
        phone: json['phone'],
        dayOfBirth: json['dayOfBirth'],
        imgAvatar: json['imageAvatar']);
  }

  String? name;
  String? age;
  String? email;
  String? phone;
  String? dayOfBirth;
  String? imgAvatar;
}
