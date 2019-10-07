
/// User model: https://flutter.dev/docs/development/data-and-backend/json
class User {
  final String login;
  final String avatarUrl;

  User({this.login, this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        login: json['login'] as String,
        avatarUrl: json['avatar_url'] as String);
  }

  Map<String, dynamic> toJson() => {
    'login': login,
    'avatarUrl': avatarUrl
  };
}
