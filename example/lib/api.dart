import 'package:bflutter_poc/global.dart';
import 'package:http/http.dart' as http;

class Api {
  static final Api _instance = Api._private();

  Api._private();

  factory Api() => _instance;

  final String apiBaseUrl = Global().env.apiBaseUrl;

  Future<http.Response> searchUsers(String query) {
    String url = '$apiBaseUrl/search/users?q=$query';
    return http.get(url);
  }

  Future<http.Response> getUserInfo(String username) {
    return http.get('$apiBaseUrl/users/$username');
  }
}
