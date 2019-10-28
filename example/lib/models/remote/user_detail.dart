/*
 * Developed by Nhan Cao on 10/24/19 5:19 PM.
 * Last modified 10/24/19 5:18 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

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
