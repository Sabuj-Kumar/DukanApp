import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RegistrationApi {
  Future<String> dataPost(
    String? userName,
    String? email,
    String? pass,
  ) async {
    final response = await http.post(
      Uri.parse('https://apptest.dokandemo.com/wp-json/wp/v2/users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': userName!,
        'email': email!,
        'password': pass!
      }),
    );
    debugPrint(response.statusCode.toString());
    try {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);

      if (response.statusCode == 201) {
        return response.statusCode.toString();
      } else {
        return "not registration";
      }
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
