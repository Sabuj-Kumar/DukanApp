import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LogInApi {
  Future<String> logInDataPost(String email, String pass) async {
    final response = await http.post(
      Uri.parse('https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': pass,
      }),
    );

    debugPrint(response.statusCode.toString());

    try {
      if (response.statusCode == 201) {
        return response.statusCode.toString();
      } else {
        return throw Exception("Something Wrong");
      }
    } catch (e) {
      return throw "Registration not completed.";
    }
  }
}
