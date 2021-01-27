import 'package:flutter/material.dart';
import 'package:frontend/models/Token.model.dart';
import 'package:frontend/services/auth.service.dart';

import 'Login.view.dart';

class SignUp extends StatefulWidget {
  static const String id = '/signup';
  static const routeName = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  AuthService _authService = AuthService();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _usernameController = new TextEditingController();
  String role = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        backgroundColor: Colors.indigo.shade800,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            color: Colors.white,
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      width: 200
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      controller: _usernameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'UserName',
                        contentPadding: const EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email Address',
                        contentPadding: const EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      controller: _passwordController,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Confirm Password',
                        contentPadding: const EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(5),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            RaisedButton.icon(
                              onPressed: (){ role = "customer"; },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              label: Text('Customer',
                                style: TextStyle(color: Colors.white),),
                              icon: Icon(Icons.account_circle, color:Colors.white,),
                              textColor: Colors.white,
                              color: Colors.grey,
                            ),

                            SizedBox(
                              width: 20,
                            ),

                            RaisedButton.icon(
                              onPressed: (){ role = "producer"; },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              label: Text('Producer',
                                style: TextStyle(color: Colors.white),),
                              icon: Icon(Icons.account_circle, color:Colors.white,),
                              textColor: Colors.white,
                              color: Colors.grey,
                            ),

                          ],
                        ),
                      ),

                    SizedBox(
                      height: 20,
                    ),


                    FlatButton(
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(15),
                      textColor: Colors.white,
                      color: Colors.indigo.shade800,
                      onPressed: () {
                        if (role != "") {
                          Future<dynamic> res = _authService.signup(
                              _usernameController.text.toString().trim(),
                              _emailController.text.toString().trim(),
                              _passwordController.text.toString().trim(), role);
                          if (res != null) Navigator.of(context).pushNamed(Login.routeName);
                        }
                      }
                    )
                  ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
