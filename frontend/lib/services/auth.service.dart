import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  Future<dynamic> signup(username, email, password, role) async {
    var url = "http://192.168.0.107:6000/signup";

    var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
          'role': role
        })
    );

    if (response.statusCode == 201) {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      print("false hi");
      return null;
    }
  }

  Future<dynamic> login(email, password) async {

    var url = "http://192.168.0.107:6000/login";

    var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        })
    );

    if (response.statusCode == 201) {
      print(jsonDecode(response.body));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var parse = jsonDecode(response.body);
      await prefs.setString('token', parse["token"]);

      print(parse["token"]);

      return parse["token"];

    } else {
      print("false");
      return null;
    }
  }
}