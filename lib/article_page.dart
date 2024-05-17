import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Article {
  final String categorie;
  final String nom;
  final String imageOuVideo;
  final String description;
  int likes;
  List<String> comments;

  Article({
    required this.categorie,
    required this.nom,
    required this.imageOuVideo,
    required this.description,
    this.likes = 0,
    List<String>? comments,
  }) : comments = comments ?? [];

  void addComment(String comment) {
    comments.add(comment);
  }

  void like() {
    likes++;
  }

  void unlike() {
    if (likes > 0) {
      likes--;
    }
  }
}

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
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
    Article(
      categorie: 'Formation Professionnelle',
      nom: 'Centre de formation professionnelle',
      imageOuVideo: 'assets/9.jpg',
      description:
          'Centre de formation professionnelle Informatique-Langues-Comptabilité-Cosmétique-Coaching Yaoundé, Cameroun.',
    ),
    Article(
      categorie: 'Soutien scolaire',
      nom: ' Académie Nationale d’orientation ',
      imageOuVideo: 'assets/4.jpg',
      description:
          'Académie Nationale d’orientation et de Référence à l’Excellence Scolaire Cours en ligne - Cours de répétitions - Cours à domicile - Cours du soir Enseignement Général Francophone et Anglophone - Enseignement Technique Industriel et Commercial.',
    ),
    Article(
      categorie: 'livre',
      nom: 'sous lombre de la mort',
      imageOuVideo: 'assets/15.jpg',
      description:
          'livre historique de réalités humaine , Edition : L’HARMATTAN.',
    ),
    Article(
      categorie: 'Cosmétique et prêt à porter',
      nom: 'MC TRENDS AND BEYONGS',
      imageOuVideo: 'assets/17.jpg',
      description: ' Achat en ligne, livraison, service express et sur mesure.',
    ),
    Article(
      categorie: 'Intelligence Artificielle',
      nom: 'TOUMPE CHAT BOT',
      imageOuVideo: 'assets/5.jpg',
      description: 'IA intégrée Commandes personnalisées',
    ),
  ];
  List<Article> filteredArticles = [];
  @override
  void initState() {
    super.initState();
    articles = articles;
    filteredArticles = articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Articles',
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
      body: Column(children: [
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              filterArticles(value);
            },
            decoration: InputDecoration(
              labelText: 'Rechercher un article',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Expanded(
          child: ListView.builder(
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
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                if (article.likes > 0) {
                                  article.like();
                                } else {
                                  article.like();
                                }
                              });
                            },
                            icon: Icon(article.likes > 0
                                ? Icons.thumb_up
                                : Icons.thumb_up),
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return article.likes > 0
                                      ? Colors.blue
                                      : Colors.blue;
                                },
                              ),
                            ),
                            label: Text(''),
                          ),
                          Text('${article.likes}',
                              style: TextStyle(fontSize: 16)),
                          TextButton.icon(
                            onPressed: () {
                              _showAddCommentDialog(context, article);
                            },
                            icon: Icon(Icons.comment),
                            label: Text(''),
                          ),
                          Text('${article.comments.length}',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    ListTile(
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
        ),
      ]),
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

  void filterArticles(String query) {
    setState(() {
      filteredArticles = articles.where((article) {
        final articleTitle = article.nom.toLowerCase();
        final searchLower = query.toLowerCase();

        return articleTitle.contains(searchLower);
      }).toList();
    });
  }

  void _showAddCommentDialog(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) {
        String? comment;

        return AlertDialog(
          title: Text('Ajouter un commentaire'),
          content: Container(
            width: 400, // Définir une largeur appropriée
            height: 300, // Définir une hauteur appropriée
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Commentaire'),
                  onChanged: (value) {
                    comment = value;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Commentaires existants :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: article.comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(article.comments[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
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
                if (comment != null) {
                  setState(() {
                    article.addComment(comment!);
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
              TextField(
                decoration: InputDecoration(labelText: 'Nom'),
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
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => _shareOnFacebook(article),
                    icon: const Icon(Icons.facebook),
                    color: const Color(0xFF1877F2),
                  ),
                  SizedBox(width: 16.0),
                  IconButton(
                    onPressed: () => _shareOnWhatsApp(article),
                    icon: const Icon(Icons.chat),
                    color: const Color(0xFF25D366),
                  ),
                  SizedBox(width: 16.0),
                  IconButton(
                    onPressed: () => _shareOnLinkedIn(article),
                    icon: const Icon(Icons.send),
                    color: const Color(0xFF0077B5),
                  ),
                ],
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
    final String encodedMessage = Uri.encodeComponent(
        'Nouvel article : ${article.nom}\n\n${article.description}\n\nCatégorie : ${article.categorie}');
    final String facebookUrl =
        'https://www.facebook.com/sharer/sharer.php?u=$encodedMessage';

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
      print('Article partagé avec succès sur Facebook');
    } else {
      print('Impossible de partager l\'article sur Facebook');
    }
  }

  void _shareOnWhatsApp(Article article) async {
    final String encodedMessage = Uri.encodeComponent(
        'Nouvel article : ${article.nom}\n\n${article.description}\n\nCatégorie : ${article.categorie}');
    final String whatsappUrl = 'https://wa.me/?text=$encodedMessage';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
      print('Article partagé avec succès sur WhatsApp');
    } else {
      print('Impossible de partager l\'article sur WhatsApp');
    }
  }

  void _shareOnLinkedIn(Article article) async {
    final String encodedMessage = Uri.encodeComponent(
        'Nouvel article : ${article.nom}\n\n${article.description}\n\nCatégorie : ${article.categorie}');
    final String linkedInUrl =
        'https://www.linkedin.com/sharing/share-offsite/?url=$encodedMessage';

    if (await canLaunch(linkedInUrl)) {
      await launch(linkedInUrl);
      print('Article partagé avec succès sur LinkedIn');
    } else {
      print('Impossible de partager l\'article sur LinkedIn');
    }
  }
}
