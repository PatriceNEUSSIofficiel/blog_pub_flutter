import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<Article> articles = [
    Article(
      categorie: 'Chaines',
      nom: 'Article 1',
      imageOuVideo: 'assets/6.jpg',
      description: 'Description de l\'article 1.',
    ),
    Article(
      categorie: 'Logos',
      nom: ' cube ',
      imageOuVideo: 'assets/8.jpg',
      description: 'PRODUIT LOCAL.',
    ),
    Article(
      categorie: 'Huiles',
      nom: 'Article 3',
      imageOuVideo: 'assets/3.jpg',
      description: 'Description de l\'article 3.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Articles'),
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
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    article.nom,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.asset(
                    article.imageOuVideo,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    article.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(article.nom),
                            content: SingleChildScrollView(
                              child: Text(article.description),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Fermer'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Lire la suite',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(article.categorie),
                  trailing: IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      _showShareDialog(context, article);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddArticleDialog(context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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

  void _showAddArticleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String? categorie;
        String? nom;
        String? imageOuVideo;
        String? description;

        return AlertDialog(
          title: Text('Ajouter un nouvel article'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Catégorie'),
                onChanged: (value) {
                  categorie = value;
                },
              ),
              TextField(decoration: InputDecoration(labelText: 'Nom'),
                onChanged: (value) {
                  nom = value;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImageOrVideo().then((file) {
                    if (file != null) {
                      setState(() {
                        imageOuVideo = file.path;
                      });
                    }
                  });
                },
                child: Text('Sélectionner une image ou une vidéo'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  description = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Enregistrer'),
              onPressed: () {
                if (categorie != null &&
                    nom != null &&
                    imageOuVideo != null &&
                    description != null) {
                  setState(() {
                    articles.add(Article(
                      categorie: categorie!,
                      nom: nom!,
                      imageOuVideo: imageOuVideo!,
                      description: description!,
                    ));
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<File?> _pickImageOrVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }

    return null;
  }

  void _showShareDialog(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Partager l\'article'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Sélectionnez un réseau social pour partager l\'article.'),
              ElevatedButton(
                onPressed: () {
                  _shareOnFacebook(article);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12.0),
                    Image.asset(
                      'assets/f.jpeg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _shareOnFacebook(Article article) async {
    final encodedMessage =
        Uri.encodeComponent('Nouvel article : ${article.nom}');
    final facebookUrl =
        'https://www.facebook.com/sharer/sharer.php?u=$encodedMessage';

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
      print('Article partagé avec succès sur Facebook');
    } else {
      print('Impossible de partager l\'article sur Facebook');
    }
  }
}