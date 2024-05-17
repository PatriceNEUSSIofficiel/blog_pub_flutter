import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EquipePage extends StatelessWidget {
  final String facebookUrl =
      "https://www.facebook.com/people/Publicit%C3%A9-Sponsoris%C3%A9e/61557517596818/?mibextid=LQQJ4d";
  final List<MembreEquipe> membres = [
    MembreEquipe(
      nom: 'Marguerite BISSA',
      photoPath: 'assets/12.jpg',
      description: 'Chef d’équipe : Humanités Numériques.',
    ),
    MembreEquipe(
      nom: 'TOumpé ERIC',
      photoPath: 'assets/13.jpg',
      description:
          'Professeur des Lycées | Vice Coordonateur National de l’association des Professeurs d’informatique du Cameroun (PIC) | Certifié CISCO en Technologie Web et Sécurité Informatique | Certifié par Google en Cloud Engineering.',
    ),
    MembreEquipe(
      nom: 'Marguerite BISSA',
      photoPath: 'assets/q.jpg',
      description: 'Membre de l’équipe',
    ),
    MembreEquipe(
      nom: 'NGWAMBE MARIELLA ',
      photoPath: 'assets/q.jpg',
      description: 'Membre de l’équipe',
    ),
    MembreEquipe(
      nom: 'WANSI GILLES',
      photoPath: 'assets/20.jpg',
      description: 'Membre de l’équipe',
    ),
    MembreEquipe(
      nom: 'MEKOULOU GRAZIELLA',
      photoPath: 'assets/q.jpg',
      description: 'Membre de l’équipe',
    ),
    // Ajoutez d'autres membres de l'équipe ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Équipe',
              style: TextStyle(color: Colors.white),
              ),
          ],
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: membres.length,
          itemBuilder: (context, index) {
            final membre = membres[index];
            return ExpansionTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(membre.photoPath),
              ),
              title: Text(
                membre.nom,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 8, 8),
                ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    membre.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: const Color.fromARGB(255, 20, 19, 19),
                    ),
                  ),
                ),
              ],
            );
          },
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
              Navigator.pushNamed(context, '/a_propos');
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
            icon: Icon(Icons.group),
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

class MembreEquipe {
  final String nom;
  final String photoPath;
  final String description;

  MembreEquipe({
    required this.nom,
    required this.photoPath,
    required this.description,
  });
}
