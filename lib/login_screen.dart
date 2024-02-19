import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageApp extends StatefulWidget {
  LoginPageApp({Key? key}) : super(key: key);

  @override
  _LoginPageAppState createState() => _LoginPageAppState();
}

class _LoginPageAppState extends State<LoginPageApp> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _showUsernameError = false;
  bool _showPasswordError = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Login User",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _showUsernameError ? Colors.red : Colors.black,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Enter your username',
                    errorText:
                        _showUsernameError ? 'Please enter a username' : null,
                  ),
                  onChanged: (_) {
                    setState(() {
                      _showUsernameError = _username.text.isEmpty;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'Enter your password',
                  ),
                  onChanged: (_) {
                    setState(() {
                      _showPasswordError = _password.text.isEmpty;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      validateCredentials(context);
                    }
                  },
                  child: Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateCredentials(BuildContext context) async {
    final String enteredUsername = _username.text;
    final String enteredPassword = _password.text;

    // Here you would typically perform validation logic, such as checking against a database or API.
    // For demonstration purposes, let's assume we have hardcoded values for username and password.
    const String correctUsername = 'admin';
    const String correctPassword = 'password';

    if (enteredUsername == correctUsername &&
        enteredPassword == correctPassword) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('user', true);
      Navigator.of(context).pushReplacementNamed('homepage');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Incorrect username or password'),
        ),
      );
    }
  }
}
