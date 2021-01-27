import 'package:flutter/material.dart';
import 'package:frontend/models/Producer.model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ProducerService {

  Future<List<Producer>> list_producer() async {

    List<Producer> list;

    var url = "http://192.168.0.107:6000/listProducers";

    var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );

    if (response.statusCode == 200) {
      var producers = json.decode(response.body);

      var rest = producers as List;

      print(rest);

      list = rest.map<Producer>((json) => Producer.fromJson(json)).toList();

      return list;

    } else {
      print("false");
      return null;
    }

  }

}