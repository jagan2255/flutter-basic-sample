import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/screen-second.dart';
import 'package:flutter_application_1/screen_listview.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

import 'db/models/student_list_model.dart';

main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      home: const SplashScreen(),
      routes: {
        'login': (ctx) {
          return LoginPageApp();
        },
        'homepage': (ctx) {
          return ListView2();
        },
        'homepage2': (ctx) {
          return MySecondWidget();
        },
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 66, 97, 183),
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 6.0, // Border width
                ),
              ),
              child: const Text(
                "Hello Lokame",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 197, 177, 177),
                  fontSize: 33,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            TextButton(onPressed: () {}, child: const Text("hello")),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellowAccent),
                ),
                onPressed: () {},
                child: const Text(
                  "Click Meee",
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
