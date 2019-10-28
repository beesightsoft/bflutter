/*
 * Developed by Nhan Cao on 10/28/19 11:06 AM.
 * Last modified 10/28/19 8:35 AM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

/*
Error
{
    "error": true,
    "data": null,
    "errors": [
        {
            "code": 1029,
            "message": "User not found!."
        }
    ]
}

Successful
{
    "token_type": "Bearer",
    "expires_in": 1295998,
    "access_token": "nhancv_dep_trai",
    "refresh_token": "call_nhancv_dep_trai"
}

 */

import 'package:bflutter_poc/models/remote/base_response.dart';

class LoginResponse extends BaseResponse {
  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;

  LoginResponse({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
    error,
    data,
    errors,
  }) : super(error: error, data: data, errors: errors);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        error: json["error"],
        data: json["data"],
        errors: json["errors"] != null
            ? List<BaseError>.from(
                json["errors"].map((x) => BaseError.fromJson(x)))
            : <BaseError>[],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "error": error,
        "data": data,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}
