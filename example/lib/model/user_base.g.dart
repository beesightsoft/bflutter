// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBase _$UserBaseFromJson(Map<String, dynamic> json) {
  return UserBase(json['login'] as String, json['avatar_url'] as String);
}

Map<String, dynamic> _$UserBaseToJson(UserBase instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl
    };
