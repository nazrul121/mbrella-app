// api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';
class ApiService {
  static const String apiUrl = 'https://dummyjson.com/users';

  static Future<List<User>> fetchUsers({int page = 0, int pageSize = 10}) async {
    final response = await http.get(Uri.parse('$apiUrl?skip=$page&limit=$pageSize'));
    print(Uri.parse('$apiUrl?skip=$page&limit=$pageSize'));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Access the users list
      if (jsonResponse.containsKey('users') && jsonResponse['users'] != null) {
        List<dynamic> userList = jsonResponse['users'];
        return userList.map((item) => User.fromJson(item)).toList();
      } else {
        throw Exception('Users key is missing or null');
      }
    } else {
      throw Exception('Failed to load users');
    }
  }





}
