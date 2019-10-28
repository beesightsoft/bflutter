/*
 * Developed by Nhan Cao on 10/25/19 5:09 PM.
 * Last modified 10/25/19 5:09 PM.
 * Copyright (c) 2019 Beesight Soft. All rights reserved.
 */

class BaseResponse {
  bool error;
  dynamic data;
  List<BaseError> errors;

  BaseResponse({
    this.error,
    this.data,
    this.errors,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        error: json["error"],
        data: json["data"],
        errors: json["errors"] != null
            ? List<BaseError>.from(
                json["errors"].map((x) => BaseError.fromJson(x)))
            : <BaseError>[],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "data": data,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class BaseError {
  int code;
  String message;

  BaseError({
    this.code,
    this.message,
  });

  factory BaseError.fromJson(Map<String, dynamic> json) => BaseError(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
