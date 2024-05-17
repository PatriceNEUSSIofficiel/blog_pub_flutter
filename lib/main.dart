import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'a_propos_page.dart';
import 'article_page.dart';
import 'contact_page.dart';
import 'accueil_page.dart';
import 'presentation.dart';
import 'init.dart';
import 'login.dart';
import 'signup.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votre application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/accueil': (context) => AccueilPage(),
        '/articles': (context) => ArticlesPage(),
        '/contact': (context) => ContactPage(),
        '/a_propos': (context) => AProposPage(),
        '/equipe': (context) => EquipePage(),
        '/init': (context) => MyInit(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(
            'assets/logo.jpg',
            width: 250.0,
            height: 250.0,
          ),
        ),
      ),
    );
  }
}
