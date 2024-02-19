import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListView2 extends StatelessWidget {
  const ListView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("MyWidget"),
          actions: [
            IconButton(
                onPressed: () {
                  logoutUser(context);
                },
                icon: Icon(Icons.login_rounded))
          ],
        ),
        body: SafeArea(
            child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  "homepage2",
                  arguments: "index $index",
                );
              },
              title: Text("Hello $index"),
              subtitle: Text("Description of $index"),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.redAccent,
              ),
              trailing: Text("$index:00 pm"),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 30,
        )));
  }

  logoutUser(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginPageApp()),
      (route) => false,
    );
  }
}
