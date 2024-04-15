import 'package:flutter/material.dart';

class EquipePage extends StatelessWidget {
  final List<MembreEquipe> membres = [
    MembreEquipe(
      nom: 'John Doe',
      photoPath: 'assets/2.jpg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    MembreEquipe(
      nom: 'Jane Smith',
      photoPath: 'assets/1.jpg',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    ),
    // Ajoutez d'autres membres de l'équipe ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Équipe'),
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
