import 'package:flutter/material.dart';

class AProposPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('À propos'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.facebook),
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton Facebook
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'À propos de notre blog',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bienvenue sur notre blog où vous pouvez trouver des articles intéressants sur une variété de sujets.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Image.asset(
              'assets/logo.jpg',
              height: 120.0,
              width: 150.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Nous sommes passionnés par le partage de connaissances et nous espérons que vous trouverez nos articles utiles et informatifs.',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de présentation de l'équipe
                Navigator.pushNamed(context, '/equipe');
              },
              child: Text('Présenter l\'équipe'),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/accueil');
              break;
            case 1:
              Navigator.pushNamed(context, '/articles');
              break;
            case 2:
              // Restez sur la page À propos
              break;
            case 3:
              Navigator.pushNamed(context, '/contact');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'À propos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
