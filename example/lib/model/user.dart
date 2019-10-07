
/// User model: https://flutter.dev/docs/development/data-and-backend/json
class UserBase {
  final String login;
  final String avatarUrl;

  UserBase({this.login, this.avatarUrl});

  factory UserBase.fromJson(Map<String, dynamic> json) {
    return UserBase(
        login: json['login'] as String,
        avatarUrl: json['avatar_url'] as String);
  }

  Map<String, dynamic> toJson() => {
    'login': login,
    'avatarUrl': avatarUrl
  };
}
