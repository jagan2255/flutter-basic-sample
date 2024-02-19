import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final textInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    checkToken(context);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Login User",
        style: TextStyle(fontSize: 22),
      )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            children: [
              Text(
                'Login User',
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                controller: textInput,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: 'Enter your password here',
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    String text = textInput.text;
                    saveToken(text);

                    Navigator.of(context).pushNamed("screen2");
                  },
                  child: Text("Login"))
            ],
          ),
        ),
      )),
    );
  }
}

saveToken(i) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', i);
  return true;
}

checkToken(BuildContext context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('user');
  if (token != null) {
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed("screen2");
  }
}
