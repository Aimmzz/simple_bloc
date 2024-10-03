import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm/models/users.dart';

class UserService {
  static Future<List<Users>> getUsersFromApi() async {
  try {
    Uri apiUrl = Uri.parse('https://reqres.in/api/users');
    var apiResult = await http.get(apiUrl);

    if (apiResult.statusCode == 200) {
      var jsonObject = jsonDecode(apiResult.body);
      var usersData = (jsonObject['data'] as List)
          .map((user) => Users.createUser(user))
          .toList();
      return usersData;
    } else {
      throw Exception('Failed to fetch users');
    }
  } catch (e) {
    print('Error fetching users: $e');
    throw Exception('Error fetching users');
  }
}

  static Future<Users?> getUserFromApi(int id) async {
    try {
      Uri apiUrl = Uri.parse('https://reqres.in/api/users/' + id.toString());

      var apiResult = await http.get(apiUrl);

      if (apiResult.statusCode == 200) {
        var jsonObject = jsonDecode(apiResult.body);
        var userData = (jsonObject as Map<String, dynamic>)['data'];

        return Users.createUser(userData);  // Panggil factory method dari model
      } else {
        print('Failed to load user: ${apiResult.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
}
