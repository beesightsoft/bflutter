
/// User detail model: https://flutter.dev/docs/development/data-and-backend/json
class UserDetail {
  final String login;
  final String avatarUrl;
  final String name;
  final String location;

  UserDetail(this.login, this.avatarUrl, this.name, this.location);

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(json['login'] as String, json['avatar_url'] as String,
        json['name'] as String, json['location'] as String);
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'avatarUrl': avatarUrl,
        'name': name,
        'location': location
      };
}
