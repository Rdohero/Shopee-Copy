import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoope_copy/Api/api_utama.dart';
import 'package:shoope_copy/Api/model/user_model.dart';

class ControllerListUser extends GetxController {
  updateUserData(String fullname) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var id = await pref.getInt("ID");
      var body = {
        'fullname': fullname,
      };

      http.Response response = await http.put(
        Uri.parse('${CalculateLuasApi.baseUrl}/user/fullname/${id.toString()}'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
      } else {
        throw jsonDecode(response.body)['meta']["message"] ??
            "Unknown Error Occured";
      }
    } catch (e) {
      print(e);
    }
  }
}

Future<List<User>> getUserByID() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var id = await pref.getInt("ID");
  final response = await http.get(
      Uri.parse('${CalculateLuasApi.baseUrl}/user/${id.toString()}'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = jsonDecode(response.body);
    return responseData.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load siswa');
  }
}

class Api {
  static var id = 0;
  static var tok1 = "";
  static var eror2 = "";
  static var tok = "";
  static var eror = "";

  static Future<http.Response> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('${CalculateLuasApi.baseUrl}/login'),
      body: {'Email' : email, 'Password': password},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      tok1 = jsonResponse["Token"];
      id = jsonResponse["ID"];
    } else {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      eror2 = jsonResponse["Error"];
    }

    return response;
  }

  static Future<http.Response> registerUser(String fullname, String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('${CalculateLuasApi.baseUrl}/signup'),
      body: {
        'Fullname': fullname,
        'Username': username,
        'Email': email,
        'Password': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      tok = jsonResponse["Status"];
    } else {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      eror = jsonResponse["Error"];
    }

    return response;
  }
}