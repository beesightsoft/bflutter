/*
 * Developed by Nhan Cao on 10/25/19 4:30 PM.
 * Last modified 10/23/19 9:49 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

/// Login in request form data
class LogInRequest {
  final String username;
  final String password;

  LogInRequest(this.username, this.password);

  @override
  String toString() {
    return 'LogInRequest{username: $username, password: $password}';
  }
}
