import 'package:flutter/material.dart';
import 'package:qvid/services/auth.dart';

class Register extends StatefulWidget {
  final Function? toggleView;

  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Register',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),
                  validator: (val) => val!.isEmpty ? 'Enter name' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (val) =>
                      val!.length < 8 ? 'Enter an password 8' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text(
                    'Sign Up',
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result =
                          await _auth.signUp(email, password, name);
                      if (result == null) {
                        setState(() => error = 'please supply a valid email ');
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Registered'),
                    TextButton.icon(
                      icon: Icon(Icons.signal_cellular_alt_sharp),
                      label: Text('Sign In'),
                      onPressed: () {
                        widget.toggleView!();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
