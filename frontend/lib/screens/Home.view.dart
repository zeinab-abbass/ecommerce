import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/models/Slide.model.dart';
import 'package:frontend/widgets/Home/SlideItem.widget.dart';
import 'package:frontend/widgets/Home/SlideDot.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Login.view.dart';
import 'SignUp.view.dart';
import 'MainUser.view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final FirebaseAuth _auth = FirebaseAuth.instance; 
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<String> signInWithGoogle()  async {

    try {
        final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn(); 
        final GoogleSignInAuthentication googleSignInAuthentication = 
          await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential
        (
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        ); 
        final AuthResult authResult = await FirebaseAuth.instance.signInWithCredential(credential); 
        final FirebaseUser user = authResult.user; 

        assert(!user.isAnonymous); 
        assert(await user.getIdToken() != null); 

        final FirebaseUser currentUser = await _auth.currentUser();
        assert(user.uid == currentUser.uid); 
        print(">>>>>>>>>>>>>>>>>>>>>>> done successfully!!!");
        return 'signInWithGoogle succeeded: $user'; 
        }catch  (e) {
          print('Failed with error code: ${e.code}');
          print(e.message);
        }
      }

  void signOutGoogle() async { 
    await _googleSignIn.signOut();

    print("User Sign Out"); 
  }

  Widget _signInButton(){
      return Center(
        child: OutlineButton(
              splashColor: Colors.grey,
              onPressed: () { 
                signInWithGoogle().whenComplete( () { 
                  Navigator.of(context).push(MaterialPageRoute( 
                    builder: (context){ 
                      
                      return MainUser();
                    }
                  ));
                });
              },
              
              highlightElevation: 0,
              borderSide: BorderSide(color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: <Widget>[
                    
                    Image(image: AssetImage("assets/images/google_logo.png"), height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        _currentPage != 2
                      ?  Row(
                          children:<Widget>[
                            SizedBox(
                              width: 130,
                            ),
                            Container(
                              alignment: AlignmentDirectional.bottomCenter,
                              margin: EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  for(int i = 0; i<slideList.length; i++)
                                    if( i == _currentPage )
                                      SlideDot(true)
                                    else
                                      SlideDot(false)
                                ],
                              ),
                            ),
                        SizedBox(
                          width: 70,
                        ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                },
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.indigo.shade900,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                        ]
                        )
                        : Text('')
                      ],
                    ),
                  ]
                  ),
                ),
              _currentPage == 2
                  ? Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'Getting Started',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(15),
                        color: Colors.indigo.shade900,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pushNamed(SignUp.routeName);
                        },
                      ),
                      Row( 
          
                        children: <Widget>[
                          _signInButton(),
                        ]
                        
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Have an account?',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          FlatButton(
                            child: Text(
                              'Login',
                              style: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(Login.routeName);
                            },
                          ),
                        ],
                      ),
                    ],
                  )
              )
                  : Text(''),

            ],
          ),
        ),
      ),
    );
  }
}
