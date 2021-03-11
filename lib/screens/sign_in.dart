import 'package:flutter/material.dart';
import 'package:qvid/services/auth.dart';
import 'package:qvid/utils/loading.dart';

class SignIn extends StatefulWidget {
  final Function? toggleView;

  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Center(
                child: Text(
                  'QuantaVid',
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Image.asset(
                            'images/logo.jpeg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          validator: (val) =>
                              val!.length < 6 ? 'Enter an password 6' : null,
                          obscureText: true,
                          autofocus: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 40.0),
                        ElevatedButton(
                          child: Text(
                            'Sign In',
                          ),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.signIn(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'please supply a valid email ';
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Not Registered?'),
                            TextButton.icon(
                              icon: Icon(Icons.signal_cellular_alt_sharp),
                              label: Text('Sign Up'),
                              onPressed: () {
                                widget.toggleView!();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          );
  }
}
