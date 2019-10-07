import 'package:json_annotation/json_annotation.dart';

part 'user_base.g.dart';

@JsonSerializable()
class UserBase {
  UserBase(this.login, this.avatarUrl);

  String login;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UserBase.fromJson(Map<String, dynamic> json) =>
      _$UserBaseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserBaseToJson(this);

  @override
  String toString() {
    return 'UserBase{login: $login, avatarUrl: $avatarUrl}';
  }
}
