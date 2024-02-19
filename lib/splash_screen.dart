import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    isTokenPresent(context);
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("Splash Screen")),
      ),
    );
  }

  Future<void> CheckIsLogin(ctx) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(ctx).pushReplacementNamed('login');
  }

  Future<void> isTokenPresent(ctx) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isPresent = await prefs.getBool('user');
    if (isPresent == null || isPresent == false) {
      CheckIsLogin(ctx);
    } else {
      Navigator.of(ctx).pushReplacementNamed('homepage');
    }
  }
}
