import 'package:flutter/material.dart';
import 'package:myfirstapp/pages/homescreen.dart';
import 'package:myfirstapp/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'images/Background/Switzerland.jpg',
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
                child: Form(
              key: formKey,
              child: Center(
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter email",
                            labelText: "Username",
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 90,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                    );
                                  },
                                  child: Text('Sign in'),
                                  color: Colors.white,
                                  textColor: Colors.black45,
                                ),
                                RaisedButton(
                                  onPressed: () async {
                                    dynamic result = await _auth.signInAnon();
                                    if (result == null) {
                                      print('cant sign in');
                                    } else {
                                      print('signed in');
                                      print(result.uid);
                                    }
                                  },
                                  child: Text('Sign in anonymously'),
                                  color: Colors.white,
                                  textColor: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ))
          ],
        ));
  }
}
