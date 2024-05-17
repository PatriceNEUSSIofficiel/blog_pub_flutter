import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'a_propos_page.dart';
import 'article_page.dart';
import 'contact_page.dart';
import 'accueil_page.dart';
import 'presentation.dart';

class MyInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '📢  publicité sponsorisée',
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        ),
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
      routes: {
        '/accueil': (context) => AccueilPage(),
        '/articles': (context) => ArticlesPage(),
        '/contact': (context) => ContactPage(),
        '/a_propos': (context) => AProposPage(),
        '/equipe': (context) => EquipePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final String facebookUrl =
      "https://www.facebook.com/people/Publicit%C3%A9-Sponsoris%C3%A9e/61557517596818/?mibextid=LQQJ4d";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '📢  publicité sponsorisée',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.facebook),
            onPressed: () {
              launch(facebookUrl);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Image.asset(
              'assets/logo.jpg',
              width: 250.0,
              height: 250.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bienvenue dans notre Blog de publicité sponsorisée',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Découvrez les dernières tendances en matière de publicité sponsorisée et augmentez la visibilité de votre entreprise.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccueilPage()),
                );
              },
              child: Text(
                'Découvrir',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 128,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'assets/q.jpg',
              height: 100.0,
              width: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
