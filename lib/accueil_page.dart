import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Article {
  final String categorie;
  final String nom;
  final String imageOuVideo;
  final String description;

  Article({
    required this.categorie,
    required this.nom,
    required this.imageOuVideo,
    required this.description,
  });
}

class AccueilPage extends StatelessWidget {
  final String facebookUrl =
      "https://www.facebook.com/people/Publicit%C3%A9-Sponsoris%C3%A9e/61557517596818/?mibextid=LQQJ4d";

  List<Article> articles = [
    Article(
      categorie: 'Digital et Edition',
      nom: 'Agence de Marketing Digital',
      imageOuVideo: 'assets/3.jpg',
      description:
          'Agence de Marketing Digital Graphisme de production - Edition - Marketing - Développement web RCCM N° RC/YAO/2017/A/1831 NIU : M071718160875T Yaoundé, Cameroun .',
    ),
    Article(
      categorie: 'design',
      nom: 'Bracelet',
      imageOuVideo: 'assets/6.jpg',
      description: 'Bracelet personnalisé et chaines couples (acrylique).',
    ),
    Article(
      categorie: 'appareils électroniques',
      nom: ' airpods Pro ',
      imageOuVideo: 'assets/14.jpg',
      description:
          'appareils électroniques airpods Pro bleutooh complet et propre.',
    ),
    // Ajoutez d'autres articles ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              '📢 publicité sponsorisée',
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenue sur le Blog',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Présentation de la publicité sponsorisée',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Derniers articles',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final article = articles[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/articles');
                            },
                            child: ListTile(
                              leading: Hero(
                                tag: article.imageOuVideo,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(article.imageOuVideo),
                                ),
                              ),
                              title: Text(article.nom),
                              subtitle: Text(article.categorie),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Inscrivez-vous pour rester informé',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Votre adresse e-mail',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          // Action lorsque le bouton est pressé
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.person_add),
                            SizedBox(width: 8.0),
                            Text('S\'inscrire'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
