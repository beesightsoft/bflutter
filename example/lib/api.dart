import 'package:bflutter_poc/global.dart';
import 'package:http/http.dart' as http;

class Api {
  // @nhancv 10/7/2019: Create api instance
  Api._private();

  static final Api _instance = Api._private();

  factory Api() => _instance;

  // @nhancv 10/7/2019: Get base url by env
  final String apiBaseUrl = Global().env.apiBaseUrl;

  // @nhancv 10/7/2019: Search user request
  Future<http.Response> searchUsers(String query) {
    String url = '$apiBaseUrl/search/users?q=$query';
    return http.get(url);
  }

  // @nhancv 10/7/2019: Get user info request
  Future<http.Response> getUserInfo(String username) {
    return http.get('$apiBaseUrl/users/$username');
  }
}
