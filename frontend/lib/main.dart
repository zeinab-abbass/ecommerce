import 'package:flutter/material.dart';
import 'package:frontend/models/Producer.model.dart';
import 'package:frontend/screens/Home.view.dart';
import 'package:frontend/screens/Login.view.dart';
import 'package:frontend/screens/Logo.view.dart';
import 'package:frontend/screens/Products.view.dart';
import 'package:frontend/screens/SignUp.view.dart';
import 'package:frontend/screens/MainUser.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Logo(),
      routes: {
        SignUp.routeName: (ctx) => SignUp(),
        Login.routeName: (ctx) => Login(),
        MainUser.routeName: (ctx) => MainUser(),
        Products.routeName: (ctx) => Products(),
      },
    );
  }
}

